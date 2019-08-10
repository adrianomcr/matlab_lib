




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





figure(2)
H = eye(4);
size = [1, 1, 1];
linestyle = '-';
color = [1 1 0];
quat = [cos(0.05), (1/sqrt(3))*sin(0.05), (1/sqrt(3))*sin(0.05), (1/sqrt(3))*sin(0.05)];
H(1:3,1:3) = quat2rotm(q);
alpha = 0.5;
plot3(0,0,0)
axis equal
grid on
hold on
plot_block(H^1,size,[0 0 1],alpha,linestyle)
pause()
plot_block(H^2,size,[0 1 0],alpha,linestyle)
pause()
plot_block(H^3,size,[0 1 1],alpha,linestyle)
pause()
plot_block(H^4,size,[1 0 0],alpha,linestyle)
pause()
plot_block(H^5,size,[1 0 1],alpha,linestyle)
pause()
plot_block(H^6,size,[1 1 0],alpha,linestyle)
pause()
plot_block(H^7,size,[1 1 1],alpha,linestyle)
hold off

