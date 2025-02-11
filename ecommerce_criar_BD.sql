-- Criar BD E-commerce

create database ecommerce;
use ecommerce;

-- Criar tabela Cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11),
    CNPJ char(15),
    Address varchar(255),
    constraint unique_cpf_client unique(CPF),
    constraint unique_cnpj_client unique(CNPJ)
);

-- Criar tabela Produto
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(55) not null,
    ClassificationKids bool default false,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    Rating float default 0,
    Size varchar(10)
);

-- Criar tabela Fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_supplier_CNPJ unique(CNPJ)
);

-- Criar tabela Vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    LocationSeller varchar(255),
    ContactSeller char(11) not null,
    constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF)
);

-- Criar tabela Pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento', 'Em trânsito', 'Entregue') default "Em processamento",
	orderDescription varchar(255),
    sedex varchar(10),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- Criar tabela Pagamento
create table payments (
	idPayment int auto_increment primary key,
    idOrder int,
    typePayment enum('Cartão', 'Dois Cartões') default 'Cartão',
    limitAvailable float,
    constraint fk_payment_order foreign key (idOrder) references orders(idOrder)
);

-- Criar tabela Estoque
create table Storages (
	idStorage int auto_increment primary key,
    LocalStorage varchar(45) not null,
    Quantity int default 0
);

-- Criar tabela Produto_Fornecedor
create table productSupplier (
	idPSSupplier int,
    idPSProduct int,
    primary key (idPSSupplier, idPSProduct),
    constraint fk_Product_Supplier foreign key (idPSSupplier) references supplier(idSupplier),
    constraint fk_Supplier_Product_Product foreign key (idPSProduct) references product(idProduct)
);

-- Criar tabela Produto_Vendedor
create table productSeller (
	idPSSeller int,
    idPSProduct int,
    PSQuantity int,
    primary key (idPSSeller, idPSProduct),
    constraint fk_Product_Seller foreign key (idPSSeller) references seller(idSeller),
    constraint fk_Seller_Product_Product foreign key (idPSProduct) references product(idProduct)
);

-- Criar tabela Produto_Pedido
create table productOrder (
	idPOProduct int,
    idPOOrder int,
    POQuantity int default 1,
    POStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key(idPOProduct, idPOOrder),
    constraint fk_Product_Order_ foreign key (idPOOrder) references orders(idOrder),
    constraint fk_Order_Product_Product_ foreign key (idPOProduct) references product(idProduct)
);

-- Criar tabela Estoque
create table productStorage (
	idPSProduct int,
    idPSStorage int,
    PSLocation varchar(255) not null,
    primary key (idPSProduct, idPSStorage),
    constraint fk_product_storage foreign key (idPSProduct) references product(idProduct),
    constraint fk_storage_product_product foreign key (idPSStorage) references storages(idStorage)
);
