clc, clear;
close all;

%% 5.a
% do wavelet transform up to and including level 3 by using Haar wavelet

lena = imread('lena.bmp');

[c_haar, s_haar] = wavedec2(lena, 3, 'haar');

%% 5.b
% do wavelet transform up to and including level 3 by using Daubechies-4
% wavelet
[c_db4, s_db4] = wavedec2(lena, 3, 'db4');

%% 5.c 
% visually compare the quality of the approximation images at level 3 of
% the two cases
A1 = appcoef2(c_haar, s_haar, 'haar', 3);
A1img = wcodemat(A1,255,'mat',1);
A2 = appcoef2(c_db4, s_db4, 'db4', 3);
A2img = wcodemat(A2,255,'mat',1);

subplot(1, 2, 1), imshow(uint8(A1img)), title( ...
    'approximation image of Haar wavelet level 3');
subplot(1, 2, 2), imshow(uint8(A2img)), title( ...
    'approximation image of Daubechies-4 wavelet level 3');