function [selected, index] = do_prompt_select_option(choices)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 24, 2021
	%
	% selected = do_prompt_select_option(choices) prompts with a list of
	% options to choose from. Matches the input against the possible 
    % choices and only returns when a valid input is given.
    %
    % [~, index] = do_promp_select_option(choices) also returns the index
    % of the selected option.
	%
    % NB: quitting is always possible by issuing `ctrl-c`

    assert ... % `choices` must be string vector
        ( JkUtils.is_vector_string(choices) ...
        , "List of choices must be a vector of strings." ...
        )
    
    if size(choices, 2) == 1
        % make sure `choices` is a rowvec
        choices = choices';
    end
    
    N = numel(choices);
    
    % Create a display list for the choices, prefixed by its index, e.g.
    % ` 1    choice1`
    % ...
    % `10    choice10`
    % 
    
    % calculate the no. digits required to display `N` (e.g. `190` requires
    % 3 digits)
    digitLength = 1+floor(log10(N));
    % pad each index number to match the largest number (e.g. if `N = 190`
    % then the first number is formatted with a padding of 2 spaces: `  1`)
    digitFormat = sprintf("%%%dd", digitLength);
    
    choiceList = strings(N,1);
    for i = 1:N
        choiceList(i) = sprintf ...
            ( digitFormat ...
            + "\t" ...
            + choices(i) ...
            , i ...
            );
    end
    msg = sprintf ...
        ( "Available choices:\n" ...
        + sprintf("%s\n", choiceList) ...
        );
    JkUtils.JkDisp(JkUtils.printIndented(msg, '    '))
    index = JkUtils.do_prompt_numericRange(1,N);

    selected = choices(index);
end