ERP2D=imread('Big_ben_equirectangular.jpg');
imshow(ERP2D);
figure;
ERP2D=im2double(ERP2D);
ERP2Dgray=rgb2gray(ERP2D); 
imshow(ERP2Dgray);
rowpixel=size(ERP2Dgray,2);
colpixel=size(ERP2Dgray,1);
cubeedgepixel=rowpixel/4;
CMP2D=zeros(cubeedgepixel*3,rowpixel);

for i=1:colpixel
    for j=1:rowpixel
        %2Dplane to sphere
         [xs,ys,zs]=ERP2Dto3D(i,j,rowpixel);
         %sphere to 2D plane
         [x,y]=CMP3Dto2D(xs,ys,zs,cubeedgepixel);%mesh
         %mesh to grid(interpolation part)
         x=round(x)+1;
         y=round(y)+1;
         CMP2D(x,y)=ERP2Dgray(i,j);
    end
end
figure;
imshow(CMP2D);


CMProwpixel=size(CMP2D,2);
CMPcolpixel=size(CMP2D,1);
for i=1:CMPcolpixel
    for j=1:CMProwpixel
         [xs,ys,zs]=CMP2Dto3D(i,j,cubeedgepixel);
         if (isnan(xs))
             continue
         end
         [x,y]=ERP3Dto2D(xs,ys,zs,CMProwpixel);%mesh
         %mesh to grid(interpolation part)
         x=round(x)+1;
         y=round(y)+1;
         Back2ERP2D(x,y)=CMP2D(i,j);
    end
end
