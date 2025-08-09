function BH_u_plus_set = BH_u_Plus(u_plus_set, N)
    BH_u_plus_set = zeros(N, 1);
    for i = 1:N
        BH_u_plus_set(i) = regularizer.BH(u_plus_set( : , : , i));
    end
end