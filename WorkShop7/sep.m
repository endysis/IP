% Task 1 Already covered in the assignment

% Task 2 Separating the circles.

I = imread('coins.png');
IO = I;

se = strel('disk',28);
sk = strel('square',25);

I = imerode(I,se);
I = imdilate(I,sk);

figure
subplot(1,2,1)
imshow(I);

subplot(1,2,2)
imshow(IO);


% Task 3

I4 = imread('noisy-fingerprint.tif');

si = strel ('square',3);
I4 = imerode(I4,si);

L = bwlabel(I4); % Identifies the number of connected items in the image

max(max(L)); % Number of items 

iml = (L == 300); % get the 300th item
figure
imshow(iml); % and display


























