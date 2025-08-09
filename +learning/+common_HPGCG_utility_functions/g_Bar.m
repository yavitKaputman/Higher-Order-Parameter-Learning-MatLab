function g_bar_set = g_Bar(g_set, n, N)
    g_bar_set = ones(n+1, N);
    vectorized_g_set = reshape(g_set, n,N);
    g_bar_set(1:n, :) = vectorized_g_set;
end