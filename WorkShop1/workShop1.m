img = imread('Lincoln.jpg');
gImg = rgb2gray(img);
imshow(gImg);

x = size(gImg,1); % X dimention
y = size(gImg,2); % Y dimention

% Left Hand Corner
xC = 655 - 9;
yC = 360 - 9;

% Making a Full Square

% Trying to make a square move around

while xC >= 1
    for i = xC:xC+9 
        for j = yC:yC+9
            gImg(j,i) = 255;    
        end
    end
    xC = xC - 3;
end

imshow(gImg);

%figure










