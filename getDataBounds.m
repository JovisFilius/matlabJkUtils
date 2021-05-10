function [mn, mx] = getDataBounds(X, percentageMargin)
    % Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % April 22, 2021
    %
    % [mn, mx] = getDataBounds(X) Returns lower and upper bound for the
    % values in `X`.
    %
    % ~ = getDataBounds(~,percentageMargin) widens the returned bounds by
    % the specified percentage.
    
    mn = min(X, [], 'all');
    mx = max(X, [], 'all');
    
    if nargin == 2
        
        width = mx - mn;
        
        mn = mn - width * percentageMargin / 100;
        mx = mx + width * percentageMargin / 100;
    end