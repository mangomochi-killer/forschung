 function [xs,ys,zs]=CMP2Dto3D(x,y,cubeedgepixel)
%xs,ys,zs are coordinates of 3D sphere surface
%x,y are coordinates of 2D image plane,x:index of row,y:index of col
%cubeedgepixel is the number of pixels in one edge of the cube
%here assume xs^2+ys^2+zs^2=r^2=1, unit sphere
faceindex = -1;
% Determine the face
if (x>=(cubeedgepixel+1))&&(x<=(cubeedgepixel*2))&&(y>=(cubeedgepixel+1))&&(y<=(cubeedgepixel*2))
    faceindex=0;%positiveX
end
if (x>=(cubeedgepixel+1))&&(x<=(cubeedgepixel*2))&&(y>=(cubeedgepixel*3+1))&&(y<=(cubeedgepixel*4))
    faceindex=1;%negativeX
end
if (x>=(cubeedgepixel+1))&&(x<=(cubeedgepixel*2))&&(y>=(cubeedgepixel*2+1))&&(y<=(cubeedgepixel*3))
    faceindex=2;%positiveY
end
if (x>=(cubeedgepixel+1))&&(x<=(cubeedgepixel*2))&&(y>=1)&&(y<=(cubeedgepixel))
    faceindex=3;%nagativeY
end
if (x>=1)&&(x<=(cubeedgepixel))&&(y>=(cubeedgepixel+1))&&(y<=(cubeedgepixel*2))
    faceindex=4;%positiveZ
end
if (x>=(cubeedgepixel*2+1))&&(x<=(cubeedgepixel*3))&&(y>=(cubeedgepixel+1))&&(y<=(cubeedgepixel*2))
    faceindex=5;%nagativeZ
end


if (faceindex ~= -1)
%2D plane to cube
[xc,yc,zc]=plane2cube(x,y,faceindex,cubeedgepixel);

%cube to sphere
[xs,ys,zs]=cube2sphere(xc,yc,zc,faceindex);

else
    xs=nan;
    ys=nan;
    zs=nan;
    
end



end