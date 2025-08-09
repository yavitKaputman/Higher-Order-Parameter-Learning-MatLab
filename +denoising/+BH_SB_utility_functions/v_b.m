function [new_v, new_b] = v_b(u, b, alpha, theta)
    argument = discrete_operators.hessian(u) + b;
    normed_argument = custom.Norm.matrix_4D_element_wise_epsiloned_2(argument);
    new_v(:,:, 1) = max(normed_argument - alpha/theta, 0).*(argument(:,:, 1)./(normed_argument));
    new_v(:,:, 2) = max(normed_argument - alpha/theta, 0).*(argument(:,:, 2)./(normed_argument));
    new_v(:,:, 3) = max(normed_argument - alpha/theta, 0).*(argument(:,:, 3)./(normed_argument));
    new_b = argument - new_v;
end