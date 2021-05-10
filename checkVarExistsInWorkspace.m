function [res] = checkVarExistsInWorkspace(varName)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% April 30, 2021
	%
	% res = checkVarExistsInWorkspace(varName) checks if variable `varName`
	% exists in the global workspace scope.
	%
    
    res = evalin ...
        ( 'base' ...
        , sprintf ...
            ( "exist('%s', 'var')" ...
            , varName ...
            ) ...
        );

end