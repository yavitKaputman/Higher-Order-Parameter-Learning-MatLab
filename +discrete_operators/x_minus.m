function Du = x_minus(u)
    Du = u - circshift(u,[0 1]);
end