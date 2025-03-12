create database los_pollos_hermanos;

use los_pollos_hermanos;

create table Cliente(
	nome varchar(30) primary key,
    telefone int,
    email varchar(40)
);

create table Mesas(
	id int auto_increment primary key,
    capacidade int not null,
    status_mesa varchar(10) not null
);

create table Cardapio(
	id int auto_increment primary key,
    pratos varchar(12),
    bebidas varchar(12),
    sobremesa varchar(12),
    descricao varchar(80),
    preco decimal
);

create table Reserva(
	id int auto_increment primary key,
    nome_cliente varchar(30) not null,
    mesa_id int not null,
    qtd_pessoas int,
    status_reserva varchar(10) not null,
    foreign key (nome_cliente) references Cliente(nome),
    foreign key (mesa_id) references Mesas(id)
);

create table Pedido(
	id int auto_increment primary key,
    nome_cliente varchar(30),
    reserva_id int,
    data_pedido datetime,
    status_pedido varchar(10) not null,
    foreign key (nome_cliente) references Cliente(nome),
    foreign key (reserva_id) references Reserva(id)
);

create table Pedido_item(
	id int auto_increment primary key,
    pedido_id int not null,
    item_id int not null,
    quantidade int,
    subtotal int,
    foreign key (pedido_id) references Pedido(id),
    foreign key (item_id) references Cardapio(id)
);
