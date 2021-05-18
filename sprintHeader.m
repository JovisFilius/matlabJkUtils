function [out] = sprintHeader(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% out = printHeader(in) returns the scalar string `in` wrapped in a
	% pretty-print format to indicate a header.
	%

    JkUtils.assertStringScalar(varargin{1});
    
    in = sprintf(varargin{:});
    
    out = JkUtils.sprintIndented ...
        ( sprintf("------------- %s -------------\n\n", in) ...
        , 'indent', '      ' ...
        );

end