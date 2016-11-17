img = imread('small.png');


mi = min(min(img)); % Finds the minimum pizel intensity. Old Min
ma = max(max(img)); % O
%ld Max



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


r = size(img,1);
c = size(img,2);


imgout = uint8(zeros(size(img)));

n = r * c; % Size
nk = zeros(256,1); % Creates a column vector % look at word doc
nCum = zeros(256,1); % Sigma
out = zeros(256,1);



for i = 1:r
    for j = 1:c
        value = img(i,j);
        nk(value + 1) = nk(value+1) + 1;     
    end
end



        










