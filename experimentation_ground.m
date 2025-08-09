output_directory = 'data/output';
data_point_name = fullfile(output_directory,'evaluated data/evaluated_data.mat');
load(data_point_name);
data_point_name = fullfile(output_directory,'trained data/TV_trained_data.mat');
load(data_point_name);
data_point_name = fullfile(output_directory,'trained data/TL_trained_data.mat');
load(data_point_name);
data_point_name = fullfile(output_directory,'trained data/BH_trained_data.mat');
load(data_point_name);


% Saving the test samples in their directory

% image_index = [1, 2, 4, 6, 8, 9, 10];
% 
% image_folder_directory = fullfile('data\output\images');
% 
% name_list = containers.Map([1, 2, 4, 6, 8, 9, 10], {'_truth.png', '_noisy.png', '_TV.png', '_TL.png', '_BH.png', '_TVL.png', '_TVBH.png'});
% order_list = containers.Map([1, 2, 4, 6, 8, 9, 10], {0, 1, 4, 2, 3, 5, 6});
% 
% 
% for i = 1:150
%     sample = evaluated_data{i};
%     for j = 1:length(image_index)
%         t = image_index(j);
%         image = sample(:, :, t); 
%         name = name_list(t);
%         order = order_list(t);
%         image_name = sprintf('%d_%d_%s', i, order, name);
%         image_directory = fullfile(image_folder_directory, image_name);
%         imwrite(image, image_directory);
%     end
% end

% Calculating each sample's MSE and PSNR

error_list = zeros(5, 2, 150);

for i = 1:150
    sample = evaluated_data{i};
    truth = sample(:,:, 1);
    truth = truth(:);
    TL = sample(:,:, 6);
    TL = TL(:);
    BH = sample(:,:, 8);
    BH = BH(:);
    TV = sample(:,:, 4);
    TV = TV(:);
    TVL = sample(:,:, 9);
    TVL = TVL(:);
    TVBH = sample(:,:, 10);
    TVBH = TVBH(:);

    error_list(1, 1, i) = mean((truth - TL).^2);
    error_list(2, 1, i) = mean((truth - BH).^2);
    error_list(3, 1, i) = mean((truth - TV).^2);
    error_list(4, 1, i) = mean((truth - TVL).^2);
    error_list(5, 1, i) = mean((truth - TVBH).^2);

    error_list(1, 2, i) = 10*log10(1/error_list(1, 1, i));
    error_list(2, 2, i) = 10*log10(1/error_list(2, 1, i));
    error_list(3, 2, i) = 10*log10(1/error_list(3, 1, i));
    error_list(4, 2, i) = 10*log10(1/error_list(4, 1, i));
    error_list(5, 2, i) = 10*log10(1/error_list(5, 1, i));
end
% TLMSE = error_list(1,1,:);
% BHMSE = error_list(2,1,:);
% TVMSE = error_list(3,1,:);
% TVLMSE = error_list(4,1,:);
% TVBHMSE = error_list(5,1,:);
% 
% TLPSNR = error_list(1,2,:);
% BHPSNR = error_list(2,2,:);
% TVPSNR = error_list(3,2,:);
% TVLPSNR = error_list(4,2,:);
% TVBHPSNR = error_list(5,2,:);
% 
% mean(TLMSE)
% mean(BHMSE)
% mean(TVMSE)
% mean(TVLMSE)
% mean(TVBHMSE)
% 
% mean(TLPSNR)
% mean(BHPSNR)
% mean(TVPSNR)
% mean(TVLPSNR)
% mean(TVBHPSNR)

error_list(:,2,91)
error_list(:,2,142)
error_list(:,2,43)
error_list(:,2,104)
error_list(:,2,41)
error_list(:,2,59)
error_list(:,2,97)
error_list(:,2,124)


save('data/output/evaluated data/error_list.mat','error_list');

% difference = error_list(5, 1, :) - error_list(3, 1, :);
% [~, sorted_indices] = sort(difference, 'descend'); 
% 
% disp(sorted_indices(1:10));

% Iterations-Residuals graphs

% graph_directory = "data/output/graphs";
% 
% figure;
% semilogy(TV_Iterations(2:end), TV_Residuals(2:end), 'k-', 'LineWidth', 1.5);
% grid on;
% xlabel('Iterations (k)', 'Interpreter', 'latex', 'FontSize', 12);
% ylabel('$\log{D(\Omega^k, v^k)}$', 'Interpreter', 'latex', 'FontSize', 12);
% xlim([min(TV_Iterations(2:end)), max(TV_Iterations(2:end))]);
% ylim([0, 2e+5]);
% yticks = [0, 10.^(-3:5)];
% set(gca, 'YTick', yticks);
% saveas(gcf, fullfile(graph_directory, 'TV_Iterations-Residuals.png'));
% 
% figure;
% semilogy(TL_Iterations(2:end), TL_Residuals(2:end), 'k-', 'LineWidth', 1.5);
% grid on;
% xlabel('Iterations (k)', 'Interpreter', 'latex', 'FontSize', 12);
% ylabel('$\log{D(\Omega^k, v^k)}$', 'Interpreter', 'latex', 'FontSize', 12);
% xlim([min(TL_Iterations(2:end)), max(TL_Iterations(2:end))]);
% ylim([0, 1]);
% yticks = [0, 10.^(-3:0)];
% set(gca, 'YTick', yticks);
% saveas(gcf, fullfile(graph_directory, 'TL_Iterations-Residuals.png'));
% 
% figure;
% semilogy(BH_Iterations(2:end), BH_Residuals(2:end), 'k-', 'LineWidth', 1.5);
% grid on;
% xlabel('Iterations (k)', 'Interpreter', 'latex', 'FontSize', 12);
% ylabel('$\log{D(\Omega^k, v^k)}$', 'Interpreter', 'latex', 'FontSize', 12);
% xlim([min(BH_Iterations(2:end)), max(BH_Iterations(2:end))]);
% ylim([0, 10]);
% yticks = [0, 10.^(-3:1)];
% set(gca, 'YTick', yticks);
% saveas(gcf, fullfile(graph_directory, 'BH_Iterations-Residuals.png'));