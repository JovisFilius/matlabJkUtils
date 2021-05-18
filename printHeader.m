function [] = printHeader(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% out = printHeader(in) prints the scalar string `in` wrapped in a
	% pretty-print format to indicate a header by using sprintHeader
	%
    % See also JkUtils.sprintHeader

    JkUtils.JkPrint(varargin{:}, @JkUtils.sprintHeader)

end