function div2_v = div2(v)
    div2_v = discrete_operators.x_plus(discrete_operators.x_minus(v(:,:,1))) + 2*(discrete_operators.x_minus(discrete_operators.y_minus(v(:,:,2)))) + discrete_operators.y_plus(discrete_operators.y_minus(v(:,:,3)));
end