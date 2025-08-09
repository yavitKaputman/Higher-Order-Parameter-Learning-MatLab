function norm_v = matrix_2D_12(v)
    norm_v = sum(sum(sqrt(v(:,:,1).^2 + v(:,:,2).^2)));
end