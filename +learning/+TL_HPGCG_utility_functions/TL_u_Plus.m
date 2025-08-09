function TL_u_plus_set = TL_u_Plus(u_plus_set, N)
    TL_u_plus_set = zeros(N, 1);
    for i = 1:N
        TL_u_plus_set(i) = regularizer.TL(u_plus_set( : , : , i));
    end
end