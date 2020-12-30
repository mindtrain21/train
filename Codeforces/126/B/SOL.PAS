{$I-,O+,Q-,R-,S-}

var
  s, ans: ansistring;
  p: array[1..100000] of integer;
  ok: array[0..100000] of boolean;
  i, k: int64;
begin
  readln(s);

  p[1] := 0;
  for i := 2 to length(s) do begin
    while (k > 0) and (s[k + 1] <> s[i]) do
      k := p[k];
    if s[k + 1] = s[i] then
      k += 1;
    p[i] := k;
    if i <> length(s) then ok[k] := true;
  end;

  k := p[length(s)];
  while k <> 0 do begin
    if ok[k] then begin
      for i := 1 to k do
        ans += s[i];
      write(ans);
      exit;
    end;

    k := p[k];
  end;
  write('Just a legend');
end.

