with Text_io,ada.integer_text_io, Ada.Characters.Latin_1,iterator;
use iterator;


procedure fajlos is
--
--type file_type is (file, directory);
--
--
--type direntry (ft: file_type:=directory) is record
--     name: string(1..100);
--     name_l:integer;
--     moddate : string(1..100);
--     moddate_l:integer;
--     perm: String(1..100);
--     perm_l:integer;
--     case ft is
--          when file => size:Natural;
--          when directory=> null;
--     end case;
--end record;
--
--type direntrys is array (positive range <>) of direntry;
------------------------------------------------------------------------------
--
--function has_next (i:integer; array_of_entrys:direntrys) return boolean is
--
--begin
--
--     return i <= array_of_entrys'last;
--
--end has_next;
--
------
--
--procedure next (i:in out integer; array_of_entrys:in direntrys) is 
--
--begin
--
--
--     Text_io.put(array_of_entrys(i).perm(1..array_of_entrys(i).perm_l) & Ada.Characters.Latin_1.HT);
--
--     Text_io.put(array_of_entrys(i).moddate(1..array_of_entrys(i).moddate_l) & Ada.Characters.Latin_1.HT & array_of_entrys(i).name(1..array_of_entrys(i).name_l) & Ada.Characters.Latin_1.HT) ;
--     if array_of_entrys(i).ft = file
--     then
--          Text_io.put(integer'image(array_of_entrys(i).size));
--
--     end if;
--     Text_io.new_line;
--     i:=i+1;
--
--
--end next;
--


----------------------------------------------------------------------------
number_of_entrys:integer;


begin

     Text_io.put("Hany bejegyzest szeretnenk?: ");
     ada.integer_text_io.get(number_of_entrys);

     declare
     
          array_of_entrys:direntrys(1..number_of_entrys);
          entry_type: integer;
          file_type_of_entry: file_type;

     begin
          Text_io.put_line("Toltsuk fel az adatokkal tombot!");
          for i in 1..number_of_entrys
          loop
               Text_io.put("Milyen tipust szeretnek? (1-file, 2-directory): ") ;
               ada.integer_text_io.get(entry_type);
               Text_io.skip_line;
               if entry_type = 1
               then
                   file_type_of_entry := file;

               else
                   file_type_of_entry := directory;

               end if;
               declare
                    ent: direntry(file_type_of_entry);
               begin
                    --feltoltjuk a tomb egy elemet
                    Text_io.put("Adjuk meg a bejegyzes nevet /string/: ");
                    Text_io.get_line(ent.name,ent.name_l);
                    Text_io.put("Adjuk meg a bejegyzes utolso modositasanak datumat /string/: ");
                    Text_io.get_line(ent.moddate,ent.moddate_l);
                    Text_io.put("Adjuk meg a bejegyzes jogosultsagait /string/: ");
                    Text_io.get_line(ent.perm,ent.perm_l);
                    if entry_type = 1
                    then
                         Text_io.put("Adjuk meg a fajl meretet /natural/: ");
                         ada.integer_text_io.get(ent.size);
                         Text_io.skip_line;
                    end if;
                    
                    array_of_entrys(i):=ent;                   
                    --Text_io.put_line(array_of_entrys(i).name(1..array_of_entrys(i).name_l));                   
               end;               
          end loop;
          
          declare
          i : integer := 1;
          begin
               Text_io.new_line;
               Text_io.new_line;
               Text_io.new_line;




               Text_io.put_line("Jogosultsag" & ada.Characters.Latin_1.HT &"Modositas"& ada.Characters.Latin_1.HT & "Nev" &
               ada.Characters.Latin_1.HT & "Meret");
               Text_io.put_line("---------------------------------------------------");
               while has_next(i,array_of_entrys)
               loop
                    next(i, array_of_entrys);
               end loop;
          end;
          
          
     --eddig letezett az array_of_entrys
     end; 
--xt_io.skip_line;
--Text_io.get_line(detry.name, detry.name_l);
--Text_io.put_line(detry.name(1..detry.name_l));


end fajlos;
