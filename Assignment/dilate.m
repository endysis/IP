img = imread('pout.png');
img = rgb2gray(img);
img = im2bw(img,0.5);

%se = [0,1,0; 1,0,1; 0,1,0]; % I think disk 1
se = [0,0,1,0,0; 0,1,1,1,0; 1,1,0,1,1; 0,1,1,1,0; 0,0,1,0,0;]; % disk 2

%figure
%imshow(se);

img = padarray(img,[2,2],1);
imgOut = img;


c = 0;


xx = -2;
yy = -2;

breakCheck = 0; % checks if it can exit the structing element

for x = 3:size(img,1) -2
    for y = 3:size(img,2) -2

        breakCheck = 0;
        xx = -2; % Reset X
        for i = 1:size(se,1)  % size of the 
            yy = -2;  % Reset Y
            for j = 1:size(se,2)
                if se(i,j) == 1 % If it finds a point in the kernal which is == to one. 
                   if img(x+xx,y+yy) == se(i,j) % Okay, if the corresponding pixel value in the image == 1
                       
                         imgOut(x,y) = 1; % if not (then its 0) andChange the evauating pixel to 0
                         breakCheck = 1; % the pixel is now 0
                         break % so we can now break out of the loop
                   end
                end
                   yy = yy + 1;
            end
            if breakCheck == 1 %Stop evaluating if it has found a neighbourhood pixel which is 0
                break
            end
            xx = xx + 1;
        end 
    end
end



seF = strel('disk',2);
img = imdilate(img,seF);

figure
imshow(img);


figure
imshow(imgOut);




