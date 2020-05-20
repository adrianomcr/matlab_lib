
% 
%function [] = plot_dodecahedron(p,r,color,alpha,linestyle)
%
%p - position
%r - radius
%color - Color [r g b] in [0, 1]
%alpha - Transparence [0, 1]
%linestyle - LineStyle
%Note: hold should be on. Use hold on before calling this function

%Written by: Adriano Rezende



function [h] = plot_dodecahedron(p,r,color,alpha,linestyle)

    h = (-1+sqrt(5))/2;

	Vertices = [[-1, -1, -1];
                [-1, -1, 1];
                [-1, 1, -1];
                [-1, 1, 1];
                [1, -1, -1];
                [1, -1, 1];
                [1, 1, -1];
                [1, 1, 1];
                [0, -(1+h), -(1-h^2)];
                [0, -(1+h), (1-h^2)];
                [0, (1+h), -(1-h^2)];
                [0, (1+h), (1-h^2)];
                [-(1+h), -(1-h^2), 0];
                [-(1+h), (1-h^2), 0];
                [(1+h), -(1-h^2), 0];
                [(1+h), (1-h^2), 0];
                [-(1-h^2), 0, -(1+h)];
                [-(1-h^2), 0, (1+h)];
                [(1-h^2), 0, -(1+h)];
                [(1-h^2), 0, (1+h)]];

    Vertices = r*Vertices + (p(:)*ones(1,20))';
            
    Faces = [[1,17,19,5,9];
             [1,13,14,3,17];
             [3,11,7,19,17];
             [7,16,15,5,19];
             [14,4,12,11,3];
             [12,8,16,7,11];
             [15,6,10,9,5];
             [10,2,13,1,9];
             [2,18,4,14,13];
             [8,20,6,15,16];
             [18,20,8,12,4];
             [6,20,18,2,10]];

    h = patch('Faces',Faces,'Vertices',Vertices,'FaceColor',color,'FaceAlpha',alpha,'LineStyle',linestyle);

   

    
end
