%{ 
  Script for Task A of EE4704 Project
  Student: PANKAJ BHOOTRA
  Matric No.: A0144919W
%}

%% Question A1

% Load image test1.bmp towards task of Question A1
Img = double(imread('images\test1.bmp'));
[M, N] = size(Img);
Output = zeros(M, N);
SumVal = 0;

% Calculate 2D Discrete Fourier Transform
[nx, ny] = ndgrid([0:M-1]-(M-1)/2, [0:N-1]-(N-1)/2);
du = 1;
for u = [0:M-1]-(M-1)/2
    dv = 1;
   for v = [0:N-1]-(N-1)/2  
       SumVal = sum(sum(Img.*exp(-1i*2*3.1416*(u*nx/M+v*ny/N))));
       Output(du,dv) = SumVal;
       dv = dv+1;
   end
   du = du+1;
end
% Calculate Spectrum and display it
img_A1 = uint8(abs(Output)/60);
imshow(img_A1);

%% Question A2

% Shift fourier spectrum obtained in A1 using fftshift and display it
img_A2 = fftshift(img_A1);
imshow(img_A2);

%% Question A3
% Use log function to enhance the fourier spectrum and display using 'false
% color' color map
img_A3 = uint8(255 / log10(double(1 + max(img_A2(:)))) * log10(double(1 + img_A2)));
falseColorImage_A3 = ind2rgb(img_A3, jet(256));
imshow(falseColorImage_A3);