function Du = y_minus(u)
    Du = u - circshift(u,[1 0]);
end