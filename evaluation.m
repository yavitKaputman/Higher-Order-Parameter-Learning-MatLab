function [evaluated_data] = evaluation(test_data, TV_A, TL_A, BH_A)
    N = 150;
    evaluated_data = {};
    for i = 1:N
        disp("Processing Image:---------" + i + "/150------------------")
        sample_i = test_data{i};
        [image_m, image_n, ~] = size(sample_i);
        m_blocks = image_m / 16;
        n_blocks = image_n / 16;
        evaluated_sample = zeros(image_m, image_n, 10);

        image_i = sample_i(:, :, 1);
        noisy_image_i = sample_i(:, :, 2);

        for r = 0:(m_blocks - 1)
            for s = 0:(n_blocks - 1)

                block = image_i(16*r+1 : 16*r+16, 16*s+1 : 16*s+16);
                block_shape = size(block);
                noisy_block = noisy_image_i(16*r+1 : 16*r+16, 16*s+1 : 16*s+16);

                g_bar = ones(16*16 + 1, 1);
                vectorized_noisy_block = noisy_block(:);
                g_bar(1:16*16) = vectorized_noisy_block;
                
                TV_alpha = g_bar' * TV_A * g_bar;         
                TL_alpha = g_bar' * TL_A * g_bar;
                BH_alpha = g_bar' * BH_A * g_bar;

                extension = 10; 
                noisy_block = padarray(noisy_block, [extension,extension],'symmetric');
               
                [TV_denoised_sample] = denoising.algorithms.TV_SB(noisy_block, TV_alpha, 100000, 1e-10);
                [TL_denoised_sample] = denoising.algorithms.TL_SB(noisy_block, TL_alpha, 100000, 1e-10);
                [BH_denoised_sample] = denoising.algorithms.BH_SB(noisy_block, BH_alpha, 100000, 1e-10);
                [TVL_denoised_sample] = denoising.algorithms.TVL_SB(noisy_block, TV_alpha, TL_alpha, 100000, 1e-10);
                [TVBH_denoised_sample] = denoising.algorithms.TVBH_SB(noisy_block, TV_alpha, BH_alpha, 100000, 1e-10);
                
                noisy_block = noisy_block(extension + 1 : end - extension, extension + 1: end - extension);
                TV_denoised_sample = TV_denoised_sample(extension + 1 : end - extension, extension + 1: end - extension);
                TL_denoised_sample = TL_denoised_sample(extension + 1 : end - extension, extension + 1: end - extension);
                BH_denoised_sample = BH_denoised_sample(extension + 1 : end - extension, extension + 1: end - extension);
                TVL_denoised_sample = TVL_denoised_sample(extension + 1 : end - extension, extension + 1: end - extension);
                TVBH_denoised_sample = TVBH_denoised_sample(extension + 1 : end - extension, extension + 1: end - extension);

                TV_denoised_sample = max(min(TV_denoised_sample, 1), 0);
                TL_denoised_sample = max(min(TL_denoised_sample, 1), 0);
                BH_denoised_sample = max(min(BH_denoised_sample, 1), 0);
                TVL_denoised_sample = max(min(TVL_denoised_sample, 1), 0);
                TVBH_denoised_sample = max(min(TVBH_denoised_sample, 1), 0);
                
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 1) = 1 - block;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 2) = 1 - noisy_block;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 3) = TV_alpha * ones(block_shape);
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 4) = 1 - TV_denoised_sample;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 5) = TL_alpha * ones(block_shape);
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 6) = 1 - TL_denoised_sample;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 7) = BH_alpha * ones(block_shape);     
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 8) = 1 - BH_denoised_sample;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 9) = 1 - TVL_denoised_sample;
                evaluated_sample(16*r+1 : 16*r+16, 16*s+1 : 16*s+16, 10) = 1 - TVBH_denoised_sample;
            end
        end
        evaluated_data{i} = evaluated_sample;
    end
    save('data/output/evaluated data/evaluated_data.mat','evaluated_data');
end