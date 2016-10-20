img = imread('small.png');
%gimg = rgb2gray(img);

imshow(img);

imshow(img);
colorbar;
colormap gray;


imagesc(img);
colorbar;
colormap gray;

% So there are 8 greyscale levels
mi = min(min(img));
ma = max(max(img));

L = ma - mi + 1;

% So i.e find(x > 2) returns a column vector which displays the line
% number positions, dont forgot in an array, it goes down the column first.
%

%pixel_Value = img;

Nk = [];
pixel_Value = [];


for i = 1:L %Loops through the number of values 
    pixel_Value(i) = i - 1; % i - 1 is the actual pixel value, this in not needed but does place the number of pixels values in an array
    frequency = find(img == pixel_Value(i)); % frequency is now an column vector containing the line number positions
    Nk(i) = length(frequency); % Length is the number of elements within the frequency array. (Freqency is a colum vector displaying the linear positions of the given intensity level)
end

bar(pixel_Value,Nk, 0.2);
% So now bar displays
% pixelValue for the x coordinate, Nk for the y coordinate, and 20% width
























