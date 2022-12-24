select * from Funcionario;
select * from mercado;
select * from fornecedor;
select * from cliente;
select * from compra;
select * from produtos;
select * from produtos_compra;
select * from fornecedor_produtos;
select * from departamento;


SET foreign_key_checks = 0;

set foreign_key_checks = 1;




alter table fornecedor_produtos add DataDeFornecimento date not null; 

alter table produtos modify QuantidadeProduto int not null;


select produtos.marca, produtos.nome, produtos.QuantidadeProduto from produtos;

select marca, nome, QuantidadeProduto from produtos;

select Cliente_CPFcliente, DataCompra from compra where idCompra <5 order by DataCompra;

select Cliente_CPFcliente as CPFcliente, DataCompra as DataDaCompra, idCompra from compra order by DataCompra;



select count(cliente.Nome) from cliente;

select count(idCompra), DataCompra from compra where DataComra;



select sum(TRUNCATE(p.Preço,2)) as ValorFatura
from produtos p, produtos_compra pc
where p.idProdutos = pc.Produtos_idProdutos;


select Funcionario.Departamento_idDepartamento, departamento.Nome from Funcionario inner join Departamento on Departamento_idDepartamento = 3;

select f.Departamento_idDepartamento, d.Nome from Funcionario f inner join Departamento d on f.Departamento_idDepartamento = d.idDepartamento;


SELECT CONCAT(LPAD(MONTH(DataCompra), 2,'0'), '/', YEAR(DataCompra)) mes, COUNT(idCompra) vendas
FROM compra
GROUP BY MONTH(DataCompra);