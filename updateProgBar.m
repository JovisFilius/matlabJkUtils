function [progBar] = updateProgBar(progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% updateProgBar(progBar) increments and visually updates the `progBar`
    % printed on the console.
    %
    % NB: since it is possible to create arbitrary paths through a loop
    % construct (via the `continue` statement), it is recommended to call
    % this function as the first statement inside a for loop and once
    % directly after the loop has finished.
    %
    % NOTA BENE: this function relies on the assumption that the last thing
    % that has been printed before was the previous iteration of `progBar`,
    % without a newline apended. It outputs as many backspaces as needed to
    % erase the previous output to create a `seemingly interactive` updated
    % progress bar.
	%
    
    if ~progBar.started

        progBar = start(progBar);
        JkUtils.dispProgBar(progBar);
    
    elseif progBar.current < progBar.total - 1
        
        progBar = JkUtils.progBarTick(progBar);
        
        JkUtils.clearProgBarOutput(progBar);
        JkUtils.dispProgBar(progBar);
        
    elseif ~progBar.done
   
        progBar = finish(JkUtils.progBarTick(progBar));
        JkUtils.clearProgBarOutput(progBar);
        JkUtils.dispProgBar(progBar);
        fprintf('\n')

    end
    
end

function progBar = start(progBar)
    progBar.started = true;
end

function progBar = finish(progBar)
    progBar.done = true;
end