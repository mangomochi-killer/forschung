function [x,y]=CMP3Dto2D(xs,ys,zs,cubeedgepixel)
%xs,ys,zs are coordinates of 3D sphere surface
%x,y are coordinates of 2D image plane,x:index of row,y:index of col
%cubeedgepixel is the number of pixels in one edge of the cube
%here assume xs^2+ys^2+zs^2=R^2=1, unit sphere

%Determine the face
if xs>0
    if (abs(xs)>=abs(ys))&&(abs(xs)>=abs(zs))
        faceindex=0;%positiveX
    end
else
    if (abs(xs)>=abs(ys))&&(abs(xs)>=abs(zs))
        faceindex=1;%negativeX
    end
end

if ys>0
    if (abs(ys)>=abs(xs))&&(abs(ys)>=abs(zs))
        faceindex=2;%positiveY
    end
else
    if (abs(ys)>=abs(xs))&&(abs(ys)>=abs(zs))
        faceindex=3;%negativeY

    end
end

if zs>0
    if (abs(zs)>=abs(xs))&&(abs(zs)>=abs(ys))
        faceindex=4;%positiveZ
    end
else
    if (abs(zs)>=abs(xs))&&(abs(zs)>=abs(ys))
        faceindex=5;%negativeZ
    end
end

%sphere to cube(cart coordinate)
[xc,yc,zc]=sphere2cube(xs,ys,zs,faceindex);

%cube to 2D plane(pixel coordinate,x:index of row,y:index of col)
[x,y]=cube2plane(xc,yc,zc,faceindex,cubeedgepixel);


end