function theta = Theta(A_direction, v_direction_set, res, lambda, N)
    A_direction_squared_norm = custom.Norm.matrix_vectorized_2(A_direction)^2;
    D_f = learning.TV_HPGCG_utility_functions.D_f(A_direction_squared_norm, v_direction_set, N);
    step_size = (N*(res + (lambda/2)*A_direction_squared_norm))/(8*D_f);
    theta = min(1, step_size);
end