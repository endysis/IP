img = imread('Lenna.png');
g = rgb2gray(img);

[x,y] = size(g);

imshow(g);

tempX = 1;
tempY = 1;

for i = 1 : x
    for j = 1 : y
    tempX = i/32;
    tempY = j/32;
    g(tempX,tempY);
    end
end 

% The type of int we use determines the scale length of each value within
% the image i.e. int8 = 0 - 255

% We need to go through each pixel within the array round it to a certain
% level using bare if-else statements


    Value = g(x,y);