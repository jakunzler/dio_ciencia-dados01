-- inserção de dados e queries
use ecommerce;

show tables;

--
insert into customers (firstName, middleNameInitials, lastName, CPF, address, birthday) 
		values('Fulano', 'A', 'Oliveira', 00123456789, 'rua da bananeira, n. 12, Sé, Polianópolis', '1987-07-23'),
			  ('Fulano', 'B', 'Oliveira', 00912345678, 'rua da bananeira, n. 12, Sé, Polianópolis', '1985-06-03'),
              ('Fulano', 'C', 'Oliveira', 00891234567, 'rua da bananeira, n. 12, Sé, Polianópolis', '2013-01-15');
              
select * from customers;

insert into products (productName, forKids, category, score, size)
		values('Fone de ouvido Blaxton', false, 'eletrônicos', '3', '4x4x2'),
              ('Fone de ouvido Fifo', false, 'eletrônicos', '5', '4x5x2'),
              ('Fone de ouvido Aiai', false, 'eletrônicos', '2', null);
              
insert into orders (idCustomerOrdered, OrderStatus, orderDescription, orderFreight, paymentType)
		values(1, '', 'compra via app', default, 1),
			  (2, null, 'compra via web site', 50, default),
			  (1, default, 'compra via web site', 20, 2),
			  (3, 'confirmado', null, 0, 5);
              











              
