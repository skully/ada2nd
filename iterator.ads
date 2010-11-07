package iterator is

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

type direntrys is array (positive range <>) of direntry;

function has_next (i:integer; array_of_entrys:direntrys) return boolean ;
procedure next (i:in out integer; array_of_entrys:in direntrys);
procedure iteration (i:in out integer; array_of_entrys:in direntrys);
end iterator;
