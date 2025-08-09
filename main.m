% command = 'start';
% % command = 'resume';
% % 
% % regularizer_type = 'TV';
% % regularizer_type = 'TL';
% % regularizer_type = 'BH';
% 
% [train_data, A, v_set, Iterations, Residuals, lambda, p, n, N, trained_data_directory] = input.train(command, regularizer_type);
% 
% if strcmp(regularizer_type, 'TV')
%     [TV_A, TV_v_set, TV_Iterations, TV_Residuals] = learning.algorithms.TV_HPGCG(A, v_set, Iterations, Residuals, train_data, 25000, 1e-4, 250, lambda, p, n, N, trained_data_directory);
% elseif strcmp(regularizer_type, 'TL')
%     [TL_A, TL_v_set, TL_Iterations, TL_Residuals] = learning.algorithms.TL_HPGCG(A, v_set, Iterations, Residuals, train_data, 25000, 1e-4, 50, lambda, p, n, N, trained_data_directory);
% elseif strcmp(regularizer_type, 'BH')
%     [BH_A, BH_v_set, BH_Iterations, BH_Residuals] = learning.algorithms.BH_HPGCG(A, v_set, Iterations, Residuals, train_data, 25000, 1e-4, 100, lambda, p, n, N, trained_data_directory);
% end
% 
% [test_data, TV_A, TL_A, BH_A] = input.test();
% [evaluated_data] = evaluation(test_data, TV_A, TL_A, BH_A);