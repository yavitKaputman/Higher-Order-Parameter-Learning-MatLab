function [BH_A, BH_v_set, BH_Iterations, BH_Residuals] = BH_HPGCG(BH_A, BH_v_set, BH_Iterations, BH_Residuals, train_data, max_iter, least_res, backup_iter, lambda, p, n, N, BH_trained_data_name)
    u_plus_set = train_data( : , : , : , 1);
    g_set = train_data( : , : , : , 2);
    g_bar_set = learning.common_HPGCG_utility_functions.g_Bar(g_set, n, N);
    BH_u_plus_set = learning.BH_HPGCG_utility_functions.BH_u_Plus(u_plus_set, N);
    [frequent_argument_set, c_set] = learning.BH_HPGCG_utility_functions.iterative_calculations(g_set, BH_u_plus_set, BH_v_set, p, N);
    res = BH_Residuals(end);
    iter = BH_Iterations(end);
    first_iter = iter + 1;
    while res >=least_res
        iter = iter + 1;
        BH_Iterations(end + 1) = iter;
        A_tilde = learning.common_HPGCG_utility_functions.A_Tilde(BH_A, g_bar_set, c_set, lambda, N);
        v_tilde_set = learning.BH_HPGCG_utility_functions.v_Tilde(frequent_argument_set, g_bar_set, A_tilde, p, N);
        A_direction = BH_A - A_tilde;
        v_direction_set = BH_v_set - v_tilde_set;
        res = learning.BH_HPGCG_utility_functions.Res(frequent_argument_set, BH_u_plus_set, g_bar_set, A_direction, v_direction_set, lambda, N);
        BH_Residuals(end + 1) = res;
        theta = learning.BH_HPGCG_utility_functions.Theta(A_direction, v_direction_set, res, lambda, N);
        BH_A = BH_A - theta*(A_direction);
        BH_v_set = BH_v_set - theta*(v_direction_set);
        [frequent_argument_set, c_set] = learning.BH_HPGCG_utility_functions.iterative_calculations(g_set, BH_u_plus_set, BH_v_set, p, N);
        if iter == first_iter
            disp("BH Initial Iteration:---------" + iter + "---------Initial Residual:---------" + res + "------------------")    
        elseif mod(iter, backup_iter) == 0
            disp("BH Iteration:---------"+ iter + "---------Residual:---------" + res+ "------------------")    
            save(BH_trained_data_name, 'BH_A', 'BH_v_set', 'BH_Iterations', 'BH_Residuals');
        end
        if iter == max_iter
            break
        end
    end
    disp("BH Final Iteration:---------" + iter + "---------Final Residual:---------" + res + "------------------")
    save(BH_trained_data_name, 'BH_A', 'BH_v_set', 'BH_Iterations', 'BH_Residuals');
end