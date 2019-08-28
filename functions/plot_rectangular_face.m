

%function [] = plot_rectangular_face(H,size,color,alpha,lineStyle)
%
%H - homogeneous transformation
%size - Vector with the width(y) and height(z) of the square
%color - Color [r g b] in [0, 1]
%alpha - Transparence [0, 1]
%lineStyle - Line style

%Written by: Adriano Rezende

function [] = plot_rectangular_face(H,size,color,alpha,lineStyle)


    
    face= [[0 0 0 0];
           [1 -1 -1 1]*size(1)/2;
           [1 1 -1 -1]*size(2)/2;
           [1 1 1 1]];
       
    face(:,end+1) = face(:,1);
    
    face = H*face;
    
    fill3(face(1,:),face(2,:),face(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',lineStyle)
    
    



end








