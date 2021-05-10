function [bar] = progBar(totalSteps, dispLength, msg)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 18, 2021
    %
    % bar = progBar(totalSteps) creates a progress bar structure with
    % `totalSteps` steps. The bar length defaults to the minimum of 
    % `totalSteps + 2` and 25. The displayed message defaultsSee the bottom references for info on how to use
    % the progress bar.
    %
    % bar = progBar(totalSteps, dispLength) creates a progress bar that is
    % displayed with `dispLength` characters.
    %
    % See also JkUtils.updateProgBar, JkUtils.dispWithProgBar,
    % JkUtils.dispProgBar, JkUtils.progBarTick, JkUtils.resetProgBar
    
    if nargin < 2
        dispLength = min(totalSteps+2, 25);
    end
    
    if nargin < 3
        msg = '';
    end
    
    bar = struct ...
        ( "type", "progBar" ...
        , "total", totalSteps ...
        , "dispLength", dispLength ...
        , "msg", msg ...
        , "current", 0 ...
        , "started", false ...
        , "done", false ...
        );
    
end