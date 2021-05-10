function [dirNames] = getDirNames(dirPath)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 24, 2021
	%
	% dirNames = getDirs(path) returns the names (without path) of the
	% directories contained inside the directory specified by path.
	%
    % NB: the entries `.` and `..` are filtered from the returned list of
    % `dirNames`


    dirs = dir(dirPath);
    N = numel(dirs);
    includeIds = false(N,1);
    names = strings(N,1);
    for i = 1:N
        % force conversion to str (instead of char) for string comparison
        names(i) = string(dirs(i).name);
        includeIds(i) = ~(names(i) == "." || names(i) == "..");
    end

    %% Case insensitive sorting
    
    dirNames = names(includeIds);
    [~,idx] = sort(upper(dirNames)); % capitalize all characters for sorting
    dirNames = dirNames(idx);
    
end