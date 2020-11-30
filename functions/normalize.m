
%function v = normalize(u)
%
%Input:
%q: a vector
%
%Output:
%f: the input vector normalized
%

function v = normalize(u)

	if(norm(u)>1e-6)
        v = u/norm(u);
    else
        warning('Bad normalization')
        v = u/(norm(u)+1e-8);
    end

end