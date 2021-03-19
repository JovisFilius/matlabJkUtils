function [] = dispProgBar(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% dispProgBar(progBar) print string representation of the current state
	% of `progBar` to stdout.
	%

    fprintf(JkUtils.progBar2Str(progBar))

end