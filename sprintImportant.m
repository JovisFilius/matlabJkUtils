function [strOut] = sprintImportant(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% sprintImportant(strIn) flanks `important display info` by characters to
    % make it stand out. At this moment, this simply means that `strIn` is
    % flanked by two newlines. `strIn` must be a scalar string, or
    % trivially convertible to a scalar string via `string(strIn)`.
	%
    
    strIn = sprintf(varargin{:});
        
    JkUtils.assertStringScalar(strIn)
    
    strIn = string(strIn); % Convert numeric args into string args
    
    str = sprintf( ...
        [ '\n\n' ...
        , char(strIn) ...
        , '\n\n' ...
        ] ...
    );

    strOut = JkUtils.sprintIndented(str, 'indent', '\t');
end