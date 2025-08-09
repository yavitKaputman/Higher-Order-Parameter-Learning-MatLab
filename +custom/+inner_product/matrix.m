function u_dot_v = matrix(u, v)
   u_dot_v = sum(u(:).*v(:));
end