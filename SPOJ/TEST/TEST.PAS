{$I-,O+,Q-,R-,S-}

var
  i: integer;
begin
  repeat
    readln(i);
    if i = 42 then break else writeln(i);
  until false;
end.
