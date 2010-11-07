with ada.text_io,ada.characters.Latin_1;
package body iterator is



---has_next: returns with true, if the array has next element
function has_next (i:integer; array_of_entrys:direntrys) return boolean is

begin

     return i <= array_of_entrys'last;

end has_next;


----next: puts the next element to std out.
procedure next (i:in out integer; array_of_entrys:in direntrys) is

begin
                    
                    ada.Text_io.put(array_of_entrys(i).perm(1..array_of_entrys(i).perm_l) & Ada.Characters.Latin_1.HT);

                    ada.Text_io.put(array_of_entrys(i).moddate(1..array_of_entrys(i).moddate_l) & Ada.Characters.Latin_1.HT & array_of_entrys(i).name(1..array_of_entrys(i).name_l) & Ada.Characters.Latin_1.HT) ;
                    if array_of_entrys(i).ft = file
                    then
                         ada.Text_io.put(integer'image(array_of_entrys(i).size));

                    end if;
                    ada.Text_io.new_line;


    i:=i+1;


end next;



end iterator;
