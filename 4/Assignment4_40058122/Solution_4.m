clc, clear;
close all;

%% 4. a
% Apply Otsu's algorithm to the image and show the result

% read image
img = imread('tools_noisy.png');

% calculate threshold
level = graythresh(img);

% convert the image into a binary image using the threshold
BW_a = imbinarize(img, level);

% show the result
subplot(1, 2, 1), imshow(img), title('original image');
subplot(1, 2, 2), imshow(BW_a), title('binary image using Otsu''s algorithm');

%% 4.b
% smooth the image by a 5*5 averaging filter
h = fspecial('average', 5);
img_smoothed = imfilter(img, h);

% apply Otsu
% calculate threshold
level = graythresh(img_smoothed);

% convert the image into a binary image using the threshold
BW_b = imbinarize(img_smoothed, level);

% show the result images
subplot(1, 3, 1), imshow(img), title('original image');
subplot(1, 3, 2), imshow(BW_a), title('binary image of a');
subplot(1, 3, 3), imshow(BW_b), title('binary image of b');