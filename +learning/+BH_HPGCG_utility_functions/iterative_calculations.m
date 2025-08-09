function [frequent_argument_set, c_set] = iterative_calculations(g_set, BH_u_plus_set, v_set, p, N)
    frequent_argument_set = zeros(p, p, 3, N);
    c_set = zeros(N, 1);
    for i = 1:N
        frequent_argument_set( : , : , : , i) = discrete_operators.hessian(g_set( : , : , i) - discrete_operators.div2(v_set( : , : , : , i)));
        beta = custom.Norm.matrix_4D_12(frequent_argument_set( : , : , :, i));
        c_set(i) = BH_u_plus_set(i) + beta;
    end
end 