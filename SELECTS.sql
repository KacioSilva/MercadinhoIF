
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


select produtos.marca, produtos.nome, produtos.QuantidadeProduto from produtos; /*Usado para criar o gráfico de porcentagem de produtos por marca no estoque */


/* select referente ao gráfico de quantidade de vendas de cada produto*/
select p.Nome as nomeProduto, p.idProdutos as QtdeProduto
from produtos p
INNER JOIN produtos_compra pa ON 
pa.Produtos_idProdutos = p.idProdutos;



select count(cliente.Nome) from cliente; /*Select utilizado para criar o gráfico de quantidade de clientes cadastrados */



/* Comando utilizado para criar o gráfico de total de vendas em R$ */
select sum(TRUNCATE(p.Preço,2)) as ValorFatura
from produtos p, produtos_compra pc
where p.idProdutos = pc.Produtos_idProdutos;


/* Comando utilizado para criar o gráfico de funcionários por departamento*/
select f.Departamento_idDepartamento, d.Nome from Funcionario f inner join Departamento d on f.Departamento_idDepartamento = d.idDepartamento;


/*Comando utilizado para criar o gráfico de total de compras por mes */
SELECT CONCAT(LPAD(MONTH(DataCompra), 2,'0'), '/', YEAR(DataCompra)) mes, COUNT(idCompra) vendas
FROM compra
GROUP BY MONTH(DataCompra);


