function [] = assertStringScalar(str)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% assertStringScalar(str) asserts that str is a scalar string or
	% trivially convertible to a scalar string via `string(str)`. Otherwise
	% it throws an error specifying the expected and actual types of `str`.
	%

    
    assert ...
        ( isscalar(string(str)) ...
        , "\tInput `pathStr` is not of required type.\n" ...
        + "\tExpected:\tstring scalar\n" ...
        + "\tActual:\t\t%s\t%d\t%d" ...
        , class(str), size(str,1), size(str,2) ...
        )

end