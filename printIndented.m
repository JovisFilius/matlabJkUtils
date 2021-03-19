function [strsIndent] = printIndented(strs, indent)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printIndented(strs, indent) prints each string in `strs` with an
	% indentation specified by `indent`, which may contain fprintf tab
	% identifiers. If `strs` is an array of strings or if `strs` contains 
    % newlines, each string is printed on its own line with the proper
    % indentation.
	%
    
    if nargin == 1
        indent = '';
    end
    
    if isscalar(string(strs))
        input = splitlines(string(sprintf(strs)));
    else
        input =  string(strs);
    end
    
    prefix = char(indent);
    
    charsIndent = ...
        [ prefix ...
        , char(input(1)) ...
        ];
    
    for i = 2:numel(input)
        charsIndent = ...
            [ charsIndent ...
            , newline ...
            , prefix ...
            , char(input(i)) ...
            ];
    end

    strsIndent = sprintf(charsIndent);
end