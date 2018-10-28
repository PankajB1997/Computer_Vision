%{ 
  Script for Task B of EE4704 Project
  Student: PANKAJ BHOOTRA
  Matric No.: A0144919W
%}

%% Question B1 and B2

% Applying contrast stretching to test2.bmp with best value of alpha
img_B2 = hstretch(double(imread('images\test2.bmp')), 1.6087);

% Implement Contrast stretching for input image with adjustable stretch
% alpha
function Iout = hstretch(Iin, alpha)
  meanVal = mean(Iin(:));
  Iout = uint8(alpha * Iin - alpha * meanVal + meanVal);
end