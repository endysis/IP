img = imread('Pout.png');
img = rgb2gray(img);

%img = im2uint8(img);

% Linear Stretch

mao = max(max(img));



dimg = 255*im2double(img); % Converts the intensity of the image to a double precision * by 255 to get from 0 to 255
mi = min(min(dimg)); % Finds the minimum pizel intensity. Old Min
ma = max(max(dimg)); % Old Max

% In a linear strectch we want to hook the min to be 0 and the max to be
% 255



[x,y] = size(dimg);

imgTrans = [];


for row = 1:x
    for col = 1:y
        % Algorithm where is a strecth transform, called linear stretch
        imgTrans(row,col) = (255*(dimg(row,col) - mi))/(ma - mi); 
    end
end

imgTrans = uint8(imgTrans);

X = imadjust(img,[mi/255;ma/255],[0;1]); % Implements using a function

%imshow(imgTrans);
%imshow(X);

%Z = imsubtract(imgTrans,X);
%imshow(Z); 





figure
subplot(2,2,1);
imshow(img);
title('Original');

subplot(2,2,2);
imshow(imgTrans);
title('Equalised');

subplot(2,2,3);
imhist(img,200);
title('Original Histogram');

subplot(2,2,4);
imhist(imgTrans,200);
title('Equalised Histogram');












