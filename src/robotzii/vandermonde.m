function coef = vandermonde(x, y)
    n = length(x);
    A = zeros(n, n);

    for i = 1:n
        for j = 1:n
          A(i,j) = x(i)^(j-1);
        endfor
    endfor

    % Solve the system of equations
    coef = linsolve(A, y);
endfunction
