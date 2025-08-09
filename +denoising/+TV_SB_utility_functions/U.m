function new_u = U(g, v, b, xi, theta)
    G = g - theta*discrete_operators.div(v - b);
    new_u = real(ifftn(fftn(G)./xi));
end