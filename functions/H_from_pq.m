

%function [H] = H_from_pq(p,q)
%
%p - position [x, y, z]
%q - quaternion [qw, qx, qy, qz]
%
%H - Homogeneous transformation


function [H] = H_from_pq(p,q)


    H = eye(4);
    H(1:3,1:3) = quat2rotm(q(:)');
    H(1:3,4) = p(:);
   

end