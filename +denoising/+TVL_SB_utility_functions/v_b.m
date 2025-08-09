function [new_v1, new_b1, new_v2, new_b2] = v_b(u, b1, b2, alpha, beta, theta)
    argument1 = discrete_operators.grad(u) + b1;
    normed_argument1 = custom.Norm.matrix_2D_element_wise_epsiloned_2(argument1);
    new_v1(:,:, 1) = max(normed_argument1 - alpha/theta, 0).*(argument1(:,:, 1)./(normed_argument1));
    new_v1(:,:, 2) = max(normed_argument1 - alpha/theta, 0).*(argument1(:,:, 2)./(normed_argument1));
    new_b1 = argument1 - new_v1;
    argument2 = discrete_operators.delta(u) + b2;
    new_v2 = max(abs(argument2)- beta/theta, 0).*(sign(argument2));
    new_b2 = argument2 - new_v2;
end