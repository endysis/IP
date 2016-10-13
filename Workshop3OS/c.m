a = uint8(zeros(200,200)); 

[x,y] = size(a);

%Center of circle

radius = 80;


for i = 1:x
    for j = 1:y
        D = sqrt((i - x)^2 + (j - y)^2);
        if D < radius
            a(i,j) = 255;
        else
            a(i,j) = 0;
        end
    end    
end


image(a);

imshow(a);





