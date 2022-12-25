
/* COMANDOS PARA SELECIONAR TODA A TABELA*/
select * from Funcionario;
select * from mercado;
select * from fornecedor;
select * from cliente;
select * from compra;
select * from produtos;
select * from produtos_compra;
select * from fornecedor_produtos;
select * from departamento;



alter table fornecedor_produtos add DataDeFornecimento date not null; /*Comando para alterar uma tabela, adicionando uma linha na mesma.*/

alter table produtos modify QuantidadeProduto int not null; /* Comando para modificar as constraints de um atributo */


/* Comandos para selecionar algumas colunas de uma tabela */
select produtos.marca, produtos.nome, produtos.QuantidadeProduto from produtos; /*Usado para criar o gráfico de porcentagem de produtos por marca no estoque */
select marca, nome, QuantidadeProduto from produtos;


/*Comando para selecionar 2 colunas de uma tabela, até onde o iD seja menor que 5. */
select Cliente_CPFcliente, DataCompra from compra where idCompra <5 order by DataCompra; 


/*Select de 3 colunas, ordenando por DataCompra*/
select Cliente_CPFcliente as CPFcliente, DataCompra as DataDaCompra, idCompra from compra order by DataCompra;



select count(cliente.Nome) from cliente; /*Select utilizado para criar o gráfico de quantidade de clientes cadastrados */



/* Comando utilizado para criar o gráfico de total de vendas */
select sum(TRUNCATE(p.Preço,2)) as ValorFatura
from produtos p, produtos_compra pc
where p.idProdutos = pc.Produtos_idProdutos;


/* Comando utilizado para criar o gráfico de funcionários por departamento*/
select f.Departamento_idDepartamento, d.Nome from Funcionario f inner join Departamento d on f.Departamento_idDepartamento = d.idDepartamento;


/*Comando utilizado para criar o gráfico de total de compras por mes */
SELECT CONCAT(LPAD(MONTH(DataCompra), 2,'0'), '/', YEAR(DataCompra)) mes, COUNT(idCompra) vendas
FROM compra
GROUP BY MONTH(DataCompra);


SELECT CONCAT(LPAD(MONTH(DataCompra), 2,'0'), '/', YEAR(DataCompra)) mes, COUNT(idCompra) vendas
FROM compra
WHERE DataCompra BETWEEN CURDATE() - INTERVAL 12 MONTH AND CURDATE()
GROUP BY MONTH(DataCompra);
