{$I-,O+,Q-,R-,S-}

var
  t1, t2, x1, x2, t0, ax1, ax2, i, m, l, r: int64;
  t, tans: real;

begin
  readln(t1, t2, x1, x2, t0);

  if t1 = t2 then begin
    ax1 := x1;
    ax2 := x2;
  end
  else if t1 = t0 then ax1 := x1
  else if t2 = t0 then ax2 := x2
  else begin
    tans := t2;

    for i := 0 to x1 do begin
      l := 0; r := x2;
      if i = 0 then l += 1;

      while l <= r do begin
        m := l + (r - l) div 2;
        t := (i*t1 + m*t2) / (i + m);
        if t < t0 then l := m + 1
        else begin
          if ((t = tans) and (ax1 + ax2 < i + m)) or (t < tans) then begin
            tans := t;
            ax1 := i;
            ax2 := m;
          end;

          r := m - 1;
        end;
      end;
    end;

    for i := 0 to x2 do begin
      l := 0; r := x1;
      if i = 0 then l += 1;

      while l <= r do begin
        m := l + (r - l) div 2;
        t := (m*t1 + i*t2) / (i + m);
        if t < t0 then r := m - 1
        else begin
          if ((t = tans) and (ax1 + ax2 < i + m)) or (t < tans) then begin
            tans := t;
            ax1 := m;
            ax2 := i;
          end;

          l := m + 1;
        end;
      end;
    end;
  end;

  write(ax1, ' ', ax2);
end.
