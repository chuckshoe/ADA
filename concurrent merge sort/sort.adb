-- ADA Programming Assignment

package body sort is

    procedure mergesort(a:in out My_ARRAY) is

       procedure merge_sort(a         : in out MY_ARRAY;
			    low,high  : in     integer) is
	   
	   mid : integer := (low+high)/2; 	 
	   procedure runtasks(a            : in out MY_ARRAY;
			      low,mid,high : in     integer) is
		   
	       task one;
	       task body one is 
	       begin 
		 merge_sort(a,low,mid);
	       end one;

	       task two;
	       task body two is 
	       begin 
		 merge_sort(a,mid+1,high);
	       end two;
	   begin
	     null;
	   end runtasks;

	   procedure merge (a            :in out MY_ARRAY;
			    low,mid,high :in     integer) is
	       temp: MY_ARRAY;
	       i,j,k:integer;

	   begin
	     i:=low;
	     j:=mid+1;
	     k:= low;
	     temp := a;

	     while i <= mid and j <= high loop
	       if a(i) <= a(j) then
		 temp(k) := a(i);
		 i := i+1;

	       else
		 temp(k) := a(j);
		 j := j+1;
	       end if;

	       k:=k+1;

	     end loop;

	     while i <= mid loop
	       temp(k) := a(i);
	       i := i+1;
	       k := k+1;
	     end loop;
	     a:=temp;
	   end merge;

       begin
	  
	  if low<high then
	    runtasks(a,low,mid,high);
	    merge(a,low,mid,high);
	  end if;
       end merge_sort;
    begin
        merge_sort(a,a'first,a'last);
    end mergesort;

end sort;
