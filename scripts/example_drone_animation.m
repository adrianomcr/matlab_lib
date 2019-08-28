

%This script is an example of how to make an animation with a drone
%It is only an example, no dynamics is being considered here

%Written by: Adriano Rezende


clear all
close all

figure(1)
view(-37.5,30)
hold on
axis equal
axis([-1 1 -1 1 -1 1])
grid on

xlabel('x')
ylabel('y')
zlabel('z')

H = eye(4);
L = 0.2;
[handle] = plot_drone(H,L);


omega = 5;

t = 0:0.01:10;
for k = 1:1:length(t)
    
    
    H(1:3,1:3) = Rot('z',omega*t(k))*Rot('y',sin(omega*t(k)))*Rot('x',sin(omega*t(k)));
    
    H(3,4) = 0.5*sin(omega*t(k));
    
    
    set_drone(H,L,handle);
    
    
    drawnow
    

    
end





