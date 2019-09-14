%function [handle] = plot_DJI_M100(H)
%
%This function pltsthea DJI M100 drone
%
%Inputs
%H - homogeneous transformation
%
%Outputs
%handle - handle to the object's parts
%
%Note: hold should be on. Use hold on before calling this function
%
%Written by: Adriano Rezende
function [handle] = plot_DJI_M100(H)

    L = 0.35;

    H(1:3,1:3) = H(1:3,1:3)*Rot('z',pi/4);

    %Arms
    H10 = [L*[-1 1; 0 0; 0 0]; 1 1];
    H10 = [H10(:,1) H10(:,1) H10(:,2) H10(:,2)]; H10(3,1) = -0.15; H10(3,4) = -0.15;
    H20 = [L*[0 0; -1 1; 0 0]; 1 1];
    H20 = [H20(:,1) H20(:,1) H20(:,2) H20(:,2)]; H20(3,1) = -0.15; H20(3,4) = -0.15;
    H1 = H*H10;
    H2 = H*H20;
    h1 = plot3(H1(1,:),H1(2,:),H1(3,:),'k-','LineWidth',5);
    h2 = plot3(H2(1,:),H2(2,:),H2(3,:),'k-','LineWidth',5);

    %Propellers
    r_prop = 0.15;
    t_vec = linspace(0,2*pi,25);
    prop10 = [r_prop*[cos(t_vec)+L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop20 = [r_prop*[cos(t_vec);sin(t_vec)+L/r_prop;(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop30 = [r_prop*[cos(t_vec)-L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop40 = [r_prop*[cos(t_vec);sin(t_vec)-L/r_prop;(0.01/r_prop)*  ones(1,25)]; ones(1,25)];
    prop1 = H*prop10;
    prop2 = H*prop20;
    prop3 = H*prop30;
    prop4 = H*prop40;
%     h3 = fill3(prop1(1,:),prop1(2,:),prop1(3,:),'r','FaceAlpha',0.5);
%     h4 = fill3(prop2(1,:),prop2(2,:),prop2(3,:),'g','FaceAlpha',0.5);
%     h5 = fill3(prop3(1,:),prop3(2,:),prop3(3,:),'g','FaceAlpha',0.5);
%     h6 = fill3(prop4(1,:),prop4(2,:),prop4(3,:),'r','FaceAlpha',0.5);
    h3 = fill3(prop1(1,:),prop1(2,:),prop1(3,:),'k','FaceAlpha',0.35);
    h4 = fill3(prop2(1,:),prop2(2,:),prop2(3,:),'k','FaceAlpha',0.35);
    h5 = fill3(prop3(1,:),prop3(2,:),prop3(3,:),'k','FaceAlpha',0.35);
    h6 = fill3(prop4(1,:),prop4(2,:),prop4(3,:),'k','FaceAlpha',0.35);

    %Body
    L2 = 0.1;
    BOX0 = [L2*[1 -1 -1 1 1 -1 -1 1; 1 1 -1 -1 1 1 -1 -1; [-1 -1 -1 -1 1 1 1 1]/2]; 1 1 1 1 1 1 1 1];
    BOX0 = H*H_from_pq([0,0,0],[cos(pi/8) 0 0 sin(pi/8)])*BOX0;
    h7 = fill3(BOX0(1,[5 6 7 8]),BOX0(2,[5 6 7 8]),BOX0(3,[5 6 7 8]),'k','FaceAlpha',0.9);
    h8 = fill3(BOX0(1,[1 2 3 4]),BOX0(2,[1 2 3 4]),BOX0(3,[1 2 3 4]),'k','FaceAlpha',0.9);
    h9 = fill3(BOX0(1,[1 4 8 5]),BOX0(2,[1 4 8 5]),BOX0(3,[1 4 8 5]),'k','FaceAlpha',0.9);
    h10 = fill3(BOX0(1,[2 3 7 6]),BOX0(2,[2 3 7 6]),BOX0(3,[2 3 7 6]),'k','FaceAlpha',0.9);
    h11 = fill3(BOX0(1,[1 2 6 5]),BOX0(2,[1 2 6 5]),BOX0(3,[1 2 6 5]),'k','FaceAlpha',0.9);
    h12 = fill3(BOX0(1,[3 4 8 7]),BOX0(2,[3 4 8 7]),BOX0(3,[3 4 8 7]),'k','FaceAlpha',0.9);

    
    
    %LEDs
    h13 = plot3([H1(1,2) H2(1,3)], [H1(2,2) H2(2,3)], [H1(3,2) H2(3,3)], '*g','MarkerSize',5,'LineWidth',1.5);
    h14 = plot3([H1(1,3) H2(1,2)], [H1(2,3) H2(2,2)], [H1(3,3) H2(3,2)], '*r','MarkerSize',5,'LineWidth',1.5);
%     h13 = plot3([H1(1,2) H2(2,2)], [H1(2,2) H2(2,2)], [H1(3,2) H2(3,2)], '*g','MarkerSize',15);
%     h14
    
    
    
    % Ruturn handles
    handle = [h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14];


end %function


% 
% 
%  
% figure(1)
% clf(1)
% plot3(0,0,0,'b.')
% hold on
% axis equal
% axis([-1 1 -1 1 -1 1]*0.5)
% grid on
% 
% H = eye(4);
% H(1:3,1:3) = Rot('z',pi)*Rot('y',0.2)*Rot('x',0.2);
% L = 0.2;
% plot_DJI_M100(eye(4))
