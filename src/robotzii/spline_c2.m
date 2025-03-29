function coef = spline_c2(x, y)
    n = length(x) - 1;
    A = zeros(4*n, 4*n);
    b = zeros(4*n, 1);

    for i = 1:n
        A(i, 4*(i-1)+1) = 1; % si(xi) = yi
        b(i) = y(i);
    end

    v = x(n+1)-x(n);
    A(n+1, 4*n-3:4*n) = [1, v, v^2, v^3]; % s_{n-1}(xn) = yn
    b(n+1) = y(n+1);

    j = 1;
    for i = n+2:3:4*n-4
        v = x(floor(j/4)+2) - x(floor(j/4)+1);
        A(i, j:j+4) = [1, v, v^2, v^3, -1]; % si(xi+1) = si+1(xi+1)
        A(i+1, j+1:j+5) = [1, 2*v, 3*v^2, 0, -1]; % si'(xi+1) = si+1'(xi+1)
        A(i+2, j+2:j+6) = [2, 6*v, 0, 0, -2]; % si''(xi+1) = si+1''(xi+1)
        j = j + 4;
    end

    A(4*n-1, 3) = 2; % s''_0(x0) = 0
    A(4*n, 4*n-1:4*n) = [2, 6*(x(n+1)-x(n))]; % s''_{n-1}(xn) = 0

    % Solve the system of equations
    coef = linsolve(A, b);
end

