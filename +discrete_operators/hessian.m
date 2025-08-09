function hessian_u = hessian(u)
    hessian_u(:,:, 1) = discrete_operators.x_minus(discrete_operators.x_plus(u));
    hessian_u(:,:, 2) = discrete_operators.y_plus(discrete_operators.x_plus(u));
    hessian_u(:,:, 3) = discrete_operators.y_minus(discrete_operators.y_plus(u));
end