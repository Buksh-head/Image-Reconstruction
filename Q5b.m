% Load the data
load('Q5_data.mat');

% Reshape the noisy image vector into a 2D matrix
noisy_image = fliplr(rot90(reshape(noisy_image_vec, 1296, 972), -1));

% Define the FIR filter parameters
cutoff_frequency = 0.125;
window_size = -10:10;  
filter = 2 * cutoff_frequency * sinc(2 * cutoff_frequency * window_size);  

window = numel(window_size); 
fir_filter = filter .* window;

% Convolve noisy image with FIR filter
filtered_img = conv(noisy_image_vec, fir_filter, 'same');
filtered_img_rescaled = rescale(filtered_img);
filtered_img_corrected = fliplr(rot90(reshape(filtered_img_rescaled, 1296, 972), -1)); 

row = 310;
row_pixel_intensity(noisy_image,row)
title('Noisy Image Pixel Intensities');

row_pixel_intensity(filtered_img_corrected,row)
title('Filtered Image Pixel Intensities');

% Plot the FIR filter's impulse response
figure;
stem(window_size, filter);
title('Filter - Impulse Response');
xlabel('Sample');
ylabel('Amplitude');

% Plot the filtered image
figure;
imshow(filtered_img_corrected, []);
title('Filtered Image');





