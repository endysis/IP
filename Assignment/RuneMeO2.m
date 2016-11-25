% MATLAB script for Assessment Item-1
close all;

%----------------------------------------------------------------------
% Step-1: Load input image
I = imread('AssignmentInput.jpg');
figure;
imshow(I);
title('Step-1: Load input image');
%----------------------------------------------------------------------

U = imread('Pout.png');
U = rgb2gray(U);
 
%---------------------------------------------------------------------
% Step-2: Conversion of input image to greyscale
% for you to fill in ??????????
IG = rgb2gray(I);  % Can I use this? IG == Image Gray
figure;
imshow(IG);
title('Step-2: Conversion of input image to greyscale');
%----------------------------------------------------------------------


%----------------------------------------------------------------------
% Step-3:
%Noise removal - Median Filter - To remove Salt and Pepper Noise

x = size(IG,1); % Size of X Coordinates
y = size(IG,2); % Size of Y Coordinates

padI = zeros(x+2,y+2,'uint8'); % Creates a matrix with 2 pixels larger either side, for 0 padding. 
IF = zeros(x,y,'uint8'); % Final filterd image


x1 = 2; % Non padded matrix Counter
y1 = 2; %

for x = 1:size(IG,1)
    y1 = 2;
    for y = 1:size(IG,2)
        padI(x1,y1) = IG(x,y);
        y1 = y1 + 1;
    end
    x1 = x1 + 1;
end

mid = (9 + 1)/2;

for i = 1:size(padI,1)-2
    for j = 1:size(padI,2)-2
        win = zeros(9,1); % Linear Array
        c = 1; % Counter fo the linear array
        for e = 1:3 % Incremnts the neighbourhood
            for r = 1:3
                win(c) = padI(e+i-1,r+j-1); % Start from the top left of the neighbourhood and work down.
                c = c + 1; 
            end
        end
        med = sort(win);
        IF(i,j) = med(mid);
    end
end

figure
imshow(IF); % Result
title('Median Filter');

%---------------------------------------------------------------------

%----------------------------------------------------------------------
% Step 4



r = size(IF,1);
c = size(IF,2);

imgHist = uint8(zeros(r,c));

n = r * c;

f = zeros(256,1);
pdf = zeros(256,1); % Probability
cdf = zeros(256,1); % Culumatie Probability Frequency
cum = zeros(256,1); % Cumlative Frequency
outPut = zeros(256,1); % 

for i = 1:r
    for j = 1:c
        value = IF(i,j);
        f(value + 1) = f(value + 1)+1; % Adds one each time to the given value is found within the matrix. 
    end
end

for k = 1:8
    pdf(k) = f(k)/n; %  finds the number of times the value occurs(frequency column) and divides by the number of items in the matrix
end

sum = 0;
L = 255;

for i = 1:size(pdf)
    sum = sum + f(i); 
    cum(i) = sum; % Adding cumlative frequency
    cdf(i) = cum(i)/n; % Using the above adding probability culmlative frequency.
    outPut(i) = round(cdf(i)*L);  % Rounds the value
end

for i = 1:r
    for j = 1:c
        imgHist(i,j) = outPut(IF(i,j)+1);  % Finds the value (position) in out and returns the colorating out value.
    end
end


ICS = imgHist;

figure
imshow(ICS);
title('Image Enhancement');

%----------------------------------------------------------------------


%----------------------------------------------------------------------
% Task 5

ICS = mat2gray(ICS); % Convert all to 1s and 0s

level = graythresh(ICS);

%IF = im2double(IF);

%{
for i = 1:size(ICS,1)
    for j = 1:size(ICS,2)
        if ICS(i,j) < 0.31
            ICS(i,j) = 1;
        else
            ICS(i,j) = 0;
        end 
    end
end

 % Convert all to 1s and 0s
%}
 
ICS = im2bw(ICS,level);   % 0.31
ICS = ~ICS;
 

figure
imshow(ICS)
title('Binary Image');
%----------------------------------------------------------------------


%----------------------------------------------------------------------
% Task 6  

%{
se = strel('square',4);
sk = strel('disk',4);
%}


se = strel('disk',2);
sk = strel('square',4);

ICS = imerode(ICS,se);
ICS = imdilate(ICS,sk);


% 4 disk vs 8 disk

 
figure
imshow(ICS);
%----------------------------------------------------------------------

%----------------------------------------------------------------------
%Task 7

ICS = imfill(ICS,'holes');

figure
imshow(ICS);

area_p = regionprops(ICS,'Area','Perimeter','Centroid','MajorAxisLength','MinorAxisLength');

outCol = zeros(4,1);
colC = 1;

currMetric = 0;

L = bwlabel(ICS);

figure
imshow(L);

max(max(L))
size(area_p,1);  


for x = 1:size(area_p,1)    
    currMetric = 4*pi*area_p(x).Area/area_p(x).Perimeter.^2;
    if (currMetric >= 0.2) && (currMetric <= 0.3) 
        centers = area_p(x).Centroid;
        diameters = mean([area_p(x).MajorAxisLength area_p(x).MinorAxisLength],2);
        radii = diameters/2;
        viscircles(centers,radii);
          outCol(colC) = x;
        colC = colC + 1;
    end
end

figure
imshow(ICS);


x = size(ICS,1); % Size of the gray image X
y = size(ICS,2); % Size of the gray image Y
out = zeros(x,y);


for x = 1:size(outCol,1)
    temp = (L == outCol(x));
    out = out + temp;
end



figure
imshow(out);












% https://uk.mathworks.com/help/images/ref/bwboundaries.html




























































