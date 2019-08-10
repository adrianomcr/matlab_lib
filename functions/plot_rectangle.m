








%function [] = plot_rectangle_str(H,str,size,wid,color,fontsize)
%
%H - homogeneous transformation
%size - Vector with the width(y) and height(z) of the square
%wid - Width of the line
%color - Color [r g b] in [0, 1]

%Written by: Adriano Rezende

function [] = plot_rectangle(H,size,wid,color)


    
    face= [[0 0 0 0];
           [1 -1 -1 1]*size(1)/2;
           [1 1 -1 -1]*size(2)/2;
           [1 1 1 1]];
       
    face(:,end+1) = face(:,1);
    
    face = H*face;
    
    plot3(face(1,:),face(2,:),face(3,:),'Color',color,'LineWidth',wid)
    
    



end








