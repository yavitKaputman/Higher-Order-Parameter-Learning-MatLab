function u = TVBH_SB(g, alpha, beta, max_iter, least_res)
    [m,n] = size(g);
    v1 = zeros(m, n, 2);
    b1 = zeros(m, n, 2);
    v2 = zeros(m, n, 3);
    b2 = zeros(m, n, 3);
    theta = 1;
    u_hat = g;
    xi = denoising.TVBH_SB_utility_functions.Xi(m, n, theta);
    res = 1;
    iter = 1;
    while res>=least_res
        u = denoising.TVBH_SB_utility_functions.U(g, v1, v2, b1, b2, xi, theta);
        [v1, b1, v2, b2] = denoising.TVBH_SB_utility_functions.v_b(u, b1, b2, alpha, beta, theta);
        res = denoising.common_SB_utility_functions.Res(u, u_hat);
        u_hat = u;
        if iter == max_iter
            break
        end
        iter = iter + 1;
    end
end