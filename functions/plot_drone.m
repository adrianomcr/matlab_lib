%function [handle] = plot_drone(H,L)
%
%This function plts a drone
%
%Inputs
%H - homogeneous transformation
%L - length of the quadcopter's arm
%
%Outputs
%handle - handle to the object's parts
%
%Note: hold should be on. Use hold on before calling this function
%
%Written by: Adriano Rezende
function [handle] = plot_drone(H,L)

    %Arms
    H10 = [L*[-1 1; 0 0; 0 0]; 1 1];
    H20 = [L*[0 0; -1 1; 0 0]; 1 1];
    H1 = H*H10;
    H2 = H*H20;
    h1 = plot3(H1(1,:),H1(2,:),H1(3,:),'k-','LineWidth',3);
    h2 = plot3(H2(1,:),H2(2,:),H2(3,:),'k-','LineWidth',3);

    %Propellers
    r_prop = L/3;
    t_vec = linspace(0,2*pi,25);
    prop10 = [r_prop*[cos(t_vec)+L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop20 = [r_prop*[cos(t_vec);sin(t_vec)+L/r_prop;(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop30 = [r_prop*[cos(t_vec)-L/r_prop;sin(t_vec);(0.01/r_prop)*ones(1,25)]; ones(1,25)];
    prop40 = [r_prop*[cos(t_vec);sin(t_vec)-L/r_prop;(0.01/r_prop)*  ones(1,25)]; ones(1,25)];
    prop1 = H*prop10;
    prop2 = H*prop20;
    prop3 = H*prop30;
    prop4 = H*prop40;
    h3 = fill3(prop1(1,:),prop1(2,:),prop1(3,:),'r','FaceAlpha',0.5);
    h4 = fill3(prop2(1,:),prop2(2,:),prop2(3,:),'b','FaceAlpha',0.5);
    h5 = fill3(prop3(1,:),prop3(2,:),prop3(3,:),'b','FaceAlpha',0.5);
    h6 = fill3(prop4(1,:),prop4(2,:),prop4(3,:),'b','FaceAlpha',0.5);

    %Body
    L2 = L/6;
    BOX0 = [L2*[1 -1 -1 1 1 -1 -1 1; 1 1 -1 -1 1 1 -1 -1; -1 -1 -1 -1 1 1 1 1]; 1 1 1 1 1 1 1 1];
    BOX0 = H*BOX0;
    h7 = fill3(BOX0(1,[5 6 7 8]),BOX0(2,[5 6 7 8]),BOX0(3,[5 6 7 8]),'b','FaceAlpha',0.9);
    h8 = fill3(BOX0(1,[1 2 3 4]),BOX0(2,[1 2 3 4]),BOX0(3,[1 2 3 4]),'b','FaceAlpha',0.9);
    h9 = fill3(BOX0(1,[1 4 8 5]),BOX0(2,[1 4 8 5]),BOX0(3,[1 4 8 5]),'b','FaceAlpha',0.9);
    h10 = fill3(BOX0(1,[2 3 7 6]),BOX0(2,[2 3 7 6]),BOX0(3,[2 3 7 6]),'b','FaceAlpha',0.9);
    h11 = fill3(BOX0(1,[1 2 6 5]),BOX0(2,[1 2 6 5]),BOX0(3,[1 2 6 5]),'b','FaceAlpha',0.9);
    h12 = fill3(BOX0(1,[3 4 8 7]),BOX0(2,[3 4 8 7]),BOX0(3,[3 4 8 7]),'b','FaceAlpha',0.9);

    % Ruturn handles
    handle = [h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12];


end %function

 