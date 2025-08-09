train_raw_data_directory = 'data/raw data/train';
test_raw_data_directory = 'data/raw data/test';

input_directory = 'data/input/';

train_data = zeros(16, 16, 115200, 2);
sample_index = 1;
for i = 1:450
    image_name = sprintf('%04d.png', i);
    image_directory = fullfile(train_raw_data_directory, image_name);
    image_i = imread(image_directory);
    gray_image_i = im2double(im2gray(image_i));

    [m, n] = size(image_i);
    m_blocks = m/16;
    n_blocks = n/16;
    gray_image_i = max(min(gray_image_i, 1), 0);
    gray_image_i = 1 - gray_image_i;

    noisy_gray_image_i = gray_image_i + (0.05*randn(m,n));
    for r = 0:m_blocks-1
        for s = 0:n_blocks-1
            train_data(:, :, sample_index, 1) = gray_image_i(16*r + 1 : 16*r + 16, 16*s + 1 : 16*s + 16);
            train_data(:, :, sample_index, 2) = noisy_gray_image_i(16*r + 1 : 16*r + 16, 16*s + 1 : 16*s + 16);
            sample_index = sample_index + 1;
        end
    end
end


test_data = {};
for i = 1:150
    image_name = sprintf('%04d.png', i);
    image_directory = fullfile(test_raw_data_directory, image_name);
    image_i = imread(image_directory);
    gray_image_i = im2double(im2gray(image_i));

    [m, n] = size(image_i);
    m_blocks = m/16;
    n_blocks = n/16;
    gray_image_i = max(min(gray_image_i, 1), 0);
    gray_image_i = 1 - gray_image_i;

    noisy_gray_image_i = gray_image_i + (0.05*randn(m,n));

    data_point = zeros(m, n, 2);
    data_point(:,:, 1) = gray_image_i;
    data_point(:,:, 2) = noisy_gray_image_i;

    test_data{end + 1} = data_point;
end

train_data_name = fullfile(input_directory,'train_data.mat');
save(train_data_name, 'train_data');

test_data_name = fullfile(input_directory,'test_data.mat');
save(test_data_name, 'test_data');