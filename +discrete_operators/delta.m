function delta_u = delta(u)
    delta_u = discrete_operators.x_minus(discrete_operators.x_plus(u)) + discrete_operators.y_minus(discrete_operators.y_plus(u));
end