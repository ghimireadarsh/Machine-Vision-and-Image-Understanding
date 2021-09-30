clc;
clear all;

img = imread('cat.jpeg');

img = rgb2gray(img);    %Use of the image is in color
img=double(img);
[imh, imw] = size(img);
hs = 5; % filter half-size
fil = fspecial('gaussian',2*hs+1,5); %size of the filter is hs*2+1 (odd) and sigma=1
figure(1), image(img), colormap gray
figure(2), imagesc(fil); % imagesc rescales the values for showing the image

fftsize = 1024; % preferred be be a power of 2 (for speed) and include padding
img_fft = fft2(img, fftsize, fftsize); % 1) fft im with padding; automatically zero-pads 
fil_fft = fft2(fil, fftsize, fftsize); % 2) fft fil, pad to same size as image

img_fil_fft = img_fft .* fil_fft; % 3) multiply fft images
img_fil = ifft2(img_fil_fft, 'symmetric'); % 4) inverse fft2
img_fil = img_fil(1+hs:size(img,1)+hs, 1+hs:size(img, 2)+hs); % 5) remove padding
figure(3), imagesc(log(abs(fftshift(img_fft)))), axis image, colormap jet % FFT of image plot with shifting
figure(4), imagesc(log(abs(img_fft))), axis image, colormap jet % FFT of image plot without shifting
figure(5), imagesc(img_fil), axis image, colormap gray
figure(6), imagesc(log(abs(fftshift(fil_fft)))), axis image, colormap jet 


