function Du = y_plus(u)
    Du = circshift(u,[-1 0]) - u;
end