// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.db_Pessoa.dart';

// ignore_for_file: type=lint
class $PessoasTable extends Pessoas with TableInfo<$PessoasTable, Pessoa> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PessoasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _enderecoMeta =
      const VerificationMeta('endereco');
  @override
  late final GeneratedColumn<String> endereco = GeneratedColumn<String>(
      'endereco', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dataNascMeta =
      const VerificationMeta('dataNasc');
  @override
  late final GeneratedColumn<DateTime> dataNasc = GeneratedColumn<DateTime>(
      'data_nasc', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nome, telefone, endereco, dataNasc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pessoas';
  @override
  VerificationContext validateIntegrity(Insertable<Pessoa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    } else if (isInserting) {
      context.missing(_telefoneMeta);
    }
    if (data.containsKey('endereco')) {
      context.handle(_enderecoMeta,
          endereco.isAcceptableOrUnknown(data['endereco']!, _enderecoMeta));
    } else if (isInserting) {
      context.missing(_enderecoMeta);
    }
    if (data.containsKey('data_nasc')) {
      context.handle(_dataNascMeta,
          dataNasc.isAcceptableOrUnknown(data['data_nasc']!, _dataNascMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pessoa map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pessoa(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone'])!,
      endereco: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endereco'])!,
      dataNasc: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}data_nasc']),
    );
  }

  @override
  $PessoasTable createAlias(String alias) {
    return $PessoasTable(attachedDatabase, alias);
  }
}

class Pessoa extends DataClass implements Insertable<Pessoa> {
  final int id;
  final String nome;
  final String telefone;
  final String endereco;
  final DateTime? dataNasc;
  const Pessoa(
      {required this.id,
      required this.nome,
      required this.telefone,
      required this.endereco,
      this.dataNasc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['telefone'] = Variable<String>(telefone);
    map['endereco'] = Variable<String>(endereco);
    if (!nullToAbsent || dataNasc != null) {
      map['data_nasc'] = Variable<DateTime>(dataNasc);
    }
    return map;
  }

  PessoasCompanion toCompanion(bool nullToAbsent) {
    return PessoasCompanion(
      id: Value(id),
      nome: Value(nome),
      telefone: Value(telefone),
      endereco: Value(endereco),
      dataNasc: dataNasc == null && nullToAbsent
          ? const Value.absent()
          : Value(dataNasc),
    );
  }

  factory Pessoa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pessoa(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      telefone: serializer.fromJson<String>(json['telefone']),
      endereco: serializer.fromJson<String>(json['endereco']),
      dataNasc: serializer.fromJson<DateTime?>(json['dataNasc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'telefone': serializer.toJson<String>(telefone),
      'endereco': serializer.toJson<String>(endereco),
      'dataNasc': serializer.toJson<DateTime?>(dataNasc),
    };
  }

  Pessoa copyWith(
          {int? id,
          String? nome,
          String? telefone,
          String? endereco,
          Value<DateTime?> dataNasc = const Value.absent()}) =>
      Pessoa(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        telefone: telefone ?? this.telefone,
        endereco: endereco ?? this.endereco,
        dataNasc: dataNasc.present ? dataNasc.value : this.dataNasc,
      );
  Pessoa copyWithCompanion(PessoasCompanion data) {
    return Pessoa(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      endereco: data.endereco.present ? data.endereco.value : this.endereco,
      dataNasc: data.dataNasc.present ? data.dataNasc.value : this.dataNasc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pessoa(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('telefone: $telefone, ')
          ..write('endereco: $endereco, ')
          ..write('dataNasc: $dataNasc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, telefone, endereco, dataNasc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pessoa &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.telefone == this.telefone &&
          other.endereco == this.endereco &&
          other.dataNasc == this.dataNasc);
}

class PessoasCompanion extends UpdateCompanion<Pessoa> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> telefone;
  final Value<String> endereco;
  final Value<DateTime?> dataNasc;
  const PessoasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.telefone = const Value.absent(),
    this.endereco = const Value.absent(),
    this.dataNasc = const Value.absent(),
  });
  PessoasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String telefone,
    required String endereco,
    this.dataNasc = const Value.absent(),
  })  : nome = Value(nome),
        telefone = Value(telefone),
        endereco = Value(endereco);
  static Insertable<Pessoa> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? telefone,
    Expression<String>? endereco,
    Expression<DateTime>? dataNasc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (telefone != null) 'telefone': telefone,
      if (endereco != null) 'endereco': endereco,
      if (dataNasc != null) 'data_nasc': dataNasc,
    });
  }

  PessoasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? telefone,
      Value<String>? endereco,
      Value<DateTime?>? dataNasc}) {
    return PessoasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
      dataNasc: dataNasc ?? this.dataNasc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (endereco.present) {
      map['endereco'] = Variable<String>(endereco.value);
    }
    if (dataNasc.present) {
      map['data_nasc'] = Variable<DateTime>(dataNasc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PessoasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('telefone: $telefone, ')
          ..write('endereco: $endereco, ')
          ..write('dataNasc: $dataNasc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PessoasTable pessoas = $PessoasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pessoas];
}

typedef $$PessoasTableCreateCompanionBuilder = PessoasCompanion Function({
  Value<int> id,
  required String nome,
  required String telefone,
  required String endereco,
  Value<DateTime?> dataNasc,
});
typedef $$PessoasTableUpdateCompanionBuilder = PessoasCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<String> telefone,
  Value<String> endereco,
  Value<DateTime?> dataNasc,
});

class $$PessoasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PessoasTable,
    Pessoa,
    $$PessoasTableFilterComposer,
    $$PessoasTableOrderingComposer,
    $$PessoasTableCreateCompanionBuilder,
    $$PessoasTableUpdateCompanionBuilder> {
  $$PessoasTableTableManager(_$AppDatabase db, $PessoasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PessoasTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PessoasTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> telefone = const Value.absent(),
            Value<String> endereco = const Value.absent(),
            Value<DateTime?> dataNasc = const Value.absent(),
          }) =>
              PessoasCompanion(
            id: id,
            nome: nome,
            telefone: telefone,
            endereco: endereco,
            dataNasc: dataNasc,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required String telefone,
            required String endereco,
            Value<DateTime?> dataNasc = const Value.absent(),
          }) =>
              PessoasCompanion.insert(
            id: id,
            nome: nome,
            telefone: telefone,
            endereco: endereco,
            dataNasc: dataNasc,
          ),
        ));
}

class $$PessoasTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PessoasTable> {
  $$PessoasTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get endereco => $state.composableBuilder(
      column: $state.table.endereco,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dataNasc => $state.composableBuilder(
      column: $state.table.dataNasc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PessoasTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PessoasTable> {
  $$PessoasTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get telefone => $state.composableBuilder(
      column: $state.table.telefone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get endereco => $state.composableBuilder(
      column: $state.table.endereco,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dataNasc => $state.composableBuilder(
      column: $state.table.dataNasc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PessoasTableTableManager get pessoas =>
      $$PessoasTableTableManager(_db, _db.pessoas);
}
