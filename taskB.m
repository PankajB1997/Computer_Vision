%{ 
  Script for Task B of EE4704 Project
  Student: PANKAJ BHOOTRA
  Matric No.: A0144919W
%}

%% Question B1 and B2

% Applying contrast stretching to test2.bmp with best value of alpha
img_B2 = hstretch(imread('images\test2.bmp'), 1.12334802);

% Implement Contrast stretching for input image
function Iout = hstretch(Iin, alpha)
  img_max = double(max(Iin(:)));
  img_min = double(max(Iin(:)));
  img_median = double(median(Iin(:)));
  [M, N] = size(Iin);
  Iout = zeros(M, N);
  sa = uint8(0.25 * 255);
  sb = uint8(0.75 * 255);
  ra = uint8((img_min + img_median) / 2);
  rb = uint8((img_max + img_median) / 2);
  for i = 1:M
      for j = 1:N
          if Iin(i,j) >= 0 && Iin(i, j) < ra
              Iout(i,j) = uint8(alpha * double(Iin(i,j)));
          else
              if Iin(i,j) >= ra && Iin(i,j) < rb
                  Iout(i,j) = uint8((alpha * (Iin(i,j) - ra)) + sa);
              else
                  Iout(i,j) = uint8((alpha * (Iin(i,j) - rb)) + sb);
              end
          end
      end
  end
  % c = 255 - (alpha * img_max);
  % Iout = (alpha * Iin) + c;
end