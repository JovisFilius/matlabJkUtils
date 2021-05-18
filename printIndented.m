function [] = printIndented(varargin)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% printIndented(strs,...,'indent', indent) prints the output of 
    % sprintIndented(strs, indent) via JkPrint. If indent is omitted, a
    % default of 4 spaces is used.
	%
    % See also JkUtils.sprintIndented, JkUtils.JkPrint

    indent = '    ';
    if nargin > 1
        for i = 2:(numel(varargin) - 1)
            if strcmpi(varargin{i}, 'indent') ...
                    && JkUtils.is_single_string(varargin{i+1})
                indent = varargin{i+1};
                varargin = {varargin{1:i-1} varargin{i+2:end}};
                break;
            end
        end
    end
    
    JkUtils.JkPrint(varargin{:}, @(x) JkUtils.sprintIndented(x,'indent', indent))
end