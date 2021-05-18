function [outStr] = printValue(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printValue(inStr) prints the output of sprintValue(inStr) via JkPrint
	%
    % See also JkUtils.sprintValue, JkUtils.JkPrint
    
    JkUtils.JkPrint(varargin{:}, @JkUtils.sprintValue)
    
    
end