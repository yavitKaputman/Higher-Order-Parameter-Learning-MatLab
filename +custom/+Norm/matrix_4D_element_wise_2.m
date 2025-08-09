function norm_v = matrix_4D_element_wise_2(v)
    norm_v = sqrt(v(:,:,1).^2 + 2*(v(:,:,2).^2) + v(:,:,3).^2);
end