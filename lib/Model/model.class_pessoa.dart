class ClassPessoa {
  final int id;
  final String nome;
  final String telefone;
  final String endereco;
  final DateTime? dataNasc;

  ClassPessoa(
      {required this.id,
      required this.nome,
      required this.telefone,
      required this.endereco,
      this.dataNasc});
}
