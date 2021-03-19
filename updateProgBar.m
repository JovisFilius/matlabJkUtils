function [progBar] = updateProgBar(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% updateProgBar(progBar) increments and visually updates the `progBar`
    % printed on the console.
    %
    % NOTA BENE: this function relies on the assumption that the last thing
    % that has been printed before was the previous iteration of `progBar`,
    % without a newline apended. It outputs as many backspaces as needed to
    % erase the previous output to create a `seemingly interactive` updated
    % progress bar.
	%
    
    if progBar.current < progBar.total
        
        progBar = JkUtils.progBarTick(progBar);
        
        JkUtils.clearProgBarOutput(progBar);
        JkUtils.dispProgBar(progBar);
        
    elseif ~isDone(progBar)
   
        progBar = finish(progBar);
        fprintf('\n')
        
    end
    
end

function bool = isDone(progBar)
    fields = fieldnames(progBar);
    bool = any(strcmp(fields, "done"));
end

function progBar = finish(progBar)
    progBar.done = 1;
end