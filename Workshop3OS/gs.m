img = imread('Lenna.png');

g = rgb2gray(img);
t = transpose(g);
r = imrotate(g,90,'bilinear');

figure
subplot(1,2,1),imshow(t);
title('Transpose');

subplot(1,2,2),imshow(r);
title('Rotation');

