function [TL_A, TL_v_set, TL_Iterations, TL_Residuals] = TL_HPGCG(TL_A, TL_v_set, TL_Iterations, TL_Residuals, train_data, max_iter, least_res, backup_iter, lambda, p, n, N, TL_trained_data_name)
    u_plus_set = train_data( : , : , : , 1);
    g_set = train_data( : , : , : , 2);
    g_bar_set = learning.common_HPGCG_utility_functions.g_Bar(g_set, n, N);
    TL_u_plus_set = learning.TL_HPGCG_utility_functions.TL_u_Plus(u_plus_set, N);
    [frequent_argument_set, c_set] = learning.TL_HPGCG_utility_functions.iterative_calculations(g_set, TL_u_plus_set, TL_v_set, p, N);
    res = TL_Residuals(end);
    iter = TL_Iterations(end);
    first_iter = iter + 1;
    while res >=least_res
        iter = iter + 1;
        TL_Iterations(end + 1) = iter;
        A_tilde = learning.common_HPGCG_utility_functions.A_Tilde(TL_A, g_bar_set, c_set, lambda, N);
        v_tilde_set = learning.TL_HPGCG_utility_functions.v_Tilde(frequent_argument_set, g_bar_set, A_tilde, p, N);
        A_direction = TL_A - A_tilde;
        v_direction_set = TL_v_set - v_tilde_set;
        res = learning.TL_HPGCG_utility_functions.Res(frequent_argument_set, TL_u_plus_set, g_bar_set, A_direction, v_direction_set, lambda, N);
        TL_Residuals(end + 1) = res;
        theta = learning.TL_HPGCG_utility_functions.Theta(A_direction, v_direction_set, res, lambda, N);
        TL_A = TL_A - theta*(A_direction);
        TL_v_set = TL_v_set - theta*(v_direction_set);
        [frequent_argument_set, c_set] = learning.TL_HPGCG_utility_functions.iterative_calculations(g_set, TL_u_plus_set, TL_v_set, p, N);
        if iter == first_iter
            disp("TL Initial Iteration:---------" + iter + "---------Initial Residual:---------" + res + "------------------")    
        elseif mod(iter, backup_iter) == 0
            disp("TL Iteration:---------"+ iter + "---------Residual:---------" + res+ "------------------")    
            save(TL_trained_data_name, 'TL_A', 'TL_v_set', 'TL_Iterations', 'TL_Residuals');
        end
        if iter == max_iter
            break
        end
    end
    disp("TL Final Iteration:---------" + iter + "---------Final Residual:---------" + res + "------------------")
    save(TL_trained_data_name, 'TL_A', 'TL_v_set', 'TL_Iterations', 'TL_Residuals');
end