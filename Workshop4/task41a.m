img = imread('Pout.png');
img = rgb2gray(img);
r = size(img,1);
c = size(img,2);

imgHist = uint8(zeros(r,c));

n = r * c;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);

for i = 1:r
    for j = 1:c
        value=img(i,j);
        f(value+1) = f(value+1)+1; % Adds one each time to the given value is found within the matrix.  
    end %                            In 1 - 8 position of the column vectors
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
    out(i) = round(cdf(i)*L); % Rounds and then times by 255 to equalise
end


for i = 1:r
    for j = 1:c
        imgHist(i,j) = out(img(i,j)+1); % Finds the value (position) in out and returns the colorating out value.
    end
end

% Still a little confuesed between 1 - 8 and 0 - 255
% If a photo contains pixel value from 1 to 8, doesent it have bit depth
% of 3, and we are converting it to a bit depth of 8??????

figure
subplot(2,2,1);
imshow(img);
title('Original');

subplot(2,2,2);
imshow(imgHist);
title('Enhanced Image');

subplot(2,2,3);
imhist(img,256);
title('Original Histogram');

subplot(2,2,4);
imhist(imgHist,256);
title('Equalised Histogram');




































