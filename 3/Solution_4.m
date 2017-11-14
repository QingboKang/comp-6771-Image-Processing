% This is the solution for the NO.4 problem of Assignment 3
% Author: Qingbo Kang 
% Student ID: 40058122
% e-mail: qi_kang@encs.concordia.ca

close all;
clear;

% read in image
inImg = imread('house.tif');

inImg = inImg(:, :, 1);

% apply sobel edge detector
BW_sobel = edge(inImg, 'Sobel');

% apply canny edge detector
BW_canny = edge(inImg, 'Canny');

% compare the resulting images
subplot(1, 2, 1), imshow(BW_sobel); title('Sobel result');
subplot(1, 2, 2), imshow(BW_canny); title('Canny result');