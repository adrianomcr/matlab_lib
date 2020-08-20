% 
%function [] = set_block(H,h,size)
%
%H - homogeneous transformation
%h - handle for the faces obtaines with plot_block function
%size - vector of lengths on x y and z

%Written by: Adriano Rezende

function [] = set_block(H,h,size)

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
   
   set(h(1),'XData',face1(1,:),'YData',face1(2,:),'ZData',face1(3,:));
   set(h(2),'XData',face2(1,:),'YData',face2(2,:),'ZData',face2(3,:));
   set(h(3),'XData',face3(1,:),'YData',face3(2,:),'ZData',face3(3,:));
   set(h(4),'XData',face4(1,:),'YData',face4(2,:),'ZData',face4(3,:));
   set(h(5),'XData',face5(1,:),'YData',face5(2,:),'ZData',face5(3,:));
   set(h(6),'XData',face6(1,:),'YData',face6(2,:),'ZData',face6(3,:));
    
end
