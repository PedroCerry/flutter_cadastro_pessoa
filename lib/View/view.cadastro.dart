import 'package:flutter/material.dart';
import 'package:flutter_teste_sinnc/Model/model.class_pessoa.dart';
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';

class CadastroPessoaform extends StatefulWidget {
  final Function(int, String, String, String, DateTime) onSubmit;
  final ClassPessoa? pessoa;

  CadastroPessoaform(
    this.onSubmit,
    this.pessoa,
  );
  @override
  State<CadastroPessoaform> createState() => _CadastroPessoaformState();
}

class _CadastroPessoaformState extends State<CadastroPessoaform> {
  late TextEditingController _nomeController = TextEditingController();
  late TextEditingController _telefoneController = TextEditingController();
  late TextEditingController _enderecoController = TextEditingController();
  late TextEditingController _dataController = TextEditingController();
  late bool ehInclusao;
  late int idPessoa;

  _submitForm() {
    final id = idPessoa;
    final nome = _nomeController.text;
    final telefone = _telefoneController.text;
    final endereco = _enderecoController.text;
    final dataNasc = DateFormat('dd/mm/yyyy').parse(_dataController.text);

    if (nome.isEmpty ||
        telefone.isEmpty ||
        endereco.isEmpty ||
        dataNasc.toString().isEmpty) {
      return;
    }

    widget.onSubmit(id, nome, telefone, endereco, dataNasc);
  }

  @override
  void initState() {
    super.initState();

    idPessoa = widget.pessoa?.id ?? 0;
    ehInclusao = idPessoa == 0;
    _nomeController =
        TextEditingController(text: ehInclusao ? '' : widget.pessoa?.nome);
    _telefoneController =
        TextEditingController(text: ehInclusao ? '' : widget.pessoa?.telefone);
    _enderecoController =
        TextEditingController(text: ehInclusao ? '' : widget.pessoa?.endereco);
    final DateTime dataInicial = widget.pessoa?.dataNasc ?? DateTime.now();
    _dataController = TextEditingController(
        text: ehInclusao ? '' : DateFormat('dd/MM/yyyy').format(dataInicial));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endreço',
              ),
            ),
            MaskedTextField(
              controller: _telefoneController,
              mask: "(##) # ####-####",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            MaskedTextField(
              controller: _dataController,
              mask: "##/##/####",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Data de Nascimento",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: Text(
                        widget.pessoa?.id == 0
                            ? 'Adicionar Pessoa'
                            : 'Alterar Pessoa',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _enderecoController.dispose();
    _dataController.dispose();
    super.dispose();
  }
}
