function [] = checkFolder_do_prompt_create_new(path)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% May 03, 2021
	%
	% checkFolder_do_prompt_create_new(path) checks if `path` points to an
	% existing folder. In case it points to nothing, the user is asked if
	% the folder should be created. In case the path points to a file or 
    % the folder does not exist and wasn't created, an error is thrown.
	
    switch exist(path, 'file')
        case 2 % path points to a file
            error ...
                ( "Found an existing file while checking for a folder " ...
                + "location:%s" ...
                , JkUtils.wrapFilePath(path) ...
                )
        case 7 % path points to an existing folder, nothing to do
            return;
        otherwise
            if JkUtils.do_prompt_yes_or_no ...
                ( sprintf ...
                    ( "Folder not found:%sCreate it now?" ...
                    , JkUtils.wrapFilePath(path) ...
                    ) ...
                )
                
                [ succ, errMsg, errId] = mkdir(path);
                if ~succ
                    error(errId, errMsg)
                else
                    JkUtils.printIndented("Folder created.", '    ')
                end
            else
                % Folder did not exist and user did not want to create it
                error ...
                    ( "Folder %s does not exist on path" ...
                    , JkUtils.wrapFilePath(path) ...
                    )
            end
    end
end