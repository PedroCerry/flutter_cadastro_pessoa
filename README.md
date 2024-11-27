# Objetivo
Projeto criado para que o usuário consiga cadastrar, editar e deletar pessoas em um banco de dados local.

# Como usar
No botão da tela principal existe um botâo verde com sibolo de "mais(+)", o mesmo é usado para incluir uma nova pessoa no banco de dados.
Quando já existir uma pessoa cadastrada, será habilitado mais dois botões no lado de cada pessoa, tendo as seguintes funcionalidades:
    - Botâo que apresenta a imagem de um lápis é usado para editar o cadastro, onde será aberto os campos previamente preenchidos.
    - Botâo que apresenta a imagem de um "X" é usado para excluir a pessoa selecionada.

# Configurações Nescessárias
Deve ser colocado o banco de dados "database.db" no mesmo local onde o executável esta sendo executado para que seja possível ler as informações.

# Explicação do código
[View]
    - Nos arquivos main.dart e view.cadastro.dart foram adicionados apenas o componentes visuáis para o usário, contudo, no arquivo pirncipal, exitem a chamada dos botões,
    onde os mesmos chamam o controller.pessoa.

[Controller]
    - No arquivo controller.pessoa.dart foram adicionadas chamadas para o model.db_Pessoa.dart, onde fica a gravação do banco de dados, assim, não precisando que a camada view tenha acesso aos métodos do model, gerando menos e acopalemnto e deixando centralizado em um fonte as chamadas.

[Model]
    - No arquivo model.db_Pessoa.dart foram adicionadas métodos de conexão com banco de dados, inclusão, edição e exclussão das pessoas. Com isso, nese fonte ficou separado apenas a parte de banco de dados e que futuramente poderia ser alocada a regra de negócio do sistema.
    - No arquivo model.class_pessoa.dart ficou alocado apenas a criação da classe Pessoa.

# Banco de dados
No banco de dados foi criado apenas uma tabela chamada de "pessoas", nessa tabela foi criada os seguintes campos:
    -[id] Esse campo foi usado como primary key do banco, onde era do tipo inteiro e de auto incremeto.
    -[nome] Esse campo foi usado para armazenar o nome da pessoa, sendo do tipo VARCHAR(100).
    -[telefone] Esse campo foi usado para armazenar o telefone da pessoa, sendo do tipo VARCHAR(30).
    -[endereco] Esse campo foi usado para armazenar o endereço da pessoa, sendo do tipo VARCHAR(150).
    -[dataNasc] Esse campo foi usado para armazenar a data de nascimento da pessoa, sendo do tipo DATETIME.
    
Foi usado o seguinte comando para a criação:
    -CREATE TABLE pessoas(id integer PRIMARY KEY AUTOINCREMENT NOT NULL,nome VARCHAR(100),telefone VARCHAR(30),endereco VARCHAR(150),data_nasc DATETIME);