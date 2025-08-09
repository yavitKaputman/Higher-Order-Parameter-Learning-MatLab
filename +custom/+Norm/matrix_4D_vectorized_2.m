function norm_v = matrix_4D_vectorized_2(v)
    norm_v = sqrt(sum(sum(v(:,:,1).^2 + 2*(v(:,:,2).^2) + v(:,:,3).^2)));
end