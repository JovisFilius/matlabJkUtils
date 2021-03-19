function bool = is_scalar_int(i)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 5, 2021
    %
    % is_scalar_int(i) returns true if i is a scalar variable of numeric
    % type with decimal and imaginary parts equal to zero.
    % NOTA BENE: `i` must only have an integer value, `class(i)` may be any
    % numeric type. (To assert that the type of `i` is integer (e.g.
    % UINT32), use the builtin function `isinteger`.)
    
    bool = isscalar(i) ...
        && isnumeric(i) ...
        && isreal(i) ...
        && rem(i,1) == 0 ...
        ;
end