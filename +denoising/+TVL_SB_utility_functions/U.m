function new_u = U(g, v1, v2, b1, b2, xi, theta)
    G = g - theta*discrete_operators.div(v1 - b1) + theta*discrete_operators.delta(v2 - b2);
    new_u = real(ifftn(fftn(G)./xi));
end