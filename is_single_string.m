function [bool] = is_single_string(in)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% May 18, 2021
	%
	% bool = is_single_string(in) checks if `in` is a scalar string or a
	% horizontal character vector.
	%

    bool = isStringScalar(in) || (ischar(in) && size(in, 1) == 1);

end