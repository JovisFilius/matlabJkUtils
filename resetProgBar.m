function [progBar] = resetProgBar(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% progBar = resetProg(progBar) resets `progBar` and returns it.
	% Specifically, the `current` field is reset to 0 and the `done` field
	% is removed from the struct (if it exists).
	%
    
    progBar.current = 0;
    
    try
        progBar = rmfield(progBar, 'done');
    catch
    end


end