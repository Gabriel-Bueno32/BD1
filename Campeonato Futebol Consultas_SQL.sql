select j.nome
from jogadores j
where j.nome_time in (select t.id_time
					  from times t
                      where t.id_time = 'FC Paris Saint-Germain');
/* Encontra o nome dos jogadores que jogam no FC Paris Saint-Germain */

select f.nome
from funcionarios f
where exists (select *
			  from juiz j
              where j.cpf = f.cpf);
/* Encontra o nome dos funcionarios que trabalham como juiz */

select j.nome
from jogadores j
where j.salario>all (select j2.salario
				     from jogadores j2
                     where j2.nome = 'Neymar');
/* Encontra o nome dos jogadores que ganham mais salario que todos os Neymar */

select f.nome
from funcionarios f
where f.cpf in (select ftp.cpf_funcionario
				from funcionarios_trabalham_partida ftp
                where ftp.times_partida = 'Atalanta BC x Manchester City FC');
/* Encontra o nome dos funcionarios que trabalharam no jogo do Atalanta BC x Manchester City FC */

select l.cidade
from localizacao l
where exists (select e.nome
			  from estadio e
              where e.numero_lugares > 70000 and e.cidade_localizacao = l.cidade);
/* Encontra o nome das cidades que possuem um estadio com mais de 70000 lugares */

select p.times
from partida p
where p.nome_estadio in (select e.nome
						 from estadio e
                         where e.cidade_localizacao = 'Londres');
/* Encontra os times que tiveram uma partida no estadio de Londres */

select crt.nome_time, crt.data_registro
from campeonato_registra_time crt
where exists (select *
			  from times t
              where crt.nome_time = t.id_time);
/* Encontra as datas que os times se registraram no campeonato */

select p.times
from partida p
where exists (select *
			  from placar p2
              where p2.quantidade_gols > 3 and p.times = p2.times_partida);
/* Encontra as partidas que tiveram mais de 3 gols */

select t.nome
from tecnico t
where exists (select *
			 from tecnico t2
             where t.salario > 15000);
/* Encontra o nome dos tecnicos que ganham mais de 15000 */

select t.nome
from tecnico t
where t.cpf in (select t2.cpf_tecnico
				from times t2
                where t2.id_time = 'FC Barcelona');
/* Encontra quem é o tecnico do FC Barcelona */