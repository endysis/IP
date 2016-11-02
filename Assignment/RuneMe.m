% MATLAB script for Assessment Item-1
close all;

% Step-1: Load input image
I = imread('AssignmentInput.jpg');
%figure;
%imshow(I);
%title('Step-1: Load input image');

% Step-2: Conversion of input image to greyscale
% for you to fill in ??????????
IG = rgb2gray(I);  % Can I use this? IG == Image Gray
%figure;
%imshow(IG);
%title('Step-2: Conversion of input image to greyscale');
%{
% Step-3: Noise removal - Median Filter - To remove Salt and Pepper Noise
x = size(IG,1); % Size of X Coordinates
y = size(IG,2); % Size of Y Coordinates

padI = zeros(x,y,'uint8'); % Creates a matrix with 2 pixels larger either side, for 0 padding. 
IF = zeros(x,y,'uint8'); % Final filterd image
window = zeros(3,3,'uint8');

x1 = 1; % Non padded matrix Counter
y1 = 1; %


for i = 2:size(padI,1)-1   % Copying over the gray image to the padded matrix
    y1 = 1;
    for j = 2:size(padI,2)-1
        padI(i,j) = IG(x1,y1);
        y1 = y1 +1;
    end
    x1 = x1 +1;
end

imshow(padI);
%imshow(IG); %}

%}

x = size(IG,1);
y = size(IG,2);

IG = padarray(IG,[1,1]);

IG = medfilt2(IG);

IGW = zeros(size(IG));


x1 = 1;
y1 = 1;

for i = 2:size(IG,1)-1
    y1 = 1;
    for j = 2:size(IG,2)-1
    IGW(x1,y1) = IG(i,j);
    y1 = y1 + 1;
    end
    x1 = x1 + 1;
end



imshow(IGW);
























for i = 2:size(padI,1)-2
    for j = 2:size(padI,2)-2
        window = zeros(9,1);
        c = 1;
        for e = 1:3
            for r = 1:3
                window(c) = padI(e+i-1,r+j-1);
                c = c + 1;
            end
        end
        med = sort(window);
        IF(i-1,j-1) = med(5);
    end
end

imshow(IF);



































