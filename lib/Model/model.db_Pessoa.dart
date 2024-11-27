import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'model.db_Pessoa.g.dart';

@DriftDatabase(tables: [Pessoas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    String executablePath = Platform.resolvedExecutable;
    String path =
        executablePath.replaceAll('\\${p.basename(executablePath)}', '');
    final file = File(p.join(path, 'database.db'));
    return NativeDatabase(file);
  });
}

class Pessoas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 100)();
  TextColumn get telefone => text().withLength(min: 1, max: 30)();
  TextColumn get endereco => text().withLength(min: 1, max: 150)();
  DateTimeColumn get dataNasc => dateTime().nullable()();
}

class ModelDBPessoa {
  final AppDatabase database;

  ModelDBPessoa(this.database);

  Future<List<Pessoa>> getPessoas() async {
    return await database.select(database.pessoas).get();
  }

  Future<void> addPessoa(
      String nome, String telefone, String endereco, DateTime dataNasc) async {
    await database.into(database.pessoas).insert(
          PessoasCompanion(
            nome: Value(nome),
            telefone: Value(telefone),
            endereco: Value(endereco),
            dataNasc: Value(dataNasc),
          ),
        );
  }

  Future<int> deletarPessoa(int id) async {
    return await (database.delete(database.pessoas)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> printPessoas() async {
    final pessoas = await getPessoas();
    for (var pessoa in pessoas) {
      print('Nome: ${pessoa.nome}, Idade: ${pessoa.endereco}');
    }
  }

  Future<void> atualizarPessoa(int id, String nome, String telefone,
      String endereco, DateTime dataNasc) async {
    await database.update(database.pessoas).replace(
          PessoasCompanion(
            id: Value(id),
            nome: Value(nome),
            telefone: Value(telefone),
            endereco: Value(endereco),
            dataNasc: Value(dataNasc),
          ),
        );
  }
}
