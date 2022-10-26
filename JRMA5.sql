use bdControleProjetos;

select * from tbContratante;
select * from tbProjeto;
select * from tbProjetoConsultor;
select * from Consultor;

--1
update tbContratante set TelefoneContratante = 67922334455 where CodContratante = 1;
--2
update Consultor set EmailConsultor = 'soaresmilena@com.live' where CodConsultor = 3;
--3
update tbProjeto set CodContratante = 2 where CodProjeto = 1;
--4
delete from tbProjetoConsultor where CodProjetoConsultor = 3;
--5
create view ex5
as select c.NomeConsultor,pc.FuncaoExercida
from Consultor as c
inner join tbProjetoConsultor as pc
on c.CodConsultor = pc.CodConsultor;
--6
create view ex6
as select count(CodProjeto) as numProjetos
from tbProjeto;
--7
create view ex7
as select NomeContratante
from tbContratante
where NomeContratante like 'J%';
--8
create view ex8
as select avg(Valor) as media
from tbProjeto;
--9
create view ex9
as select *
from tbProjetoConsultor
where HorasTrabalhadas > 5;
--10
create view ex10
as select *
from tbProjeto
where (valor > 6000) and (DataTermino < '20230101' );
--11
create view ex11
as select c.NomeContratante, p.*
from tbProjeto as p
inner join tbContratante as c
on p.CodContratante = c.CodContratante;
--12
create view ex12
as select c.NomeConsultor, pc.*
from tbProjetoConsultor as pc
inner join Consultor as c
on pc.CodConsultor = c.CodConsultor;