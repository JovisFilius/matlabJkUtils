function [outStr] = printValue(inStr)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printValue(inStr) flanks `inStr` in backquotes to clearly indicate
	% that the string contains some symbolic value.
	%
    
    JkUtils.assertStringScalar(inStr)
    
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