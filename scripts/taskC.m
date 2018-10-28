%{ 
  Script for Task C of EE4704 Project
  Student: PANKAJ BHOOTRA
  Matric No.: A0144919W
%}

%% Question C1

img = imread('img\test3.bmp');
img_enhanced = histeq(img, 256);

%% Question C2

keypoints = [11 51; 23 70; 34 120; 59 200];
img_C = htrans(img, keypoints);

function Iout = htrans(Iin, keypoints)
  % Determine number of keypoints in input
  N_K = size(keypoints, 1);
  % Initialise an array to store all N_K-1 slope values
  slopes = zeros(1, N_K-1);
  % Calculate all N_K-1 slope values
  for i = 1:(N_K-1)
      dx = keypoints(i+1, 1) - keypoints(i, 1);
      dy = keypoints(i+1, 2) - keypoints(i, 2);
      slopes(1,i) = double(dy)/double(dx);
  end
  % Get a list of all the original image keypoints/gray levels
  r = keypoints(:, 1)';
  % Get a list of all the targeted image keypoints/gray levels
  s = keypoints(:, 2)';
  % If 0 in original image is not mapped, add 0,0 keypoint
  if r(1) ~= 0
      r = [0, r];
      s = [0, s];
      slopes = [double(s(2))/double(r(2)), slopes];
  end
  % If 255 in original image is not mapped, add 255,255 keypoint
  if r(end) ~= 255
      r = [r, 255];
      s = [s, 255];
      slopes = [slopes, double(s(end) - s(end-1))/double(r(end) - r(end-1))];
  end
  % Safety check to prevent out of range
  slopes = [slopes, 0];
  % Get size of input image
  [M, N] = size(Iin);
  % Initialize output image to all zeros
  Iout = zeros(M, N);
  % For every value in input image, determine which range it belongs to and
  % accordingly, apply the corresponding mapping
  for i = 1:M
      for j = 1:N
          rangeIndex = 1;
          for k = 2:size(r, 2)
              if Iin(i, j) >= r(k)
                  rangeIndex = k;
              end
          end
          Iout(i, j) = slopes(rangeIndex) * (Iin(i, j) - r(rangeIndex)) + s(rangeIndex);
      end
  end
  % Plot transformation function
  plot(r,s);
end