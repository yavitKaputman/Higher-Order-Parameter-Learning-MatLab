function u_dot_v = matrix_2D(u, v)
   u_dot_v = sum(sum(u(:,:,1).*v(:,:,1) + u(:,:,2).*v(:,:,2)));
end