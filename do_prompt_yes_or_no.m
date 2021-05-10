function bool = do_prompt_yes_or_no(questionMsg)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 16, 2021
    %
    % res = do_prompt_yes_or_no(questionMsg) prompts the
    % user for `y/n` input in response on the `questionMsg`.
    %
    % The function keeps looping as long as no valid response has been
    % given. Note that ctrl-c is always considered a ``valid`` response and
    % causes the program to return immediately by throwing an error.
    
    prompt = sprintf ...
        ( "%s\nPlease enter a response [y/n]: " ...
        , questionMsg ...
        );
    
    is_y_or_n = @(c) JkUtils.is_scalar_char(c) ...
                       && ( c == 'y' ...
                          || c == 'n' ...
                          );

    res = input(prompt, 's');
  
    while ~is_y_or_n(res)
        JkUtils.JkDisp(sprintf("%s is not a valid response", res));
        res = input(prompt, 's');
    end
    
    bool = strcmp(res, 'y');
    
end