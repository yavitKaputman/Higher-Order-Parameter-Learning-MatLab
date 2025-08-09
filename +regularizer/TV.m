function TV_u = TV(u)
   grad_u = discrete_operators.grad(u);
   TV_u = custom.Norm.matrix_2D_12(grad_u);
end