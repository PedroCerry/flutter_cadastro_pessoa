import 'package:flutter/material.dart';
import 'package:flutter_teste_sinnc/Model/model.class_pessoa.dart';
import 'package:flutter_teste_sinnc/Model/model.db_Pessoa.dart';
import 'package:flutter_teste_sinnc/View/view.cadastro.dart';
import 'package:flutter_teste_sinnc/controller/controller.pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final database = AppDatabase();
  final List<ClassPessoa> _pessoasLista = [];

  Future<List<ClassPessoa>> get alimentarLista async {
    final controllerPessoa = ControllerPessoa();
    _pessoasLista.clear();
    final pessoas = await controllerPessoa.getPessoas();
    for (var pessoa in pessoas) {
      final newPessoa = ClassPessoa(
        id: pessoa.id,
        nome: pessoa.nome,
        telefone: pessoa.telefone,
        endereco: pessoa.endereco,
        dataNasc: pessoa.dataNasc,
      );
      _pessoasLista.add(newPessoa);
    }

    return _pessoasLista;
  }

  _retornarPessoa(int id, String nome, String telefone, String endereco,
      DateTime dateNasc) async {
    if (id == 0) {
      _adicionarPessoa(nome, telefone, endereco, dateNasc);
    } else {
      _atualizarPessoa(id, nome, telefone, endereco, dateNasc);
    }
    setState(() {
      _pessoasLista;
    });
    Navigator.of(context).pop();
  }

  _atualizarPessoa(int id, String nome, String telefone, String endereco,
      DateTime dateNasc) async {
    final controllerPessoa = ControllerPessoa();
    controllerPessoa.atualizarPessoa(id, nome, telefone, endereco, dateNasc);
    alimentarLista;
  }

  _adicionarPessoa(
      String nome, String telefone, String endereco, DateTime dateNasc) async {
    final controllerPessoa = ControllerPessoa();
    controllerPessoa.addPessoa(nome, telefone, endereco, dateNasc);
    alimentarLista;
  }

  _deletarPessoa(int id) async {
    final controllerPessoa = ControllerPessoa();
    controllerPessoa.deletarPessoa(id);
    alimentarLista;
    setState(() {
      _pessoasLista;
    });
  }

  _abrirPessoaCadastro(BuildContext context, [ClassPessoa? pessoa]) {
    final novaPessoa =
        pessoa ?? ClassPessoa(id: 0, nome: '', telefone: '', endereco: '');
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CadastroPessoaform(_retornarPessoa, novaPessoa);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: FloatingActionButton(
                  onPressed: () => _abrirPessoaCadastro(context),
                  tooltip: 'Incluir',
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ClassPessoa>>(
              future: alimentarLista,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('Nenhuma pessoa Cadastrada!'));
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        final tr = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(tr.nome),
                            subtitle: Text(tr.telefone),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    tooltip: 'Editar',
                                    onPressed: () {
                                      _abrirPessoaCadastro(context, tr);
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    tooltip: 'Excluir',
                                    onPressed: () {
                                      _deletarPessoa(tr.id);
                                    },
                                    icon: const Icon(Icons.cancel)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
