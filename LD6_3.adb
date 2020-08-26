with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;


procedure LD6_3 is

   type MType is array (Integer range <>, Integer range <>) of Integer;

   N: constant Integer :=10;
   M: constant Integer :=10;

   Matr : MType(1..N, 1..M) := ((others => 1),
                                (others => 2),
                                (others => 3),
                                (others => 4),
                                (others => 5),
                                (others => 6),
                                (others => 7),
                                (others => 8),
                                (others => 9),
                                (others => 10));
   protected Resource is

      procedure PrintRow (N: in Integer; Matr: in MType);

   end Resource;

   protected body Resource is

      procedure PrintRow (N: in Integer; Matr: in MType) is
         i: integer;
      begin
         i:=1;
         put("Row:" & Positive'Image(N) & ". Elements: ");

         while i /= Matr'Last loop
            put(Matr(N,i));
            i:=i+1;
         end loop;

         put_line("");
      end PrintRow;
   end Resource;


   task type Cipari (x :integer);
   task body Cipari is

      j : integer;

   begin
      j:= x;

      while j <= Matr'Last(2) loop

         Resource.PrintRow (j, Matr);
         j:=j+2;
      end loop;

   end Cipari;


   T1 : Cipari(1);
   T2 : Cipari(2);

begin
   null;
end LD6_3;
