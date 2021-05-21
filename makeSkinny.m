function [X] = makeSkinny(X)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% May 21, 2021
	%
	% X = makeSkinny(X) optionally returns the transpose of the input
	% matrix X, s.t. the output has more rows than columns, i.e.
    % size(X,2) <= size(X,1)
	%
    % See also JkUtils.makeFat

    if size(X,2) > size(X,1)
        X = X';
    end
    
end