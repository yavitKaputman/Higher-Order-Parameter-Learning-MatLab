function res = Res(frequent_argument_set, TV_u_plus_set, g_bar_set, A_direction, v_direction_set, lambda, N)
    coefficient = (1/N);
    grad_f_A = coefficient*((g_bar_set).*(TV_u_plus_set'))*((g_bar_set)');
    res = custom.inner_product.matrix(grad_f_A, A_direction) - (lambda/2)*(custom.Norm.matrix_vectorized_2(A_direction)^2);
    for i = 1:N
        res = res - coefficient*custom.inner_product.matrix_2D(frequent_argument_set( : , : , :, i), v_direction_set( : , : , :, i));
    end
end