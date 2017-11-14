% This is the programming solution for Assignment 1
% Author: Qingbo Kang 
% Student ID: 40058122
% e-mail: qi_kang@encs.concordia.ca

close all;
clear;

%% 1
% read the grayscales of the image
gray_img = imread('jetplaneCor.tiff');
imshow(gray_img);
title('1');

%% 2
% calculate the histogram of the image and display the histogram chart
% get the width & height of the image
[height width] = size(gray_img);
% save the histogram data
hist_data = zeros(1, 256);

% loop to calculate the occurrence numbers of all gray levels
for rr = 1:height
    for cc = 1:width
        hist_data(gray_img(rr, cc)+1) = 1 + hist_data(gray_img(rr, cc)+1);
    end
end
% display the histogram chart
figure;
bar([0:255], hist_data);
set(gca, 'xtick', [0:50:255]);
set(gca,'XLim',[0 255]); 
title('2-histogram chart');

%% 3
% use the imhist function
figure;
imhist(gray_img);
title('3-histogram obtained using the imhist');

%% 4
% write a program to do histogram equalization on this image
% calculate distribution density of gray levels
prob_data = zeros(1, 256);
totalPixelNum = height * width * 1.0;
for ii = 1 : 256
    prob_data(ii) = hist_data(ii) / totalPixelNum;
end
% calculate cumulative histogram distribution
cumn_data = zeros(1, 256);
for ii = 1 :256
    if ii == 1
        cumn_data(ii) = prob_data(ii);
    else
        cumn_data(ii) = cumn_data(ii - 1)+ prob_data(ii);
    end
end
% round to integer
cumn_data = uint8( 255 .* cumn_data + 0.5 );

% map to new gray level
hieq_img = zeros([height, width]);
for rr = 1 :height
    for cc = 1 :width
       hieq_img(rr, cc) = cumn_data(gray_img(rr, cc) + 1);
    end
end
% convert to uint8
hieq_img = uint8(hieq_img);

figure;
subplot(1, 2, 1), imshow(gray_img), title('4-original grayscale image');
subplot(1, 2, 2), imshow(hieq_img), ...
    title('4-histogram equalization by my program');

%% 5
% using histeq function
histequ_img = histeq(gray_img);

figure;
subplot(1, 2, 1), imshow(hieq_img), title('5-my own program');
subplot(1, 2, 2), imshow(histequ_img), title('5-using histequ function');

%% 6
% I plot the mapping line in the function imhiststretch 

%% 7
% By inspecting the input image and its histogram, I observed that
% a majority of pixels fall into the range [180, 230], and in order to
% achieve the best quality which means stretch the image contrast,
% I decided to expand this range to a much wider range, 
% so I choose [100, 250] range. I map input range [180, 230] to output
% range [100, 250].
imgout = imhiststretch(gray_img, 180, 230, 100, 250);

%% 8
% plot the output image and its histogram after the contrast stretching
% process
figure;
subplot(1, 2, 1), imshow(imgout), title('8-output image');
subplot(1, 2, 2), imhist(imgout), title('8-histogram of output image');

