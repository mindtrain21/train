{$I-,O+,Q-,R-,S-}

uses
  math;
var
  s: ansistring;

procedure solve(s: ansistring);
var
  mn: integer;
  n, i, j, l, tmp: int64;
  v: array[1..100000] of integer;
begin
  mn := 1;
  l := 0;
  n := length(s);
  for i := 1 to n do begin
    case s[i] of
      '+', '-', ' ': continue;
      '0'..'9': tmp := ord(s[i]) - ord('0');
      'A'..'Z': tmp := ord(s[i]) - ord('A') + 10;
      'a'..'z': tmp := ord(s[i]) - ord('a') + 36;
    else
      writeln('such number is impossible!');
      exit;
    end;

    inc(l);
    v[l] := tmp;
    mn := max(mn, tmp);
  end;
  inc(mn);

  for i := mn to 62 do begin
    tmp := 0;
    for j := 1 to l do begin
      tmp := tmp*i + v[j];
      tmp := tmp mod (i-1);
    end;

    if tmp = 0 then begin
      writeln(i);
      exit;
    end;
  end;

  writeln('such number is impossible!');
end;

begin
  repeat
    readln(s);
    if s = '' then break;

    solve(s);
  until false;
end.
