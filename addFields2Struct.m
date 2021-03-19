function [s] = addFields2Struct(s, varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 19, 2021
	%
	% s = addFields2Struct(s, varargin) adds each second value in
	% `varargin` to the struct `s` with field name of the value in
	% `varargin` that precedes it.
	%

    assert ...
        ( isscalar(s) && isstruct(s) ...
        , "First argument to addFields2Struct must be of type struct" ...
        )
    

    for i = 1:2:numel(varargin)
        s.(varargin{i}) = varargin{i+1};
    end

end