function [train_data, A, v_set, Iterations, Residuals, Lambda, p, n, N, trained_data_directory] = train(command, regularizer_type)
    input_directory = 'data/input/';
    data = load([input_directory, 'train_data.mat']);
    train_data = data.train_data;
    [~, p, N, ~] = size(train_data);

    if strcmp(command, 'start') && strcmp(regularizer_type, 'TV')
        A = zeros(257, 257);
        v_set = zeros(p, p, 2, N);
        Iterations = [0];
        Residuals = [1];
        trained_data_directory = ['data/output/trained data/', regularizer_type, '_trained_data.mat'];
        Lambda = 50;

    elseif strcmp(command, 'start') && strcmp(regularizer_type, 'TL')
        A = zeros(257, 257);
        A(1, 1) = 1;
        v_set = zeros(p, p, N);
        Iterations = [0];
        Residuals = [1];
        trained_data_directory = ['data/output/trained data/', regularizer_type, '_trained_data.mat'];
        Lambda = 224;

    elseif strcmp(command, 'start') && strcmp(regularizer_type, 'BH')
        A = zeros(257, 257);
        A(1, 1) = 1;
        v_set = zeros(p, p, 3, N);
        Iterations = [0];
        Residuals = [1];
        trained_data_directory = ['data/output/trained data/', regularizer_type, '_trained_data.mat'];
        Lambda = 2419;

    elseif strcmp(command, 'resume')
        trained_data_directory = ['data/output/trained data/', regularizer_type, '_trained_data.mat'];
        trained_data = load(trained_data_directory);
        A = trained_data.([regularizer_type, '_A']);
        v_set = trained_data.([regularizer_type, '_v_set']);
        Iterations = trained_data.([regularizer_type, '_Iterations']);
        Residuals = trained_data.([regularizer_type, '_Residuals']);
        if strcmp(regularizer_type, 'TV')
            Lambda = 50;
        elseif strcmp(regularizer_type, 'TL')
            Lambda = 224;
        elseif strcmp(regularizer_type, 'BH')
            Lambda = 2419;
        end
    end

    n = p^2;

end