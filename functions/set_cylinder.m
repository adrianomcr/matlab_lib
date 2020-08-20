% 
%function [handle] = set_cylinder(H,h,height,radius)
%
%H - homogeneous transformation
%h - Vector of handles for the plots
%height - Heighr
%radius - Radius

%Written by: Adriano Rezende

function [] = set_cylinder(H,h,height,radius)

    n = length(h)-1;

    theta = linspace(0,2*pi,n);
    
    tb = [radius*cos(theta); radius*sin(theta); 0*theta-height/2; 0*theta+1];
    tt = [radius*cos(theta); radius*sin(theta); 0*theta+height/2; 0*theta+1];
    
    tb = H*tb;
    tt = H*tt;
    
    set(h(1),'XData',tb(1,:),'YData',tb(2,:),'ZData',tb(3,:));
    set(h(2),'XData',tt(1,:),'YData',tt(2,:),'ZData',tt(3,:));
    
    for k = 1:1:(n-1)
        set(h(k+2),'XData',[tb(1,k) tb(1,k+1) tt(1,k+1) tt(1,k)],'YData',[tb(2,k) tb(2,k+1) tt(2,k+1) tt(2,k)],'ZData',[tb(3,k) tb(3,k+1) tt(3,k+1) tt(3,k)]);
    end

end
