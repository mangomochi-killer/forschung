function [xc,yc,zc]=plane2cube(x,y,faceindex,cubeedgepixel)
%cubeedgepixel is the number of pixels in one edge of the cube
%convert facesize as 1*1([0,1])
%pixel coordinate,x:row,y:col

%coordinate starts from 0
x=x-1;
y=y-1;

switch faceindex
    case 0
        xc=1;
        yc=2*y/cubeedgepixel-3;
        zc=3-2*x/cubeedgepixel;
    case 1
        xc=-1;
        yc=7-2*y/cubeedgepixel;
        zc=3-2*x/cubeedgepixel;
    case 2
        xc=5-2*y/cubeedgepixel;
        yc=1;
        zc=3-2*x/cubeedgepixel;
    case 3
        xc=2*y/cubeedgepixel-1;
        yc=-1;
        zc=3-2*x/cubeedgepixel;
    case 4
        xc=2*x/cubeedgepixel-1;
        yc=2*y/cubeedgepixel-3;
        zc=1;
    case 5
        xc=5-2*x/cubeedgepixel;
        yc=2*y/cubeedgepixel-3;
        zc=-1;
end
end