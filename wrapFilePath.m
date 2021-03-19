function [ strOut ] = JkdispFilePath(pathStr, prefix, lineLength, ellipsis)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 17, 2021
    %
    % JkdispFilePath(pathStr) breaks strings containing file paths at the
    % folder separator `/` before they exceed 75 characters. The resulting
    % strings to be displayed on multiple lines are shown with an ellipsis
    % (i.e. `...`) to indicate line continuation. The entire result is
    % flanked with backquotes (`...`) and two newlines. By default, each
    % line is indented/prefixed with a single tab `\t`, while maintaining
    % the line length limit of 75.
    %
    % wrapFilePath(pathStr, prefix, ellipsis, lineLength) wraps strings 
    % that exceed `lineLength` characters. It uses `ellipsis` to indicate
    % line continuation (without exceeding `lineLength`). Each wrapped line
    % is prefixed with `prefix`.
    %
    % `pathStr` is must be a string scalar (or trivially transformable to a
    % string scalar).
    
    JkUtils.assertStringScalar(pathStr)
    
    if nargin <= 3
        ellipsis = ' ...';
    end
    
    if nargin <= 2
        lineLength = 75;
    end
    
    if nargin <= 1
        prefix = '\t';
    end

    prefix = char(sprintf(prefix));
    
    
    %     stringArr = split(string(pathStr));
    
    charsIn = deblank(char(pathStr));
    charsOut = ...
        [ sprintf('\n\n') ...
        , prefix ...
        , '`' ...
        , doWrap(charsIn, prefix, lineLength, ellipsis) ...
        , '`' ...
        , sprintf('\n\n') ...
        ];
    
    strOut = string(charsOut);
    
    
    function wrapped = doWrap(charsIn, prefix, l, ellipsis)
                
        sepChar = '/';
        
        if numel(charsIn) <= l
            % Don't wrap lines shorter than the specified max length
            wrapped = charsIn;
            return;
        else
            % Search backwards from max length for a separator char
            lastIdx = l - numel(ellipsis) - numel(prefix);
            wrapIdx = lastIdx + 1 - find( reverse(charsIn(1:lastIdx)) == sepChar, 1);
            if isempty(wrapIdx)
                % No separator char found -> force wrap at lineLength
                wrapIdx = l-numel(ellipsis) - numel(prefix);
            end
            % recursively build the wrapped string
            wrapped = ...
                [ charsIn(1:wrapIdx) ...
                , ellipsis ...
                , newline ...
                , prefix ...
                , doWrap(charsIn(wrapIdx+1:end), prefix, l, ellipsis) ...
                ];
        end
    end
    
end