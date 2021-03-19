function [s] = mergeStructs(s1, s2, force)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 19, 2021
	%
	% s = mergeStructs(s1, s2) merges the structs s1 and s2 if they contain
	% no common fields.
	%
    % s = mergeStructs(s1, s2, force) merges the structs s1 and s2,
    % overwriting duplicate fields with the values of s1 if `force` is set
    % to true.
    
    if nargin < 3
        force = false;
    end
    
    merge = @(x,y) cell2struct ...
        ( [ struct2cell(s1) ...
          ; struct2cell(s2) ...
          ] ...
        , [ fieldnames(s1) ...
          ; fieldnames(s2) ...
          ] ...
        );
    
    try
        s = merge(s1,s2);
    catch e
        if force
            n1 = fieldnames(s1);
            for i = 1:numel(n1)
                try
                    s2 = rmfield(s2, n1(i));
                catch
                end
            end
            s = merge(s1,s2);
        else
            newE = JkUtils.addHint2Error ...
                ( e ...
                , 'Supply `true` as third argument to mergeStructs to force a left join' ...
                );
            
            rethrow(newE)
        end
    end


end