%function [] = set_DJI_M100(H,handle)
%
%This function changes the pose of the DJI M100 drone
%
%Inputs
%H - homogeneous transformation
%handle - vector of handles obtained from function plot_drone()
%
%Outputs
% -
%
%Note:This function should be called after the function plot_drone()
%
%Written by: Adriano Rezende
function [] = set_DJI_M100(H,handle)

    L = 0.35;

    H(1:3,1:3) = H(1:3,1:3)*Rot('z',pi/4);

    %Arms
    H10 = [L*[-1 1; 0 0; 0 0]; 1 1];
    H10 = [H10(:,1) H10(:,1) H10(:,2) H10(:,2)]; H10(3,1) = -0.15; H10(3,4) = -0.15;
    H20 = [L*[0 0; -1 1; 0 0]; 1 1];
    H20 = [H20(:,1) H20(:,1) H20(:,2) H20(:,2)]; H20(3,1) = -0.15; H20(3,4) = -0.15;


    %Propellers
    r_prop = 0.15;
    t_vec = linspace(0,2*pi,25);
    prop10 = [r_prop*[cos(t_vec)+L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop20 = [r_prop*[cos(t_vec);sin(t_vec)+L/r_prop;(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop30 = [r_prop*[cos(t_vec)-L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop40 = [r_prop*[cos(t_vec);sin(t_vec)-L/r_prop;(0.01/r_prop)*ones(1,25)]; ones(1,25)];


    %Body
    L2 = 0.1;
    BOX0 = [L2*[1 -1 -1 1 1 -1 -1 1; 1 1 -1 -1 1 1 -1 -1; [-1 -1 -1 -1 1 1 1 1]/2]; 1 1 1 1 1 1 1 1];
    
    
    H1 = H*H10;
    H2 = H*H20;
    prop1 = H*prop10;
    prop2 = H*prop20;
    prop3 = H*prop30;
    prop4 = H*prop40;

    BOX = H*H_from_pq([0,0,0],[cos(pi/8) 0 0 sin(pi/8)])*BOX0;

    
    set(handle(1),'XData',H1(1,:),'YData',H1(2,:),'ZData',H1(3,:));
    set(handle(2),'XData',H2(1,:),'YData',H2(2,:),'ZData',H2(3,:));

    set(handle(3),'XData',prop1(1,:),'YData',prop1(2,:),'ZData',prop1(3,:));
    set(handle(4),'XData',prop2(1,:),'YData',prop2(2,:),'ZData',prop2(3,:));
    set(handle(5),'XData',prop3(1,:),'YData',prop3(2,:),'ZData',prop3(3,:));
    set(handle(6),'XData',prop4(1,:),'YData',prop4(2,:),'ZData',prop4(3,:));

    set(handle(7),'XData',BOX(1,[5 6 7 8]),'YData',BOX(2,[5 6 7 8]),'ZData',BOX(3,[5 6 7 8]));
    set(handle(8),'XData',BOX(1,[1 2 3 4]),'YData',BOX(2,[1 2 3 4]),'ZData',BOX(3,[1 2 3 4]));
    set(handle(9),'XData',BOX(1,[1 4 8 5]),'YData',BOX(2,[1 4 8 5]),'ZData',BOX(3,[1 4 8 5]));
    set(handle(10),'XData',BOX(1,[2 3 7 6]),'YData',BOX(2,[2 3 7 6]),'ZData',BOX(3,[2 3 7 6]));
    set(handle(11),'XData',BOX(1,[1 2 6 5]),'YData',BOX(2,[1 2 6 5]),'ZData',BOX(3,[1 2 6 5]));
    set(handle(12),'XData',BOX(1,[3 4 8 7]),'YData',BOX(2,[3 4 8 7]),'ZData',BOX(3,[3 4 8 7]));
    
    
    
    set(handle(13),'XData',[H1(1,2) H2(1,3)],'YData',[H1(2,2) H2(2,3)],'ZData',[H1(3,2) H2(3,3)]);
    set(handle(14),'XData',[H1(1,3) H2(1,2)],'YData',[H1(2,3) H2(2,2)],'ZData',[H1(3,3) H2(3,2)]);
    

    

end %function

