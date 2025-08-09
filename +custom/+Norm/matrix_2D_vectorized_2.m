function norm_v = matrix_2D_vectorized_2(v)
    norm_v = sqrt(sum(sum(v(:,:,1).^2 + v(:,:,2).^2)));
end