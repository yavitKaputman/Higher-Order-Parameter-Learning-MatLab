function Du = x_plus(u)
    Du = circshift(u,[0 -1]) - u;
end