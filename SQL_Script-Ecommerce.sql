-- criação do banco de dados para o cenário de E-commerce
drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table customers(
			idCustomer int auto_increment primary key,
            firstName varchar(10),
            middleNameInitials char(4),
            lastName varchar(25),
            CPF char(11) not null,
            address varchar(45),
            birthday date,
            constraint unique_cpf_client unique (CPF)
            );

alter table customers auto_increment = 1;

-- desc customers;

-- criar tabela produto
create table products(
			idProduct int auto_increment primary key,
            productName varchar(30) not null,
            forKids bool default false,
            category ENUM('todos', 'vestuário', 'acessórios', 'enxoval', 'eletrônicos', 'eletrodomésticos', 'brinquedos', 'móveis', 'cosméticos', 'perfumes', 'livros', 'bazar','mercado') not null default 'todos',
            score float default 0,
            size varchar(10)
            );

-- desc products;

-- criar tabela pagamento
create table payments(
			idCustomer int,
			idPayment int,
            paymentType enum('boleto', 'cartão', 'picpay', 'paypal', 'pix'),
            limitAvailable float,
            primary key (idCustomer, idPayment)
);

-- criar tabela pedido
create table orders(
			idOrder int auto_increment primary key,
            idCustomerOrdered int,
            orderStatus enum('cancelado', 'confirmado', 'processando') default 'processando',
            orderDescription varchar(255),
            orderFreight float default 15,
            paymentType enum('boleto', 'cartão', 'picpay', 'paypal', 'pix') default 'cartão',
            constraint fk_orders_client foreign key (idCustomerOrdered) references customers(idCustomer)
            );

-- desc orders;

-- criar tabela estoque
create table productsStorage(
			idProductStorage int auto_increment primary key,
            storageLocation varchar(255),
            quantity int default 0
            );

-- desc productsStorage;

-- criar tabela fornecedor
create table suppliers(
			idSupplier int auto_increment primary key,
            companyName varchar(255) not null,
            tradeMark varchar(255) not null,
            CNPJ char(14) not null,
            contact char(11) not null,
            address varchar(255),
            constraint unique_cnpj_supplier unique (CNPJ),
            constraint unique_supplier_company_name unique (companyName)
            );
            
-- desc suppliers;
            
-- criar tabela vendedor
create table sellers(
			idSeller int auto_increment primary key,
            companyName varchar(255) not null,
            tradeMark varchar(255) not null,
            CNPJ char(14) not null,
            contact char(11) not null,
            address varchar(255),
            constraint unique_cnpj_seller unique (CNPJ),
            constraint unique_seller_company_name unique (companyName)
            );

-- desc sellers;

-- criar tabela vendedor do produto
create table productsSeller(
			idProductSeller int,
            idProduct int,
            productQuantity int default 1,
            primary key (idProductSeller, idProduct),
            constraint fk_product_seller foreign key (idProductSeller) references sellers(idSeller),
            constraint fk_product_seller_product foreign key (idProduct) references products(idProduct)
);

-- desc productsSeller;

-- criar tabela pedido do produto
create table productsOrder(
			idProductOrder int,
            idProduct int,
            productQuantity int default 1,
            productOrderStatus enum('disponível', 'indisponível') default 'disponível',
            primary key (idProductOrder, idProduct),
            constraint fk_product_order foreign key (idProductOrder) references orders(idOrder),
            constraint fk_product_order_product foreign key (idProduct) references products(idProduct)
);

-- desc productsOrder;

-- criar tabela estoque do produto
create table storagesLocation(
			idProductLocation int,
            idStorageLocation int,
			location varchar(255) not null,
            primary key (idProductLocation, idStorageLocation),
            constraint fk_storage_location_product foreign key (idProductLocation) references products(idProduct),
            constraint fk_product_location_product foreign key (idStorageLocation) references productsStorage(idProductStorage)
);

-- desc storagesLocation;

-- criar tabela fornecedor do produto
create table productsSupplier(
			idProductsSupplier int,
            idProduct int,
            quantity int not null default 1,
            primary key (idProductsSupplier, idProduct),
            constraint fk_product_supplier_supplier foreign key (idProductsSupplier) references suppliers(idSupplier),
            constraint fk_product_supplier_product foreign key (idProduct) references products(idProduct)
);

show tables;










