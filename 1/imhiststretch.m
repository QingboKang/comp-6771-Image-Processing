function [ imgout ] = imhiststretch( imggray, stin_min, stin_max,...
    stout_min, stout_max )
%IMHISTSTRETCH 
%
imgout = imggray;

% get image size
[width, height] = size(imggray);

k1 = stout_min / stin_min;
k2 = (stout_max - stout_min) / (stin_max - stin_min);
k3 = (255 - stout_max) / (255 - stin_max);

% construct look-up table
new_grayvalue = zeros(1, 256);

for ii = 1:256
    if ii-1 <= stin_min
        new_grayvalue(ii) = k1 * (ii-1);
    elseif ii-1 >= stin_max
        new_grayvalue(ii) = k3 * (ii-1 - stin_max) + stout_max;
    else
        new_grayvalue(ii) = k2 * (ii-1 - stin_min) + stout_min;
    end
end

% rount to integers
new_grayvalue = uint8(new_grayvalue + 0.5);

% replace the image with look-up table
for rr = 1 : height
    for cc = 1 : width
        imgout(rr, cc) = new_grayvalue(imggray(rr, cc) + 1);
    end
end

%% 
figure;
plot([0:255], new_grayvalue);
grid on;
set(gca,'XLim',[0 255]); 
set(gca,'YLim',[0 255]); 
title('6-image histogram stretching mapping line');

end

