function [out] = printHeader(in)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% out = printHeader(in) returns the scalar string `in` wrapped in a
	% pretty-print format to indicate a header.
	%

    JkUtils.assertStringScalar(in);
    
    out = JkUtils.printIndented ...
        ( sprintf("------------- %s -------------\n\n", in) ...
        , '      ' ...
        );

end