function [frequent_argument_set, c_set] = iterative_calculations(g_set, TV_u_plus_set, v_set, p, N)
    frequent_argument_set = zeros(p, p, 2, N);
    c_set = zeros(N, 1);
    for i = 1:N
        frequent_argument_set( : , : , : , i) = discrete_operators.grad(discrete_operators.div(v_set( : , : , : , i)) + g_set( : , : , i));
        beta = custom.Norm.matrix_2D_12(frequent_argument_set( : , : , :, i));
        c_set(i) = TV_u_plus_set(i) - beta;
    end
end 