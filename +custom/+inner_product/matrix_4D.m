function u_dot_v = matrix_4D(u, v)
   u_dot_v = sum(sum(u(:,:,1).*v(:,:,1) + 2*(u(:,:,2).*v(:,:,2)) + u(:,:,3).*v(:,:,3)));
end