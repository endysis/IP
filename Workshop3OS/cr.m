img = imread('Lenna.png');

g = rgb2gray(img);

[x,y] = size(g);

% 250X 241Y
% 353X 295Y

% Distances from X1 - X2 && Y1 - Y2
cropImgX = 353 - 250;
cropImgY = 295 - 241;

tempX = 0;
tempY = 0;

% Make a new matrix
cropp = uint8(zeros(cropImgY,cropImgX));

% From the rows & cols in the full image, loop through and copy the pixel
% values to the 'cropp'matrix
for i = 250:353
    tempX = tempX + 1;
    tempY = 0;
    for j = 241:295
    tempY = tempY + 1;
    cropp(tempY,tempX) = g(j,i);
    end
end
    

imshow(cropp);