function xi = Xi(m, n, theta)
    [s , r] = meshgrid(0:n-1, 0:m-1);
    xi = (1 + 4*theta*(cos((2*pi*r)/m) + cos((2*pi*s)/n) - 2).^2);
end