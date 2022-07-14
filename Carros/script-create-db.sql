create database lets_carros

create table usuarios(
	id serial primary key,
	id_endereco integer,
	email varchar(100),
	senha varchar(15),
	nome varchar(50),
	sobrenome varchar(50),
	cpf varchar(14)
);

create table enderecos(
	id serial primary key,
	id_usuario integer references usuarios(id),
	logradouro varchar(100),
	bairro varchar(30),
	cidade varchar(30),
	numero varchar(6),
	complemento varchar(20),
	ponto_referencia varchar(20),
	cep integer,
	uf varchar(2)
);

create table marcas(
	cod integer primary key,
	nome varchar(100)
);


create table telefones(
	id serial primary key,
	id_usuario integer references usuarios(id),
	numero varchar(14),
	tipo varchar(30)
);

create table carros(
	id serial primary key,
	id_usuario integer references usuarios(id),
	cod_marca integer references marcas(cod),
	modelo varchar(50),
	ano smallint,
	preco decimal	
);

insert into usuarios values
(default, 1, 'nathan@gmail.com', '123', 'Nathan', 'Carlos', '123.456.789-11'),
(default, 2, 'gabriela@gmail.com', '1234', 'Gabriela', 'Silva', '124.456.789-10'),
(default, 3, 'gabriel@gmail.com', '12345', 'Joao', 'Silveira', '124.456.789-12'),
(default, 4, 'gabriel@gmail.com', '123456', 'Gabriel', 'Pereira', '124.456.789-13'),
(default, 5, 'antonio@gmail.com', '1234567', 'Antonio', 'Souza', '128.457.789-14');

insert into enderecos values
(default, 1, 'Av Paulista', 'Bela Vista', 'São Paulo', 1550, 'Apto 181A', null, 0709010, 'SP'),
(default, 2, 'Av Paulista', 'Bela Vista', 'São Paulo', 1900, 'Apto 182A', null, 0709010, 'SP'),
(default, 3, 'Av Paulista', 'Bela Vista', 'São Paulo', 1900, 'Apto 183A', null, 0709010, 'SP'),
(default, 4, 'Av Paulista', 'Bela Vista', 'São Paulo', 1900, 'Apto 184A', null, 0709010, 'SP'),
(default, 5, 'Av Paulista', 'Bela Vista', 'São Paulo', 2005, 'Apto 185A', null, 0709010, 'SP');

alter table usuarios
add constraint fk_enderecos foreign key (id_endereco) references enderecos(id)
;

insert into marcas values
(201, 'Chevrolet'),
(202, 'Renault'),
(203, 'Volkswagen'),
(204, 'Jeep'),
(206, 'BMW'),
(207, 'Lexus'),
(208, 'Toyota'),
(205, 'Fiat');

insert into carros values
(default, 4, 201, 'Onix', 2019, 52000),
(default, 4, 202, 'Sandero', 2017, 53000),
(default, 2, 204, 'Compass', 2019, 102000),
(default, 5, 204, 'Compass', 2018, 102000),
(default, 1, 208, 'Corola', 2016, 63000),
(default, 3, 203, 'Gol', 2019, 57000),
(default, 5, 205, 'Palio', 2013, 35000);

insert into telefones values
(default, 1, '1176768422', 'Celular'),
(default, 2, '1176768433', 'Residencial'),
(default, 3, '1176768444', 'Residencial'),
(default, 4, '1176768455', 'Residencial'),
(default, 5, '11976768466', 'Celular');