{$I-,O+,Q-,R-,S-}

var
  t: integer;
  n, i: int64;
  a: array[1..100000] of int64;

function merge(l, r: int64): int64;
var
  inv_cnt, m, i, j, k: int64;
  tmp: array[1..100000] of int64;
begin
  inv_cnt := 0;

  m := (l + r) div 2;
  for i := l to m do
    tmp[i] := a[i];
  for j := m + 1 to r do
    tmp[j] := a[j];

  i := l; j := m + 1; k := l;
  repeat
    if tmp[i] <= tmp[j] then begin
      a[k] := tmp[i];
      inc(i);
    end
    else begin
      a[k] := tmp[j];
      inc(j);

      inv_cnt += m - i + 1;
    end;
    inc(k);
  until (i > m) or (j > r);
  while i <= m do begin
    a[k] := tmp[i];
    inc(i);
    inc(k);
  end;
  while j <= r do begin
    a[k] := tmp[j];
    inc(j);
    inc(k);
  end;

  exit(inv_cnt);
end;

function merge_sort(l, r: int64): int64;
var
  inv_cnt, mid: int64;
begin
  inv_cnt := 0;
  if l >= r then exit(inv_cnt);

  inv_cnt += merge_sort(l, (l + r) div 2);
  inv_cnt += merge_sort((l + r) div 2 + 1, r);
  inv_cnt += merge(l, r);

  exit(inv_cnt);
end;

begin
  readln(t);
  repeat
    readln(n);
    for i := 1 to n do read(a[i]);

    writeln(merge_sort(1, n));

    dec(t);
  until t = 0;
end.
