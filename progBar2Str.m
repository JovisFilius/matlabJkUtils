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
    
    
    barStr = sprintf ...
        ( '%s%3.0f%%%% %s' ...
        , getMsgPrefix(progBar)...
        , perc ...
        , bar ...
        );
    
    %     '[////////////_/_/_/_/_/_/_/_/_]'
    
end

function prefix = getMsgPrefix(progBar)
    msg = char(progBar.msg);
    if ~isempty(msg)
        prefix = sprintf('%s:   ', msg);
    else
        prefix = '';
    end
end