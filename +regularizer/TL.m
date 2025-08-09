function TL_u = TL(u)
   delta_u = discrete_operators.delta(u);
   TL_u = custom.Norm.matrix_vectorized_2(delta_u);
end