function [ T ] = method2( gray_img )
%METHOD2
%

MAXIMUM = 0;
T = 0;

% calculate Pi
% get the width & height of the image
[height width] = size(gray_img);
Pi = zeros(1, 256);
for rr = 1:height
    for cc = 1:width
        Pi(gray_img(rr, cc)+1) = 1 + Pi(gray_img(rr, cc)+1);
    end
end
% convert to range [0, 1]
Pi = Pi./(width*height);

for t = 0 : 255
    Pt = sum(Pi(1 : t+1));
    if Pt == 0
        continue;
    end
    temp1 = log(Pi(1: t+1) ./ Pt);
    temp1( temp1 == -Inf ) = 0;
    
    temp2 = log(Pi(t+2 : 256) ./ (1 - Pt));
    temp2( temp2 == -Inf ) = 0;
    
    Hb = sum( (Pi(1: t+1)./Pt).* temp1 ) * (-1);
    Hw = sum( Pi(t+2 : 256)./(1-Pt) .* temp2 ) * (-1);
    Hs = Hb +Hw;
   
    if Hs > MAXIMUM
        MAXIMUM = Hs;
        T = t;
    end
    
end


end

