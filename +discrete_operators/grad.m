function grad_u = grad(u)
    grad_u(:,:, 1) = discrete_operators.x_plus(u);
    grad_u(:,:, 2) = discrete_operators.y_plus(u);
end