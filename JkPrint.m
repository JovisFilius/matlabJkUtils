function [] = JkPrint(varargin)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % May 18, 2021
    %
    % JkDisp(str) prints str to standard output, preceded by a newline and
    % terminated by a newline.
    %
    % JkDisp(fid, ...) prints to the file described by fid. As usual, fids
    % 1 and 2 are standard out and standard error, respectively.
    %
    % JkDisp(..., fmtStr, fmtArgs) applies fmtArgs to fmtStr using sprintf
    %
    % See also fprintf, sprintf

    fid = 1;
    formatFunc = @sprintf;
    
    if nargin > 1
        if isnumeric(varargin{1})
            fid = varargin{1};
            varargin = varargin(2:end);
        end
        if isa(varargin{end}, 'function_handle')
            % Allows calling this function with arbitrary args from each of
            % the JkUtils.print* functions
            formatFunc = varargin{end};
            varargin = varargin(1:end-1);
        end
%         if numel(varargin) > 1
%             str = formatFunc(sprintf(varargin{:}));
%         else
%             str = formatFunc(varargin{1});
%         end
    end
    
    str = formatFunc(varargin{:});

    fprintf(fid, "\n%s\n", str);
    
end