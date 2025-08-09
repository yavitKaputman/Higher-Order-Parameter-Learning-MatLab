function BH_u = BH(u)
   hessian_u = discrete_operators.hessian(u);
   BH_u = custom.Norm.matrix_4D_12(hessian_u);
end