-- ADA Programming Assignment

with Ada.Text_IO; use Ada.Text_IO;
with sort; use sort;

procedure progmain is

package int_io is new integer_io(MY_INT);
use int_io;
tosort:MY_ARRAY;
X: MY_INT;
index: integer:=1;

    -- READER TASK
    task Reader is
      entry Read;
    end Reader;  
     
    task body Reader is
    begin
	-- Read in SIZE integers and write to array tosort
	accept Read do
	  index :=1;
	  for count in 1 .. SIZE loop
	    get(X);  
	    tosort(index) := X;
	    index := index + 1;	  
	  end loop;
	end ;
    end Reader;

    procedure runtasks is 
        -- PRINTER TASK
	task printer is
	  entry sum(total:integer);
	end Printer;  
	 
	task body Printer is
	begin
	    -- print the array
	    index := 1;
	    for count in 1 .. SIZE loop
	      Put(tosort(index));
	      New_Line;
	      index := index + 1;	  
	    end loop;
 
            -- Print Sum of Array
	    accept sum(total:integer) do
	      Put("Sum of the elements of array is :"&integer'Image(total)&ASCII.LF ); 
	    end sum ;
	end Printer;

	-- SUM TASK
	task Sum ;
	 
	task body Sum is
	total : integer := 0;
	begin
	    -- Calculate sum of elements of array
	    index :=1;
	    for count in 1 .. SIZE loop
	      total := total + integer(tosort(index));  
	      index := index + 1;	  
	    end loop;
	    Printer.sum(total);

	end Sum;


    begin
      null;
    end runtasks;

begin

    Reader.read;
   
    mergesort(tosort);
    
    runtasks;

end progmain;
