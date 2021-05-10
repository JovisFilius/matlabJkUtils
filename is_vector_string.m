function [bool] = is_vector_string(strList)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 24, 2021
	%
	% bool = is_vector_string(strList) Checks whether `strList` is a vector
	% (i.e. single-dimensional of rank 2) and of type string.
    %
    % NB: char arrays are not accepted to prevent confusion, since these
    % commonly contain single strings, rather than lists of strings.
    %
    % TODO: maybe add functionality for checking 'string-like types' such
    % as char arrays.
	%

    bool = numel(size(strList)) == 2 ...
        && any(size(strList) == 1) ...
        && strcmp(class(strList), "string") ...
        ;

end