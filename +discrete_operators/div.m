function div_v = div(v)
    div_v = discrete_operators.x_minus(v(:,:,1)) + discrete_operators.y_minus(v(:,:,2));
end