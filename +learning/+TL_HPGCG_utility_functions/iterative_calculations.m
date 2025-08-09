function [frequent_argument_set, c_set] = iterative_calculations(g_set, TL_u_plus_set, v_set, p, N)
    frequent_argument_set = zeros(p, p, N);
    c_set = zeros(N, 1);
    for i = 1:N
        frequent_argument_set( : , : , i) = discrete_operators.delta(g_set( : , : , i) - discrete_operators.delta(v_set( : , : , i)));
        beta = custom.Norm.matrix_vectorized_2(frequent_argument_set( : , : , i));
        c_set(i) = TL_u_plus_set(i) + beta;
    end
end 