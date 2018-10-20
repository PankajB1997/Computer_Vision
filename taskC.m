%{ 
  Script for Task B of EE4704 Project
  Student: PANKAJ BHOOTRA
  Matric No.: A0144919W
%}

%% Question C1

img = imread('images\test3.bmp');
img_enhanced = histeq(img, 256);

%% Question C2

keypoints = ;
img_C = htrans(img, keypoints);

function Iout = htrans(Iin, keypoints)
  Iout = 7;
end