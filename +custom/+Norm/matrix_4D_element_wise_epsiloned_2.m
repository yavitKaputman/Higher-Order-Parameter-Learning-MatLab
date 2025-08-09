function norm_v = matrix_4D_element_wise_epsiloned_2(v)
    norm_v = sqrt(v(:,:,1).^2 + 2*(v(:,:,2).^2) + v(:,:,3).^2 + eps);
end