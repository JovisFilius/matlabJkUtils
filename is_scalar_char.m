function bool = is_scalar_char(c)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 16, 2021
    %
    % is_scalar_char(i) returns true if c is both a scalar and of class
    % 'char'.
    
    bool = isscalar(c) ...
        && ischar(c) ...
        ;
end