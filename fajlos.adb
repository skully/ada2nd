with Text_io,ada.integer_text_io, Ada.Characters.Latin_1,iterator;
use iterator;


procedure fajlos is

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
               end;               
          end loop;
          
          declare
          i : integer := array_of_entrys'first;
          begin
               Text_io.new_line;
               Text_io.new_line;
               Text_io.new_line;




               Text_io.put_line("Jogosultsag" & ada.Characters.Latin_1.HT &"Modositas"& ada.Characters.Latin_1.HT & "Nev" &
               ada.Characters.Latin_1.HT &   ada.Characters.Latin_1.HT & "Meret");
               Text_io.put_line("-----------------------------------------------------");
               iteration(i, array_of_entrys);
          end;
              
          
     --eddig letezett az array_of_entrys
     end; 


end fajlos;
