function [xc,yc,zc]=sphere2cube(xs,ys,zs,faceindex)
%convert sphere to cube of 2*2 each face [-1,1]
switch faceindex
    case 0
        xc=1;
        yc=ys/abs(xs);
        zc=zs/abs(xs);
    case 1
        xc=-1;
        yc=ys/abs(xs);
        zc=zs/abs(xs);
    case 2
        xc=xs/abs(ys);
        yc=1;
        zc=zs/abs(ys);
    case 3
        xc=xs/abs(ys);
        yc=-1;
        zc=zs/abs(ys);
    case 4
        xc=xs/abs(zs);
        yc=ys/abs(zs);
        zc=1;
    case 5
        xc=xs/abs(zs);
        yc=ys/abs(zs);
        zc=-1;
end
end