a = uint8(zeros(200,200)); 

[x,y] = size(a);

%Center of circle

radius = 80;
circleDiameter = 160;

fadeNum = 100;

% Makes the center == to 1 or 255
scale = 255/100;


for i = 1:x
    fadeNum = 80;
    for j = 1:y
        D = sqrt((i - x/2)^2 + (j - y/2)^2);
        if D < radius
           % if(j < 100)
            %a(i,j) = fadeNum;
            %fadeNum = fadeNum + 1;
            %else
            a(i,j) = j * scale;
            %end
        else
            a(i,j) = 0;
        end
    end    
end


image(a);

imshow(a);