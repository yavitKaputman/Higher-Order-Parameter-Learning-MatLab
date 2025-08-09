function A_tilde = A_Tilde(A, g_bar_set, c_set, lambda, N)
    argument_matrix = A - (1/(lambda*N))*((g_bar_set).*c_set')*((g_bar_set)');
    [eigenvectors, eigenvalues] = eig(argument_matrix);
    new_eigenvalues = max(0, eigenvalues);
    A_tilde = (eigenvectors)*(new_eigenvalues)*((eigenvectors)');
end