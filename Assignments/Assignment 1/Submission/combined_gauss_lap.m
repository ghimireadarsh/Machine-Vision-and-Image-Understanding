% Combined with low pass filter using gaussian and high pass filter with laplacian filter

clc;
clear all;
high_img = imread('tiger.jpeg');
low_img = imread('girl.jpeg');

low_img = rgb2gray(low_img);    %Use of the image is in color
low_img = double(low_img);

high_img = rgb2gray(high_img);    %Use of the image is in color
high_img = double(high_img);

[imgW, imgH] = size(low_img);
high_img = imresize(high_img, [imgW, imgH]);
% figure(1), imagesc(low_img), axis image, colormap gray
figure(2), imagesc(high_img), axis image, colormap gray

low_img_fil = low_pass_filter(low_img, 15, 5);
figure(3), imagesc(low_img_fil), axis image, colormap gray

high_img_fil = high_pass_filter(high_img, 0, 0.1);

high_img_fil = high_img - high_img_fil;
figure(4), imagesc(high_img_fil), axis image, colormap gray

alpha = 0.75;
combined_image = alpha*low_img_fil + (1-alpha)*high_img_fil;
figure(5), imagesc(combined_image), axis image, colormap gray



