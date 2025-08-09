function TV_u_plus_set = TV_u_Plus(u_plus_set, N)
    TV_u_plus_set = zeros(N, 1);
    for i = 1:N
        TV_u_plus_set(i) = regularizer.TV(u_plus_set( : , : , i));
    end
end