function [xs,ys,zs]=cube2sphere(xc,yc,zc,faceindex)
%convert cube of 2*2 each face [-1,1] to sphere with r=1
%x= r cos(el) cos (az)
% y= r cos(el) sin (az)
% z= r sin (el)
%(xc,yc,zc)=(a cos(el) cos (az),acos(el) sin (az),a sin (el))
r=1;
switch faceindex
    case 0
        %a cos(el) cos (az)=1, a=1/(cos(el) cos (az))
        %(xc,yc,zc)=(1,tan(az), tan(el)/cos(az))
        az=atan(yc);
        el=atan(cos(az)*zc);
        [xs,ys,zs] = sph2cart(az,el,r);
    case 1
        %a cos(el) cos (az)=-1, a=-1/(cos(el) cos (az))
        %(xc,yc,zc)=(-1,-tan(az), -tan(el)/cos(az))
        az=atan(-yc);
        if(yc>0)
            az=az+pi;
        else
            az=az-pi;
        end        
        el=atan(-cos(az)*zc);
        [xs,ys,zs] = sph2cart(az,el,r);
    case 2
        %a cos(el) sin (az)=1, a=1/(cos(el) sin (az))
        %(xc,yc,zc)=(cot(az),1, tan(el)/sin(az))
        az=acot(xc);
        if(xc>0)
            az=az;
        else
            az=az+pi;
        end 
        el=atan(sin(az)*zc);
        [xs,ys,zs] = sph2cart(az,el,r);
    case 3
        %a cos(el) sin (az)=-1, a=-1/(cos(el) sin (az))
        %(xc,yc,zc)=(-cot(az),-1, -tan(el)/sin(az))
        az=acot(-xc);
        if(xc>0)
            az=az;
        else
            az=az-pi;
        end 
        el=atan(-sin(az)*zc);
        [xs,ys,zs] = sph2cart(az,el,r);
    case 4
        %a sin (el)=1, a=1/sin(el)
        %(xc,yc,zc)=(cot(el)*cos(az),cot(el)*sin(az), 1)
        az=atan(yc/xc);
        if(xc>0)
            if(yc>0)
                az=az;
            else
                az=az;
            end
        else
            if(yc>0)
                az=az+pi;
            else
                az=az-pi;
            end
        end 
        el=acot(yc/sin(az));
        [xs,ys,zs] = sph2cart(az,el,r);
    case 5
        %a sin (el)=-1, a=-1/sin(el)
        %(xc,yc,zc)=(-cot(el)*cos(az),-cot(el)*sin(az), -1)
        az=atan(yc/xc);
        if(xc>0)
            if(yc>0)
                az=az;
            else
                az=az;
            end
        else
            if(yc>0)
                az=az+pi;
            else
                az=az-pi;
            end
        end
        el=acot(-yc/sin(az));
        [xs,ys,zs] = sph2cart(az,el,r);
end
    


end