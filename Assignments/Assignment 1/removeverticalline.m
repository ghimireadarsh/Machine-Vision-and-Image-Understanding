function output=removeverticalline()
close all;
img=imread('paper.png');
FT=fftshift(fft2(img));
figure;
subplot(1,3,1);imshow(img);
subplot(1,3,2);imshow(log(abs(FT)),[]);
pause;

% %Removing the vertical line: the center line is removed from the FT
% FT(131,1:96-1)=zeros;
% FT(131,96+1:end)=zeros;

%Removing horizontal lines: the vertical line is removed from the FT
FT(1:131-1,96)=zeros;
FT(131+1:end,96)=zeros;

output=ifft2(ifftshift(FT));
subplot(1,3,3);imshow(output,[]); 


end