
% 
%function [] = plot_block(H,size,color,alpha,linestyle)
%
%H - homogeneous transformation
%size - vector of lengths on x y and z
%color - Color [r g b] in [0, 1]
%alpha - Transparence [0, 1]
%linestyle - LineStyle
%Note: hold should be on. Use hold on before calling this function

%Written by: Adriano Rezende



function [] = plot_block(H,size,color,alpha,linestyle)

   face1 = [[1 1 1 1]*size(1)/2; [-1 1 1 -1]*size(2)/2; [1 1 -1 -1]*size(3)/2; [1 1 1 1]];
   face2 = [-[1 1 1 1]*size(1)/2; [-1 1 1 -1]*size(2)/2; [1 1 -1 -1]*size(3)/2; [1 1 1 1]];
   
   face3 = [[1 -1 -1 1]*size(1)/2; [1 1 1 1]*size(2)/2; [1 1 -1 -1]*size(3)/2; [1 1 1 1]];
   face4 = [[1 -1 -1 1]*size(1)/2; -[1 1 1 1]*size(2)/2; [1 1 -1 -1]*size(3)/2; [1 1 1 1]];
   
   face5 = [[1 1 -1 -1]*size(1)/2; [1 -1 -1 1]*size(2)/2; [1 1 1 1]*size(3)/2; [1 1 1 1]];
   face6 = [[1 1 -1 -1]*size(1)/2; [1 -1 -1 1]*size(2)/2; -[1 1 1 1]*size(3)/2; [1 1 1 1]];
    
   
   face1 = H*face1;
   face2 = H*face2;
   face3 = H*face3;
   face4 = H*face4;
   face5 = H*face5;
   face6 = H*face6;
   
   
   fill3(face1(1,:), face1(2,:), face1(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
   fill3(face2(1,:), face2(2,:), face2(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
   fill3(face3(1,:), face3(2,:), face3(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
   fill3(face4(1,:), face4(2,:), face4(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
   fill3(face5(1,:), face5(2,:), face5(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
   fill3(face6(1,:), face6(2,:), face6(3,:),'w','FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle)
    
   

    
end
