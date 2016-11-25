img = imread('lena_gray_256.tif');

img1 = edge(img,'Sobel');

img2 = edge(img,'Prewitt');


figure
imshowpair(img1,img2,'montage');
































