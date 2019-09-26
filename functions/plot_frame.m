


% 
%function [handle] = plot_frame(H,len,wid)
%
%handle - Vector of 3 handles for the plots
%
%H - homogeneous transformation
%len - Length of the plot
%wid - Width of the line
%
%Note: hold should be on. Use hold on before calling this function

%Written by: Adriano Rezende

function [handle] = plot_frame(H,len,wid)
% function plot_frame_str(p,q,str,)



   
    x0 = [[0 1; 0 0; 0 0]*len; 1 1];
    y0 = [[0 0; 0 1; 0 0]*len; 1 1];
    z0 = [[0 0; 0 0; 0 1]*len; 1 1];

    x = H*x0; x(4,:) = [];
    y = H*y0; y(4,:) = [];
    z = H*z0; z(4,:) = [];
   
    handle(1) = plot3(x(1,:),x(2,:),x(3,:),'r','LineWidth',wid);
    handle(2) = plot3(y(1,:),y(2,:),y(3,:),'g','LineWidth',wid);
    handle(3) = plot3(z(1,:),z(2,:),z(3,:),'b','LineWidth',wid);

% %     text(z(1,:),z(2,:),z(3,:),s);
   

end