drop database if exists workonnum;
create database  if not exists workonnum;
use workonnum;

delimiter //
create procedure number(`start` int, `end` int)
begin
	declare i int default `start`;
	declare result text default null;
	while i <= `end` do
			if i % 2 = 0 then
				if result is null then 
					set result = concat(i);
				else
					set result = concat(result, ' ', i);
				end if;
			end if;
		set i = i + 1;
	end while;
select result;
end//
delimiter ;

call number(1, 10);