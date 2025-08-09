function D_f = D_f(A_direction_squared_norm, v_direction_set, N)
    D_f = A_direction_squared_norm;
    for i = 1:N
        D_f = (custom.Norm.matrix_2D_vectorized_2(v_direction_set(:,:,:, i)))^2 + D_f;
    end
end