import 'package:flutter_teste_sinnc/Model/model.db_Pessoa.dart';

class ControllerPessoa {
  late final AppDatabase _database;

  ControllerPessoa() {
    _database = AppDatabase();
  }

  Future<List<Pessoa>> getPessoas() async {
    final dbPessoa = ModelDBPessoa(_database);
    return await dbPessoa.getPessoas();
  }

  Future<void> addPessoa(
      String nome, String telefone, String endereco, DateTime dataNasc) async {
    final dbPessoa = ModelDBPessoa(_database);
    await dbPessoa.addPessoa(nome, telefone, endereco, dataNasc);
  }

  Future<void> printPessoas(
      String nome, String telefone, String endereco, DateTime dateNasc) async {
    final dbPessoa = ModelDBPessoa(_database);
    await dbPessoa.printPessoas();
  }

  Future<void> deletarPessoa(int id) async {
    final dbPessoa = ModelDBPessoa(_database);
    dbPessoa.deletarPessoa(id);
  }

  Future<void> atualizarPessoa(int id, String nome, String telefone,
      String endereco, DateTime dataNasc) async {
    final dbPessoa = ModelDBPessoa(_database);
    dbPessoa.atualizarPessoa(id, nome, telefone, endereco, dataNasc);
  }
}
