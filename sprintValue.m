function [outStr] = sprintValue(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% sprintValue(inStr) flanks `inStr` in backquotes to clearly indicate
	% that the string contains some symbolic value.
	%
    
    JkUtils.assertStringScalar(varargin{1})
    
    inStr = sprintf(varargin{:});
    
    if isnumeric(inStr)
        inStr = string(inStr);
    end
    
    outStr = string( ...
        [ '`' ...
        , char(inStr) ...
        , '`'
        ] ...
        );
    
    
end