drop table if exists Time_Participa_Partida;
drop table if exists Campeonato_Registra_Time;
drop table if exists Funcionarios_Trabalham_Partida;
drop table if exists Partida;
drop table if exists Campeonato;
drop table if exists Estadio;
drop table if exists Localizacao;
drop table if exists Jogadores;
drop table if exists Times;
drop table if exists Tecnico;
drop table if exists Juiz;
drop table if exists Bandeirinha;
drop table if exists Narrador;
drop table if exists Funcionarios;

create table Campeonato(
	ID_Campeonato varchar(100),
    Data_Inicio varchar(100),
    Data_Final varchar(100),
    primary key(ID_Campeonato)
); 

create table Tecnico(
	Cpf char(11),
    Nome varchar(100),
    Salario integer,
    primary key(Cpf)
);

create table Times(
	ID_Time varchar(100),
    Simbolo_Time varchar(100),
    Numero_de_Jogadores integer,
    Cpf_Tecnico varchar(11),
    foreign key(Cpf_Tecnico) references Tecnico(Cpf),
	primary key(ID_Time)
);

create table Campeonato_Registra_Time(
	Data_Registro varchar(100),
    Nome_Campeonato varchar(100),
    Nome_Time varchar(100),
    foreign key(Nome_Campeonato) references Campeonato(ID_Campeonato),
    foreign key(Nome_Time) references Times(ID_Time),
	primary key(Nome_Campeonato, Nome_Time)
);

create table Localizacao(
	Cidade varchar(100),
    Bairro varchar(100),
    Endereco varchar(100),
    primary key(Cidade)
);

create table Estadio(
	Nome varchar(100),
    Tamanho integer,
    Numero_Lugares integer,
    Cidade_Localizacao varchar(100),
    foreign key(Cidade_Localizacao) references Localizacao(Cidade),
    primary key(Nome)
);

create table Partida(
	Times varchar(100),
    Duracao integer,
    Quantidade_Faltas integer,
    Nome_Estadio varchar(100),
    Nome_Campeonato varchar(100),
    foreign key(Nome_Estadio) references Estadio(Nome),
    foreign key(Nome_Campeonato) references Campeonato(ID_Campeonato),
	primary key(Times)
);

create table Time_Participa_Partida(
	Times_Partidas varchar(100),
    Nome_Time varchar(100),
    foreign key(Times_Partidas) references Partida(Times),
    foreign key(Nome_Time) references Times(ID_Time),
	primary key(Times_Partidas, Nome_Time)
);

create table Jogadores(
	Cpf char(11),
    Nome varchar(100),
    Salario integer,
    Peso integer,
    Idade integer,
    Sexo char(1),
    Nome_Time varchar(100),
    foreign key(Nome_Time) references Times(ID_Time),
    primary key(Cpf)
);

create table Funcionarios(
	Cpf char(11),
    Nome varchar(100),
    Salario integer,
    primary key(Cpf)
);

create table Juiz(
	Cpf char(11),
    Quantidade_Cartao_Vermelho integer,
    Quantidade_Cartao_Amarelo integer,
    foreign key(Cpf) references Funcionarios(Cpf),
    primary key(Cpf)
);

create table Bandeirinha(
	Cpf char(11),
    Quantidade_Impedimentos integer,
    foreign key(Cpf) references Funcionarios(Cpf),
    primary key(Cpf)
);

create table Narrador(
	Cpf char(11),
    Sala_Exclusiva varchar(100),
    foreign key(Cpf) references Funcionarios(Cpf),
    primary key(Cpf)
);

create table Funcionarios_Trabalham_Partida(
	Cpf_Funcionario char(11),
    Times_Partida varchar(100),
    foreign key(Times_Partida) references Partida(Times),
    foreign key(Cpf_Funcionario) references Funcionarios(Cpf),
    primary key(Cpf_Funcionario, Times_Partida)
);
