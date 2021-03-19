function [barStr] = progBar2Str(progBar)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 18, 2021
    %
    % printProgBar(progBar) prints a representation of the current
    % status of `progBar` that is suitable for output via `fprintf`.
    %
    % NB: the resulting `barStr` contains escaped sequences that will look
    % weird if the output is displayed on screen via `disp`.
    %
    
    fields = fieldnames(progBar);
    
    if any(strcmp(fields, "msg"))
        msg = progBar.msg;
    else
        msg = '';
    end
    
    frac = progBar.current / progBar.total;
    perc = 100 * frac;
    
    barLength = progBar.dispLength - 2; % correct for bar border chars [ ... ]
    numFilled = round(frac * barLength);
    numEmpty = barLength - numFilled;
    
    bar = [ '[' ...
        , repmat('/', 1, numFilled) ...
        , repmat('_', 1, numEmpty) ...
        , ']' ...
        ];
    
    barStr = sprintf('%s:   %3.0f%%%% %s' ...
        , msg, perc, bar);
    
    %     '[////////////_/_/_/_/_/_/_/_/_]'
    
end