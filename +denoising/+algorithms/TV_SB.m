function u = TV_SB(g, alpha, max_iter, least_res)
    [m,n] = size(g);
    v = zeros(m, n, 2);
    b = zeros(m, n, 2);
    theta = 1;
    u_hat = g;
    xi = denoising.TV_SB_utility_functions.Xi(m, n, theta);
    res = 1;
    iter = 1;
    while res>=least_res
        u = denoising.TV_SB_utility_functions.U(g, v, b, xi, theta);
        [v, b] = denoising.TV_SB_utility_functions.v_b(u, b, alpha, theta);
        res = denoising.common_SB_utility_functions.Res(u, u_hat);
        u_hat = u;
        if iter == max_iter
            break
        end
        iter = iter + 1;
    end
end