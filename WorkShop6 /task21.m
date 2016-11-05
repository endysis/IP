I = imread('Pout.png');
IG = rgb2gray(I);

ID = im2double(IG);
IOut = zeros(size(ID));

sobelX = [-1,0,1; -2,0,2; -1,0,1]; % Sobel Filter X
sobelY = [1,2,1; 0,0,0; -1,-2,-1]; % Sobel Filter Y


% Task 2.1
for i = 2:size(ID,1)-1
    for j = 2:size(ID,2)-1
        sumX = 0;
        sumY = 0;
        for x = 1:3
            for y = 1:3
                sumX = sumX + ID((i-2)+x,(j-2)+y)*sobelX(x,y); % Adds the sum of the neighbourhood pixels
                sumY = sumY + ID((i-2)+x,(j-2)+y)*sobelY(x,y); % You want top left to start (-1) so you need to -2 from 1 (x,y) to get there
            
            end
        end
        IOut(i-1,j-1) = sqrt(sumX^2+sumY^2); % Writes the combined output to the out image
    end
end

%imshow(IOut);


% Task 2.2

%3x3 sobel Y filter mask (Hozinontal)
F = fspecial('sobel'); 

% For vertical we need to transpose
FT = transpose(F); % This doesent seem to work

% Inbuilt filter function using the above
FF1 = imfilter(ID,F);
FF2 = imfilter(ID,FT);
IOutF = zeros(size(ID));



for x = 1:size(ID,1)
    for y = 1:size(ID,2)
        IOutF(x,y) = sqrt((FF1(x,y)^2)+(FF2(x,y)^2));
    end
end
    
    

%imshow(IOutF);
    
    

figure;
subplot(2,1,1)
imshow(IOut)
title('Own Function')

subplot(2,1,2)
imshow(IOutF)
title('In-Built Function');






% Task 3

gaus = [1,2,1; 2,4,2; 1,2,1]; % Then divide by 16;
GOut = zeros(size(ID));


for i = 2:size(ID,1)-1
    for j = 2:size(ID,2)-1
        mask = zeros(9,1);
        mC = 1; % mask counter
        for x = 1:3
            for y = 1:3
                mask(mC) = ID((i-2)+x,(j-2)+y) * gaus(x,y);
                mC = mC + 1;
            end
        end
        sum = 0;
        for u = 1:size(mask)
            sum = sum + mask(u);
        end
        GOut(i-1,j-1) = sum/16; % This will mean the output will not be filled 1px right and 1 px down
    end
end

SI = zeros(size(ID));

for x = 1:size(ID,1)
    for y = 1:size(ID,2)
        SI(x,y) = ID(x,y) - GOut(x,y); % Take from 
    end 
end

SOut = zeros(size(ID));

for x = 1:size(ID,1)
    for y = 1:size(ID,2)
        SOut(x,y) = ID(x,y) + SI(x,y); % Add to
    end
end



figure;
subplot(2,1,1)
imshow(ID)
title('Original')

subplot(2,1,2)
imshow(SOut)
title('Sharpened');




























