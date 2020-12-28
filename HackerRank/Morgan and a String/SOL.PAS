{$I-,O+,Q-,R-,S-}

uses
  sysutils;
var
  t: integer;
  a, b: ansistring;

procedure solve(a, b: ansistring);
var
  ans: ansistring;
  n, m, i, j, ii, jj: int64;
begin
  ans := '';

  n := length(a); m := length(b);
  i := 1; j := 1;
  repeat
    ii := i; jj := j;
    while (ii <= n) and (jj <= m) and (a[ii] = b[jj]) do begin
      inc(ii); inc(jj);
    end;

    if ii > n then
      repeat
        ans += b[j];
        inc(j);
      until (j > m) or (b[j] <> b[j-1])
    else if jj > m then
      repeat
        ans += a[i];
        inc(i);
      until (i > n) or (a[i] <> a[i-1])
    else if a[ii] < b[jj] then
      repeat
        ans += a[i];
        inc(i);
      until (i > n) or (a[i] <> a[i-1])
    else
      repeat
        ans += b[j];
        inc(j);
      until (j > m) or (b[j] <>  b[j-1]);

  until (i > n) and (j > m);

  writeln(ans);
end;

begin
  readln(t);
  repeat
    readln(a); readln(b);

    solve(a, b);

    dec(t);
  until t = 0;
end.
