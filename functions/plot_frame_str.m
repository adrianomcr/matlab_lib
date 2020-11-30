
% 
%function [] = plot_frame_str(H,str,len,wid,fontsize)
%
%handle - Vector of 3 handles for the plots and a handle of text
%
%H - homogeneous transformation
%str - String with the name of the frame
%len - Length of the plot
%wid - Width of the line
%fontsize - Font size of the string
%
%Note: hold should be on. Use hold on before calling this function

%Written by: Adriano Rezende

function [handle] = plot_frame_str(H,str,len,wid,fontsize)
% function plot_frame_str(p,q,str,)



    x = [[0 1]*len;[0 0];[0 0];[1 1]];
    y = [[0 0];[0 1]*len;[0 0];[1 1]];
    z = [[0 0];[0 0];[0 1]*len;[1 1]];

    z_str = [0;0;1.5*len;1];

    x = H*x; x(4,:) = [];
    y = H*y; y(4,:) = [];
    z = H*z; z(4,:) = [];
    z_str = H*z_str; z_str(4,:) = [];



    handle(1) = plot3(x(1,:),x(2,:),x(3,:),'r','LineWidth',wid);
    handle(2) = plot3(y(1,:),y(2,:),y(3,:),'g','LineWidth',wid);
    handle(3) = plot3(z(1,:),z(2,:),z(3,:),'b','LineWidth',wid);

    
    handle(4) = text(z_str(1,:),z_str(2,:),z_str(3,:),str,'FontSize',fontsize,'interpreter','latex');



end
