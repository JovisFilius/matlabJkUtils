function [axs, fig] = initSubplots(rows, cols, fig)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 5, 2021
    %
    % initSubplots(rows,cols) creates a grid of `rows x cols` subplots in
    % the figure obtained via `gcf`. The subplots have their `hold on`
    % flags set to true.
    %
    % initSubplots(rows,cols,fig) creates a grid of `row x cols` subplots
    % in the figure `fig`.
    %
    % [axs, fig] = initSubplots(...) returns a `rows x cols` gobjects array
    % `axs`, containing axes corresonding to the subplots and it returns
    % the figure `fig` containing the subplots.

    
    if nargin == 3
        set(0,'CurrentFigure', fig)
    else
        fig = gcf;
    end
    
    mkSubplot = @(row,col) subplot(rows, cols, (row-1)*cols+col);
    axs = gobjects(rows,cols);
    
    for x = 1:rows
        for y = 1:cols
            axs(x,y) = mkSubplot(x,y);
            hold on
        end
    end


end