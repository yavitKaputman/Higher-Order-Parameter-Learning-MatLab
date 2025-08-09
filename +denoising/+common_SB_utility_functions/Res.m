function res = Res(u, u_hat)
    res = custom.Norm.matrix_vectorized_2(u - u_hat)/custom.Norm.matrix_vectorized_2(u);
end