function [] = printIndented(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printIndented(strs,...,'indent', indent) prints the output of 
    % sprintIndented(strs, indent) via JkPrint. If indent is omitted, a
    % default of 4 spaces is used.
	%
    % See also JkUtils.sprintIndented, JkUtils.JkPrint
    
    JkUtils.JkPrint(varargin{:}, @JkUtils.sprintIndented)
end