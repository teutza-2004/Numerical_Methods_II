function y_interp = P_vandermonde (coef, x_interp)
	[n, ~] = size(x_interp);
  [m, ~] = size(coef);
  y_interp = zeros(1, n);
  for i = 1:n
    for j = 1:m
      y_interp(i) = y_interp(i) + coef(j)*x_interp(i)^(j-1);
    endfor
  endfor
end
