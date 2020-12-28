{$I-,O+,Q-,R-,S-}

uses
  sysutils;
const
  MAX_LEN = 157;
var
  n: integer;

procedure mult(var a: array of integer; b: integer);
var
  i, carry: integer;
begin
  carry := 0;
  for i := 0 to length(a) - 1 do
  begin
    a[i] := a[i]*b + carry;
    carry := a[i] div 10;
    a[i] := a[i] mod 10;
  end;
end;

function fact(n: integer): string;
var
  i: integer;
  a: array[0..MAX_LEN] of integer;
  res: string;
begin
  fillchar(a, sizeof(a), 0);
  res := '';

  a[0] := 1;
  for i := 2 to n do
    mult(a, i);
  i := length(a) - 1;
  while a[i] = 0 do dec(i);
  repeat
    res += inttostr(a[i]);
    dec(i);
  until i = -1;

  exit(res);
end;

begin
  readln(n);
  write(fact(n));
end.
