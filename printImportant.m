function [] = printImportant(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printImportant(strIn) prints the output of sprintImportant(strIn) via
    % JkPrint.
	%
    % See also JkUtils.sprintImportant, JkUtils.JkPrint
    
    JkUtils.JkPrint(varargin{:}, @JkUtils.sprintImportant)
end