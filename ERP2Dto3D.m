function [xs,ys,zs]=ERP2Dto3D(x,y,rowpixel)
%xs,ys,zs are coordinates on 3D sphere surface
%x,y are pixel coordinates of 2D image plane,x:index of row,y:index of col
%rowpixel is the number of pixels in one row=circlepixel 
%here assume xs^2+ys^2+zs^2=r^2=1, unit sphere
r=1;
az=(y*pi*2)/rowpixel-pi;
el=0.5*pi-(x*pi*2)/rowpixel;
[xs,ys,zs] = sph2cart(az,el,r);
end