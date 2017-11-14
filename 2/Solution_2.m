%
% Code for assignment 2
% Author: Qingbo Kang
% Student ID: 40058122

%% 2
% read image
gray_img = imread('H04.bmp');

gray_img = rgb2gray(gray_img);

% get the threshold value T
[T] = method2(gray_img);

% use the threshold valuye T to binarize the image
bin = im2bw(gray_img, T / 255);

% show results
subplot(1, 2, 1), imshow(gray_img), title('orginal image');
subplot(1, 2, 2), imshow(bin), title('binary image');


