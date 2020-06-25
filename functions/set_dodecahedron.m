
% 
%function [] = set_dodecahedron(p,handle,r)
%
%p - position
%handle - handle obtainned with function pplot_dodecahedron
%r - radius

%Written by: Adriano Rezende



function [h] = set_dodecahedron(p,handle,r)

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
                [(1-h^2), 0, (1+h)]]/(1+h);

    Vertices = r*Vertices + (p(:)*ones(1,20))';

    set(handle,'Vertices',Vertices);

end
