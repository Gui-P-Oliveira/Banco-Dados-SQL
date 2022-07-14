select * from telefones t full join usuarios u on t.id_usuario = u.id;

select * from telefones t right join usuarios u on t.id_usuario = u.id;

select * from carros c 
right join marcas m on c.cod_marca = m.cod;

select * from usuarios u
inner join enderecos e on u.id = e.id_usuario
inner join telefones t on u.id = t.id_usuario
inner join carros c on select * from carros c
inner join usuarios u on c.id_usuario = u.id
where c.preco > 45000
order by c.ano
;

select * from carros c inner join usuarios u on c.id_usuario = u.id;

select 
c.id,c.cod_marca,c.modelo,c.ano,c.preco,
u.email,u.nome,u.sobrenome,u.cpf,m.nome
from carros c
inner join usuarios u on c.id_usuario = u.id
inner join marcas m on c.cod_marca = m.cod
;

select * from telefones t
inner join usuarios u on t.id_usuario = u.id;

select * from usuarios u
inner join enderecos e on u.id_endereco = e.id
inner join  telefones t on u.id = t.id_usuario;

select * from carros c
inner join marcas m on c.cod_marca = m.cod;

select * from carros c left join marcas m on c.cod_marca = m.cod;

select * from marcas m left join carros c on m.cod = c.cod_marca;

select * from marcas m inner join carros c on m.cod = c.cod_marca;

select count(*) from carros;

select count(*) as qtd_carros from carros;

select count(*) as qtd_carros from carros 
where ano = 2019;

select count(*) as qtd_carros from carros 
where preco > 60000;

select count(*) as qtd_usuarios from usuarios;

select count(*) as qtd_marcas from marcas;

select * from carros c
inner join marcas m on c.cod_marca = m.cod 
where m.nome like '%%';

select count(*) as qtd_carros from carros c
inner join marcas m on c.cod_marca = m.cod 
where m.nome like '%Renault%';

select min(preco) from carros;

select min(preco) as menor_preco from carros;

select min(preco) from carros 
where preco > 40000 and preco < 80000;

select min(preco) from carros 
where ano = 2019;

select min(ano) as menor_ano,
count(*) as qtd_carros,
min(preco) as menor_preco
from carros;

select sum(preco) as valor_total from carros;

select sum(preco) from carros 
where cod_marca = 201 or cod_marca = 202;

select avg(preco) from carros;

select m.cod,
m.nome,
sum(c.preco) as valor_total,
avg(c.preco) as media_valor,
count(*) as qtd_carros  from carros c
inner join marcas m on c.cod_marca = m.cod
group by m.cod
order by m.cod;

select ano, sum(preco), avg(preco), count(*) from carros
group by ano;

select u.id, u.nome, sum(preco), avg(preco), count(*) from carros c 
inner join usuarios u on c.id_usuario = u.id 
group by u.id;

select modelo, sum(preco), avg(preco), count(*) from carros 
group by modelo;

select modelo, sum(preco), avg(preco), count(*) from carros 
group by modelo
having count(*) >=2;

select modelo, sum(preco), avg(preco), count(*) from carros 
group by modelo
having sum(preco) > 120000 ;

select ano, sum(preco), avg(preco), count(*), min(preco), max(preco)
from carros
group by ano
having min(preco) > 38000;

select u.id, u.nome, sum(preco), avg(preco), count(*) from carros c
inner join usuarios u on c.id_usuario = u.id
group by u.id
having count(*) > 1;