-- Mostrar tabelas
show tables;

-- Desc tabelas principais
desc clients;
desc product;
desc supplier;
desc seller;
desc orders;
desc payments;
desc productorder;
desc productseller;
desc productstorage;
desc productsupplier;

-- Inserindo Clientes
insert into clients(Fname, Minit, Lname, CPF, Address)
values('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alemanha 289, Centro - Cidade das Flores'),
('Ricardo', 'F', 'Silva', 45678913, 'Avenida Alemeda Vinha 1009, Centro - Cidade das Flores'),
('Julia', 'S', 'França', 789123456, 'Rua Lareijras 861, Centro - Cidade das Flores'),
('Roberta', 'G', 'Assis', 98745631, 'Avenida Koller 19, Centro - Cidade das Flores'),
('Fernando', 'S', 'Silveira', 12358965477, 'Avenida Presidente Vargas 344, Centro - Cidade das Flores'),
('Isabela', 'M', 'Cruz', 654789123, 'Rua Alemeda das Flores 28, Centro - Cidade das Flores');

-- Inserindo Produtos
insert into product(Pname, classificationkids, category, rating, size)
values('Fone de ouvido', false, 'Eletrônico', '4', null),
('Barbie Elsa', true, 'Brinquedos', '3', null),
('T-shirt - Orange is the new black', false, 'Vestimenta', '5', null),
('Pão de forma sem Glutén', false, 'Alimentos', '3', null),
('La Roche-Posay Effaclar Concentrado', false, 'Vestimenta', '5', null),
('Relógio digital Ben 10', true, 'Brinquedos', '4', null);

-- Inserindo Fornecedores
insert into supplier(SocialName, CNPJ, Contact)
values('Mattel', '01258963000101', '1123569875'),
('La Roche-Posay Brasil', '11456987000101', '1145856599'),
('Amina Panificadora', '58965877000402', '3133256985'),
('C&A', '25698777000222', '3132589687');

-- Inserindo vendedores
insert into seller(SocialName, AbstName, CNPJ, CPF, LocationSeller, ContactSeller)
values('José das Graças', 'Zé imports', null, '12345678989', 'Minas Gerais', '3132325689'),
('Mari Maria', 'Mari Maria', '16458966000101', null, 'São Paulo', '2145789588'),
('Alessandro Martins', 'AlexMartins Atacado', '15698587000225', null, 'Rio de Janeiro', '1132568877');

-- Inserindo Pedidos
insert into orders(idOrderClient, orderStatus, orderDescription, sedex, sendValue, paymentCash)
values(1, 'Cancelado', 'Pedido de produto', null, 14.50, false),
(1, 'Confirmado', 'Pedido de uma blusa G', null, 20.00, true),
(2, default, 'Pedido de produto 2', null, 11.30, false),
(3, 'Confirmado', 'Pedido de uma blusa', null, 20.00, true),
(4, 'Em processamento', 'Pedido', null, default, false),
(5, 'Confirmado', null, null, default, true),
(6, default, null, null, 5.00, default),
(2, default, null, null, default, false),
(7, default, null, null, default, false),
(7, 'Em processamento', 'Pedido', null, default, false),
(6, 'Confirmado', null, null, 33.50, true),
(6, 'Cancelado', 'Pedido de produto', null, 14.50, false);

-- Inserindo Pagamentos
insert into payments(idOrder, typePayment, limitAvailable)
values(1, 'Cartão', 1000.00),
(2, default, 150.00),
(4, 'Dois Cartões', 2000.00),
(6, 'Cartão', 55.00),
(7, default, 1000.00);

-- Inserindo Estoques
insert into storages(LocalStorage, Quantity)
values('Curitiba', 10000),
('Minas Gerais', 5000),
('São Paulo', 150),
('Amazonas', 33350),
('Rio de Janeiro', 250),
('Brasília', 9990);

-- Inserindo N:N - Produto_Fornecedor
insert into productSupplier(idPSSupplier, idPSProduct)
values(1, 2),
(2, 5),
(3, 4),
(4, 3),
(1, 6),
(4, 1);

-- Inserindo N:N - Produto_Vendedor
insert into productSeller(idPSSeller, idPSProduct, PSQuantity)
values(1, 1, 25),
(2, 2, 500),
(1, 3, 55),
(2, 4, 30),
(3, 5, null),
(3, 6, 100);

-- Inserindo N:N - Produto - Pedido
insert into productOrder(idPOProduct, idPOOrder, POQuantity, POStatus)
values(1, 1, default, default),
(2, 2, 5, default),
(3, 3, 4, default),
(4, 4, 3, default),
(5, 5, default, default),
(6, 6, 4, default),
(6, 7, 3, default),
(4, 8, 10, default),
(4, 9, default, default),
(4, 10, 2, default),
(2, 11, 3, default),
(1, 12, 5, default);

-- Inserindo N:N - Produto - Estoque
insert into productStorage(idPSProduct, idPSStorage, PSLocation)
values(1, 1, 'Curitiba'),
(2, 4, 'Manaus'),
(3, 2, 'Belo Horizonte'),
(4, 5, 'Rio de Janeiro'),
(5, 6, 'Brasília'),
(6, 3, 'São Paulo');

# END