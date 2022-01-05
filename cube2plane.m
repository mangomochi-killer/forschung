function [x,y]=cube2plane(xc,yc,zc,faceindex,cubeedgepixel)
%cubeedgepixel is the number of pixels in one edge of the cube
%convert facesize as 1*1([0,1])
%pixel coordinate,x:row,y:col
switch faceindex
    case 0
        x=cubeedgepixel*(3-zc)/2;
        y=cubeedgepixel*(yc+3)/2;
    case 1
        x=cubeedgepixel*(3-zc)/2;
        y=cubeedgepixel*(7-yc)/2;
    case 2
        x=cubeedgepixel*(3-zc)/2;
        y=cubeedgepixel*(5-xc)/2;
    case 3
        x=cubeedgepixel*(3-zc)/2;
        y=cubeedgepixel*(1+xc)/2;
    case 4
        x=cubeedgepixel*(1+xc)/2;
        y=cubeedgepixel*(yc+3)/2;
    case 5
        x=cubeedgepixel*(5-xc)/2;
        y=cubeedgepixel*(yc+3)/2;
end

end