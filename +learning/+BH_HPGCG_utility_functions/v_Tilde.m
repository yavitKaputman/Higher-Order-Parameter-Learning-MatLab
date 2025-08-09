function v_tilde_set = v_Tilde(frequent_argument_set, g_bar_set, A_tilde, p, N)
    v_tilde_set = zeros(p, p, 3, N);
    for i = 1:N
        g_bar_i = g_bar_set( : , i);
        bound_i = ((g_bar_i)')*(A_tilde)*(g_bar_i);
        v_tilde_i = -frequent_argument_set( : , : , : , i);
        coefficient_matrix = custom.Norm.matrix_4D_element_wise_2(v_tilde_i);
        zero_indices = coefficient_matrix == 0;
        coefficient_matrix(zero_indices) = bound_i;
        coefficient_matrix = bound_i./coefficient_matrix;
        v_tilde_set( : , : , 1, i) = coefficient_matrix.*(v_tilde_i( : , : , 1));
        v_tilde_set( : , : , 2, i) = coefficient_matrix.*(v_tilde_i( : , : , 2));
        v_tilde_set( : , : , 3, i) = coefficient_matrix.*(v_tilde_i( : , : , 3));
    end
end