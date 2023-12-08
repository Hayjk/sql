drop database if exists workontime;
create database  if not exists workontime;
use workontime;

delimiter //
create procedure proc(sec int)
begin
	case
		when sec < 60 then
			select concat(sec, 'seconds') as time;
		when sec >= 60 and sec < 3600 then
			select concat_ws(sec div 60, 'minutes|', mod(sec, 60), 'stconds')as time;
		when sec >= 3600 and sec < 86400 then
			select concat_ws(sec div 3600, '|hours|', mod(sec, 3600) div 60, '|minutes|', mod(mod(sec, 3600), 60), '|seconds|') as time;
		else 
			select concat_ws(sec div 86400, '|days|', mod(sec, 86400) div 3600, '|hours|', mod(mod(sec, 86400), 3600) div 60, '|minutes|', mod(mod(mod(sec, 86400), 3600), 60), 'seconds') as time;
	end case;
end//
delimiter ;

call proc(123456)