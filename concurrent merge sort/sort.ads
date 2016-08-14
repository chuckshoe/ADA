-- ADA Programming Assignment

package sort is
  
  type MY_INT is new Integer range -500 .. 500;
  SIZE : constant Integer :=40 ;
  type MY_ARRAY is array(1..SIZE) of MY_INT;
  procedure mergesort(a : in out MY_ARRAY);

end sort;
