function u = BH_SB(g, alpha, max_iter, least_res)
    [m,n] = size(g);
    v = zeros(m, n, 3);
    b = zeros(m, n, 3);
    theta = 1;
    u_hat = g;
    xi = denoising.BH_SB_utility_functions.Xi(m, n, theta);
    res = 1;
    iter = 1;
    while res>=least_res
        u = denoising.BH_SB_utility_functions.U(g, v, b, xi, theta);
        [v, b] = denoising.BH_SB_utility_functions.v_b(u, b, alpha, theta);
        res = denoising.common_SB_utility_functions.Res(u, u_hat);
        u_hat = u;
        if iter == max_iter
            break
        end
        iter = iter + 1;
    end
end