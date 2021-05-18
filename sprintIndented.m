function [strsIndent] = sprintIndented(strs, varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% sprintIndented(strs, 'indent', indent) prints each string in `strs`
    % with an indentation specified by `indent`, which may contain fprintf
    % tab identifiers. If `strs` is an array of strings or if `strs`
    % contains newlines, each string is printed on its own line with the
    % proper indentation. If `indent` is omitted, a default of 4 spaces is
    % used.
	%
    
    if nargin == 1
        indent = '    ';
    elseif nargin == 3
        indent = varargin{2};
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