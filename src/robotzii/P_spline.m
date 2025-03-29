function y_interp = P_spline (coef, x, x_interp)
  [n, ~] = size(x_interp);
  for i = 1:n
    j = find(x <= x_interp(i), 1, 'last');
    if j == length(x)
      j = length(x)-1;
    endif
    v = x_interp(i) - x(j)
    y_interp(i) = coef(4*j-3) + coef(4*j-2)*v + coef(4*j-1)*v^2 + coef(4*j)*v^3;
  endfor
endfunction
