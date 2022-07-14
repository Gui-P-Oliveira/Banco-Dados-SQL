create database pesqueiros;

create table PESQUEIRO(
	ID serial primary key,
	ID_ENDERECO INTEGER,
	NOME varchar(100),
	DATA_CRIACAO date default current_date
);

create table ENDERECO (
	ID serial primary key,
	ID_PESQUEIRO integer references PESQUEIRO(ID),
	LOGRADOURO varchar(100),	
	BAIRRO varchar(30),
	CIDADE varchar(30),
	NUMERO varchar(6),
	COMPLEMENTO varchar(20),
	PONTO_REFERENCIA varchar(100),
	CEP integer,
	UF varchar(2),
	DATA_CRIACAO date default current_date
);
	
alter table PESQUEIRO
add constraint fk_endereco foreign key (ID_ENDERECO) references ENDERECO(ID);

create table TELEFONE(
	ID serial primary key,
	ID_PESQUEIRO integer references PESQUEIRO(ID),
	NUMERO varchar(14),
	TIPO varchar(15),
	DATA_CRIACAO date default current_date
);

create table LAGO(
	ID serial primary key,
	ID_PESQUEIRO integer references PESQUEIRO(ID),
 	TAMANHO_M2 integer,
	VOLUME_M3 integer,
	DATA_CRIACAO date default current_date
);

create table ESPECIE(
	ID serial primary key,
	NOME varchar(100),
	DATA_CRIACAO date default current_date
);

create table LAGO_ESPECIE(
	ID_LAGO integer references LAGO(ID),
	ID_ESPECIE integer references ESPECIE(ID),
	QUANTIDADE integer,
	DATA_CRIACAO date default current_date
);

insert into pesqueiro values
(default, null, 'kobaiashi', default),
(default, null, 'Maeda', default),
(default, null, 'Louro', default),
(default, null, 'Aruja', default),
(default, null, 'Monte Negro', default);

insert into endereco values
(default, 1, 'Estrada mogi','Alto mogi', 'Mogimirim', '122',null, null, 12233666, 'SP', default),
(default, 2, 'Estrada itu',null, 'Itu', '133',null, 'Posto Itu', 12233111, 'SP', default),
(default, 3, 'Rua Jo�o Pedro','Vila Industrial', 'S�o Jos� dos Campos', '144',null, null, 12233222, 'SP', default),
(default, 4, 'Estrada Aruja','Vila Velha', 'Aruja', '155',null, 'Posto Ipiranga', 12233444, 'SP', default),
(default, 5, 'Estrada Santa Isabel','Juquia', 'Santa Isabel', '166',null, null, 12233555, 'SP', default);

insert into lago values
(default, 1, 1000, 3000, default),
(default, 2, 2000, 6000, default),
(default, 2, 5000, 15000, default),
(default, 3, 300,900, default),
(default, 4,1500, 4500, default),
(default, 4, 3000,9000, default),
(default, 5, 300,900, default);

insert into telefone values
(default, 1, '(12)98822-3214', 'WhatsApp', default),
(default, 2, '(11)98322-3222', 'Fixo', default),
(default, 3, '(13)98842-5514', 'WhatsApp', default),
(default, 4, '(14)98822-3214', 'WhatsApp', default),
(default, 5, '(19)98822-3214', 'Fixp', default);

insert into especie values
(default, 'Tilapia', default),
(default, 'Pacu', default),
(default, 'Tambaqui', default),
(default, 'Carpa', default),
(default, 'Pirarara', default);

insert into lago_especie values
(1, 1, 1000, default),
(1, 3, 2000, default),
(2, 4, 500, default),
(3, 2, 4000, default),
(4, 5, 200, default);
