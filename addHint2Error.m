function [newE] = addHint2Error(e, hintMsg)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 19, 2021
    %
    % newE = addHint2Error(e) duplicates the exception `e` and adds
    % `hintMsg` to its message field.
    %
    % See also: rethrow
    
    
    newE = struct ...
        ( "message", ...
        [ e.message ...
        , sprintf('\n\n    Hint: %s', hintMsg) ...
        ] ...
        , "identifier", e.identifier ...
        , "stack", [e.stack] ...
        );
    
    if ~isempty(e.cause)
        newE.cause = e.cause;
    end
    
end