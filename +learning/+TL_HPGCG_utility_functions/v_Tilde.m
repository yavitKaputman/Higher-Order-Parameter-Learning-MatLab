function v_tilde_set = v_Tilde(frequent_argument_set, g_bar_set, A_tilde, p, N)
    v_tilde_set = zeros(p, p, N);
    for i = 1:N
        g_bar_i = g_bar_set( : , i);
        bound_i = ((g_bar_i)')*(A_tilde)*(g_bar_i);
        v_tilde_i = -frequent_argument_set( : , : , i);
        coefficient = custom.Norm.matrix_vectorized_2(v_tilde_i);
        if coefficient == 0
            coefficient = 1;
        else
            coefficient = bound_i/coefficient;
        end
        v_tilde_set( : , : , i) = coefficient*v_tilde_i;
    end
end