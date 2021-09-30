% high pass filter using laplacian
function [img_fil] = high_pass_filter(img, hs, alpha)

fil = fspecial('laplacian', alpha); %size of the filter is hs*2+1 (odd) and sigma=1


fftsize = 1024; % preferred be be a power of 2 (for speed) and include padding
img_fft = fft2(img, fftsize, fftsize); % 1) fft im with padding; automatically zero-pads 
fil_fft = fft2(fil, fftsize, fftsize); % 2) fft fil, pad to same size as image
img_fil_fft = img_fft .* fil_fft; % 3) multiply fft images
img_fil = ifft2(img_fil_fft, 'symmetric'); % 4) inverse fft2
img_fil = img_fil(1 + hs:size(img, 1) + hs, 1 + hs:size(img, 2) + hs); % 5) remove padding

