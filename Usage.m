




figure(1)
plot3(0,0,0)
H1 = eye(4);
H2 = H1; H2(2:3,2:3) = [0 -1; 1 0];
H1(1:3,4) = [1;0;0];
height = 4;
radius = 1;
color1 = [1 0 0];
color2 = [0 0 1];
alpha = 0.2;
n = 32;
linestyle = 'none';
hold on
plot_frame_str(eye(4),'$F_0$',0.3,2,15)
plot_cylinder(H1,height,radius,color1,alpha,n,linestyle)
plot_cylinder(H2,height,radius,color2,alpha,n,linestyle)
hold off
axis equal
grid on
xlabel('x')
ylabel('y')
zlabel('z')





% 
% theta = 0:pi/100:2*pi;
% r = (cos(theta).^4+sin(theta).^4).^(-0.25);
% x = 0*theta;
% y = r.*cos(theta);
% z = r.*sin(theta);
% 
% hold on
% plot3(x,y,z,'k-','LineWidth',2)
% hold off
