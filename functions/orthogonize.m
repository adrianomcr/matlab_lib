




%function R_out = orthogonize(R_in)
%
%Input:
%R_in: 3x3 matrix
%
%Output:
%R_out: 3x3 matrix in a orthogonal form
%

function R_out = orthogonize(R_in)

    v1 = R_in(:,1);
    v2 = R_in(:,2);
    v3 = R_in(:,3);

    v1 = v1/norm(v1);
    v2 = v2 - v1'*v2*v1; v2 = v2/norm(v2);
    v3 = cross(v1,v2); v3 = v3/norm(v3);

    R_out = [v1,v2,v3];

end