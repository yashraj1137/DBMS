delimiter //
create procedure carparking_c()
begin
	declare vfinished int default 0;
	declare n varchar(20);
	declare m int(10);
	declare p int(20);
	declare q varchar(20);
	declare o int(20); 
	
declare carparking_cursor cursor for select * from carparking;
declare continue handler for not found set vfinished=1;

open carparking_cursor;
getdata:loop
     fetch  carparking_cursor into n,m,p,q,o;
     if vfinished=1 then
     leave getdata;
     end if;
    set o=o+0.2*o;
    insert into carparking_dump values(n,m,p,q,o);
    end loop getdata;
    close carparking_cursor;
    end;
    //
    
    
    
   mysql> select *from carparking;
+---------+---------+-----------+-----------+------+
| carname | Pid     | mobno     | carowner  | hrs  |
+---------+---------+-----------+-----------+------+
| skoda   | 1233211 | 897654321 | Aniket    |   12 |
| Audi    |  456631 | 907654421 | Rushikesh |   10 |
| maruti  | 4566211 | 907121421 | vishal    |   10 |
| maruti  | 4566000 | 907881421 | Ravi      |   14 |
| NULL    |    NULL |      NULL | NULL      | NULL |
+---------+---------+-----------+-----------+------+




mysql> call carparking_c();


select *from carparking_dump;
    -> //
+---------+---------+-----------+-----------+------+
| carname | Pid     | mobno     | carowner  | hrs  |
+---------+---------+-----------+-----------+------+
| Audi    |  456631 | 907654421 | Rushikesh |   12 |
| maruti  | 4566211 | 907121421 | vishal    |   12 |
| skoda   | 1233211 | 897654321 | Aniket    |   14 |
+---------+---------+-----------+-----------+------+





