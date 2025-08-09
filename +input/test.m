function [test_data, TV_A, TL_A, BH_A] = test()
    input_directory = 'data/input/';
    
    data = load([input_directory, 'test_data.mat']);
    test_data = data.test_data;
    
    TV_trained_data = load('data/output/trained data/TV_trained_data.mat');
    TL_trained_data = load('data/output/trained data/TL_trained_data.mat');
    BH_trained_data = load('data/output/trained data/BH_trained_data.mat');

    TV_A = TV_trained_data.TV_A;
    TL_A = TL_trained_data.TL_A;
    BH_A = BH_trained_data.BH_A;
end