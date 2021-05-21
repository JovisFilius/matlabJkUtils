function [X] = makeFat(X)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% May 21, 2021
	%
	% X = makeFat(X) optionally returns the transpose of the input matrix
	% s.t. the output has more columns than rows, i.e.
    % size(X,1) <= size(X,2)).
	%
    % See also JkUtils.makeSkinny

    if size(X,1) > size(X,2)
        X = X';
    end

end