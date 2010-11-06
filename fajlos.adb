with Text_io,ada.integer_text_io;


procedure fajlos is

type file_type is (file, directory);


type direntry (ft: file_type:=directory) is record
     name: string(1..100);
     name_l:integer;
     moddate : string(1..100);
     moddate_l:integer;
     perm: String(1..100);
     perm_l:integer;
     case ft is
          when file => size:Natural;
          when directory=> null;
     end case;
end record;

--
--typeofentry: string(1..100);
--sizeofentry: Natural;
--nameofentry: string(1..100);
--permofentry: string(1..100);
--moddateofentry: string(1..100);
--

type direntrys is array (positive range <>) of direntry;
detry: direntry;
number_of_entrys:integer;
--str:string(1..100);
--utolso: integer;


begin

     Text_io.put("Hany bejegyzest szeretnenk?: ");
     ada.integer_text_io.get(number_of_entrys);

     declare
     
          entrys:direntrys(1..number_of_entrys);
          entry_type: integer;
          file_type_of_entry: file_type;

     begin
          Text_io.put_line("Toltsuk fel az adatokkal tombot!");
          for i in 1..number_of_entrys
          loop
               Text_io.put("Milyen tipust szeretnek? (1-directory, 2-file): ") ;
               ada.integer_text_io.get(entry_type);
               if entry_type = 1
               then
                   file_type_of_entry := directory;

               else
                   file_type_of_entry := file;

               end if;
               declare
                    ent: direntry(file_type_of_entry);
               begin
                   null; 
               end;
               
               
               
          end loop;


     end; 








Text_io.skip_line;
Text_io.get_line(detry.name, detry.name_l);
Text_io.put_line(detry.name(1..detry.name_l));


end fajlos;
