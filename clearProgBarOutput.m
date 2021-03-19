function [] = clearProgBarOutput(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% clearProgBarOutput(progBar) prints enough backspaces to clear the
	% output produced by `progBar2Str(progBar)`.
	%
    
    len = numel(JkUtils.progBar2Str(progBar));
    erasure = repmat('\b', 1, len - 1);

    fprintf(erasure)

end