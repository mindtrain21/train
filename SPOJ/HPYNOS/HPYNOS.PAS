{$I-,O+,Q-,R-,S-}

var
  n: int64;
  ans: integer;

function break_sum(n: int64): integer;
var
  sum: integer;
begin
  sum := 0;

  repeat
    sum += (n mod 10)*(n mod 10);
    n := n div 10;
  until n = 0;

  exit(sum);
end;
  
begin
  readln(n);

  repeat
    ans += 1;
    n := break_sum(n);

    if n = 20 then begin
      write(-1);
      exit;
    end;
  until n = 1;

  write(ans);
end.
