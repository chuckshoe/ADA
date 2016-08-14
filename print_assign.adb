-- In Ada, define a procedure containing two tasks, each of which contains a single loop.
-- The loop in the first task prints the numbers from 1 to 500, the loop in the second task
-- prints the numbers from 501 to 1000. The execution of the procedure should cause the
-- tasks to alternate printing fifty numbers at a time, so that the user would be guaranteed
-- to see:
-- 1  2...50  501  502  ...    550  51  52  ...    100  551  552  ...    600  ...
-- Be sure there is only one loop in each task.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure print_assign is

turn_counter: integer:=1;

    -- TASK 1
    task task1 ;

	task body task1 is
	i:integer:=1;
	begin
	loop
	    if (turn_counter rem 2) /= 0 then
		exit when turn_counter = 21;
		Put(i);
		New_Line;
		if (i rem 50) = 0 then
		    turn_counter := turn_counter + 1;
		    i := i+1;
		else
		    i := i+1;
		end if;

	    end if ;   
	end loop;

    end task1;

    -- TASK 2
    task task2 ;

	task body task2 is
	j:integer:=501;
	
	begin
	loop
	    if (turn_counter rem 2) = 0 then
		Put(j);
		New_Line;
		if (j rem 50) = 0 then
		    turn_counter := turn_counter + 1;
		    j := j+1;
		else
		    j := j+1;
		end if;
		exit when turn_counter = 21;

	    end if ;   
	end loop;

    end task2;


begin

    null;

end print_assign;
