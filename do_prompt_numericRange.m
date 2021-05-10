function res = do_prompt_numericRange(mn, mx)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 5, 2021
    %
    % res = do_prompt_numericRange_or_quit(mn, mx) prompts the
    % user for integer input in the closed range `[mn mx]`.
    %
    % The function keeps looping as long as no valid response has been
    % given. Note that ctrl-c is always considered a ``valid`` response and
    % causes the program to return immediately by throwing an error.
    
    prompt = sprintf ...
        ( "Please type a valid index [%d-%d]: " ...
        , mn, mx ...
        );
    
    is_valid_index = @(i) JkUtils.is_scalar_int(i) ...
                       && i>=mn ...
                       && i<=mx;

    raw = input(prompt, 's');
    res = str2double(raw);
  
    while ~is_valid_index(res)
        JkUtils.JkDisp(sprintf("%s is not a valid response", raw));
        raw = input(prompt, 's');
        res = str2double(raw);
    end
    
end