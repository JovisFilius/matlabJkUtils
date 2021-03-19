function [progBar] = progBarTick(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% progBar = progBarTick(progBar) Increments `progBar` by one unit.
	%
    
    progBar.current = progBar.current + 1;

end