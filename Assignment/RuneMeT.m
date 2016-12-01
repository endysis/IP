% MATLAB script for Assessment Item-1

close all;

%----------------------------------------------------------------------
% Step-1: Load input image
I = imread('AssignmentInput.jpg');
figure;
imshow(I);
title('Load input image','FontSize',30);
%----------------------------------------------------------------------



%----------------------------------------------------------------------
% Step-2: Conversion of input image to greyscale
% for you to fill in ??????????
IG = rgb2gray(I);  % Can I use this? IG == Image Gray
figure;
imshow(IG);
title('Conversion of input image to greyscale','FontSize',30);
%----------------------------------------------------------------------



%----------------------------------------------------------------------
% Step-3:
%Noise removal - Median Filter - To remove Salt and Pepper Noise

%{ 
Manual Mode

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
imshow(IF); % Result
%}


% Function Mode
x = size(IG,1); % Size of the gray image X
y = size(IG,2); % Size of the gray image Y
IG = padarray(IG,[1,1]); % Funtions which pads the array

%---------------------------------------------------------
% Testing

% Shows original
figure
imshow(IG);

% Median
IMed = medfilt2(IG); % Function performs a median filter

% Mean
H = fspecial('average',[3,3]);
IM = imfilter(IG,H);

% Gausian
IGau = imgaussfilt(IG,2);

% Wiener
IW = wiener2(IG,[3,3]);

figure
subplot(2,2,1);
imshow(IMed);
title('Median Filter','FontSize',30);

subplot(2,2,2);
imshow(IM);
title('Mean Filter','FontSize',30);

subplot(2,2,3);
imshow(IGau);
title('Gausian Filter','FontSize',30);

subplot(2,2,4);
imshow(IW);
title('Wiener Filter','FontSize',30);

%---------------------------------------------------------


IG = medfilt2(IG); % Function performs a median filter
IF = zeros(x,y,'uint8'); % uint8 because range 0 - 255


x1 = 1; % Counter for new picture coordinates.
y1 = 1;

for i = 2:size(IG,1)-1 % Starts one in and ends one in
    y1 = 1;
    for j = 2:size(IG,2)-1
    IF(x1,y1) = IG(i,j);
    y1 = y1 + 1;
    end
    x1 = x1 + 1;
end

%figure
%imshow(IF); % Result
%----------------------------------------------------------------------




%----------------------------------------------------------------------
% Step 4

ID = 255*im2double(IF);

mi = min(min(ID)); % Finds the minimum pizel intensity. Old Min
ma = max(max(ID)); % Old Max

ICS = histeq(IF); % Histogram equalisation  Why??


figure;
subplot(2,2,1);
imshow(IF);
title('Original','FontSize',30);

subplot(2,2,2);
imshow(ICS);
title('Equalised','FontSize',30);

subplot(2,2,3);
imhist(IF);
title('Original Histogram','FontSize',30);

subplot(2,2,4);
imhist(ICS);
title('Equalised Histogram','FontSize',30);



%--------Testing---------------------


Low_High = stretchlim(IF);
J = imadjust(IF,stretchlim(IF),[]);

G = imadjust(IF,[],[],0.5);

G1 = imadjust(IF,[],[],1.5);



figure;
subplot(2,2,1);
imshow(ICS);
title('Histogram Equalisation','FontSize',30);

subplot(2,2,2);
imshow(J);
title('Contrast Stretching','FontSize',30);

subplot(2,2,3);
imhist(ICS);

subplot(2,2,4);
imhist(J);



subplot(2,2,1);
imshow(G);
title('Gamma Correction (Compression)','FontSize',30);


subplot(2,2,2);
imshow(G1);
title('Gamma Correction (Expansion)','FontSize',30);

subplot(2,2,3);
imhist(G);
title('Gamma Correction Histogram (Compression)','FontSize',30);

subplot(2,2,4);
imhist(G1);
title('Gamma Correction Histogram (Expansion)','FontSize',30);






%ICS = J;






%figure
%imshow(X);
% and gamma
%----------------------------------------------------------------------




%----------------------------------------------------------------------
% Task 5
% Manual
% Get grey fresh

%sobelI = edge(ICS,'Sobel');

%figure
%imshow(sobelI);


ICS = mat2gray(ICS); % Convert all to 1s and 0s


level = graythresh(ICS);

figure
imhist(ICS)
title('Histogram 0 1');


% Manual
%{
for i = 1:size(ICS,1)
    for j = 1:size(ICS,2)
        if ICS(i,j) < level
            ICS(i,j) = 1;
        else
            ICS(i,j) = 0;
        end 
    end
end
%}

% Inbulit


ICS = im2bw(ICS,0.31);
ICS = ~ICS;

%{
BW = imbinarize(ICS,0.2); 
BW = ~BW;
%}

figure
imshow(ICS);
%----------------------------------------------------------------------


%{

%----------------------------------------------------------------------
% Task 6  

%{
se = strel('square',4);
sk = strel('disk',4);
%}

se = strel('square',4);
sk = strel('disk',4);



%errI = imerode(BW,se);
%ICS = imopen(ICS,se);
%ICS = imdilate(ICS,se);

ICS = imerode(ICS,se);
ICS = imdilate(ICS,sk);


 % 4 disk vs 8 disk


figure
imshow(ICS);
%----------------------------------------------------------------------








%----------------------------------------------------------------------
%Task 7

%Sobel
%ICS = edge(ICS,'Sobel');


se = strel('square',4);
sk = strel('disk',4);

%ICS = imerode(ICS,se);

%ICS = imdilate(ICS,sk);


%ICS = imfill(ICS,'holes');


figure
imshow(ICS);



area_p = regionprops(ICS,'Area','Perimeter','Centroid','MajorAxisLength','MinorAxisLength');


outCol = zeros(4,1);
colC = 1;

currMetric = 0;

L = bwlabel(ICS);
max(max(L))
size(area_p,1)  


for x = 1:size(area_p,1)    
    currMetric = 4*pi*area_p(x).Area/area_p(x).Perimeter.^2;
    if currMetric > 0.4
        centers = area_p(x).Centroid;
        diameters = mean([area_p(x).MajorAxisLength area_p(x).MinorAxisLength],2);
        radii = diameters/2;
        viscircles(centers,radii);
    else
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


%}


%}























































