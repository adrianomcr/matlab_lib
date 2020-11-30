
%function f = quat_derivative(q, w)
%
%Input:
%q: quaternion
%w: angular speed in the world frame
%
%Output:
%f: derivative of the quaternion
%

function f = quat_derivative(q, w)

    q(1) = q(1);
    q(2) = q(2);
    q(3) = q(3);
    q(4) = q(4);
    
    f = [-0.5*(w(1)*q(2)+w(2)*q(3)+w(3)*q(4));
        0.5*(w(1)*q(1)+w(2)*q(4)-w(3)*q(3));
        0.5*(w(2)*q(1)+w(3)*q(2)-w(1)*q(4));
        0.5*(w(3)*q(1)+w(1)*q(3)-w(2)*q(2))];

end