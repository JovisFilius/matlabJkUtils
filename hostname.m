function [hostname] = hostname()
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% May 11, 2021
	%
	% hostname = hostname() Tries to detect the system hostname.
	%

    [~, hostname] = system('hostname');
    
    hostname = strtrim(hostname); % remove newline

end