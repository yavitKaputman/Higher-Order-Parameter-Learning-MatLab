function [TV_A, TV_v_set, TV_Iterations, TV_Residuals] = TV_HPGCG(TV_A, TV_v_set, TV_Iterations, TV_Residuals, train_data, max_iter, least_res, backup_iter, lambda, p, n, N, TV_trained_data_name)
    u_plus_set = train_data( : , : , : , 1);
    g_set = train_data( : , : , : , 2);
    g_bar_set = learning.common_HPGCG_utility_functions.g_Bar(g_set, n, N);
    TV_u_plus_set = learning.TV_HPGCG_utility_functions.TV_u_Plus(u_plus_set, N);
    [frequent_argument_set, c_set] = learning.TV_HPGCG_utility_functions.iterative_calculations(g_set, TV_u_plus_set, TV_v_set, p, N);
    res = TV_Residuals(end);
    iter = TV_Iterations(end);
    first_iter = iter + 1;
    while res >=least_res
        iter = iter + 1;
        TV_Iterations(end + 1) = iter;
        A_tilde = learning.common_HPGCG_utility_functions.A_Tilde(TV_A, g_bar_set, c_set, lambda, N);
        v_tilde_set = learning.TV_HPGCG_utility_functions.v_Tilde(frequent_argument_set, g_bar_set, A_tilde, p, N);
        A_direction = TV_A - A_tilde;
        v_direction_set = TV_v_set - v_tilde_set;
        res = learning.TV_HPGCG_utility_functions.Res(frequent_argument_set, TV_u_plus_set, g_bar_set, A_direction, v_direction_set, lambda, N);
        TV_Residuals(end + 1) = res;
        theta = learning.TV_HPGCG_utility_functions.Theta(A_direction, v_direction_set, res, lambda, N);
        TV_A = TV_A - theta*(A_direction);
        TV_v_set = TV_v_set - theta*(v_direction_set);
        [frequent_argument_set, c_set] = learning.TV_HPGCG_utility_functions.iterative_calculations(g_set, TV_u_plus_set, TV_v_set, p, N);
        if iter == first_iter
            disp("TV Initial Iteration:---------" + iter + "---------Initial Residual:---------" + res + "------------------")    
        elseif mod(iter, backup_iter) == 0
            disp("TV Iteration:---------"+ iter + "---------Residual:---------" + res+ "------------------")    
            save(TV_trained_data_name, 'TV_A', 'TV_v_set', 'TV_Iterations', 'TV_Residuals');
        end
        if iter == max_iter
            break
        end
    end
    disp("TV Final Iteration:---------" + iter + "---------Final Residual:---------" + res + "------------------")
    save(TV_trained_data_name, 'TV_A', 'TV_v_set', 'TV_Iterations', 'TV_Residuals');
end