

% 
%function [] = set_frame(H,handle,len)
%
%H - homogeneous transformation
%handle - Vector of 3 handles for the plots
%len - Length of the plot
%
%Written by: Adriano Rezende

function [] = set_frame(H,handle,len)


   
    x0 = [[0 1; 0 0; 0 0]*len; 1 1];
    y0 = [[0 0; 0 1; 0 0]*len; 1 1];
    z0 = [[0 0; 0 0; 0 1]*len; 1 1];

    x = H*x0; x(4,:) = [];
    y = H*y0; y(4,:) = [];
    z = H*z0; z(4,:) = [];
   
    set(handle(1),'XData',x(1,:),'YData',x(2,:),'ZData',x(3,:));
    set(handle(2),'XData',y(1,:),'YData',y(2,:),'ZData',y(3,:));
    set(handle(3),'XData',z(1,:),'YData',z(2,:),'ZData',z(3,:));
   

end