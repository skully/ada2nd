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

    i:=i+1;


end next;



end iterator;
