function [x,y]=ERP3Dto2D(xs,ys,zs,circlepixel)
%xs,ys,zs are coordinates on 3D sphere surface
%x,y are pixel coordinates of 2D image plane,x:index of row,y:index of col
%circlepixel is the number of pixels in one circle with radius=r 
%here assume xs^2+ys^2+zs^2=r^2=1, unit sphere
[az,el,r]=cart2sph(xs,ys,zs);
r=1;
x=circlepixel*(pi*0.5-el)/(pi*2);
y=circlepixel*(az+pi)/(pi*2);


end 