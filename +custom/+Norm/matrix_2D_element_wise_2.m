function norm_v = matrix_2D_element_wise_2(v)
    norm_v = sqrt(v(:,:,1).^2 + v(:,:,2).^2);
end