function [] = createJkUtilsFunction(funcName, argin, argout)
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 16, 2021
    %
    % createJkFunction(funcName) attempts to create the file `funcName.m`
    % inside the folder containing the package `+JkUtils` from a predefined
    % template for author Julius Koppen.
    % 
    % The function aborts if
    % 1) package `+JkUtils` is not on the matlab path, or
    % 2) `+JkUtils.funcName` already exists.
    % 
    % TODO: add support for supplying arrays with input and output
    % arguments for the newly created function.
        
    outFolder = extractBefore ...
        ( which("JkUtils.createJkUtilsFunction") ...
        , "createJkUtilsFunction" ...
        );

    assert ...
        ( exist(outFolder, 'dir') == 7 ...
        , "The target package \n\n\t`JkUtils`\n\n was not found on the matlab path" ...
        , '' ...
        )
    
    outFilePath = fullfile ...
        ( outFolder ...
        , sprintf("%s.m", funcName) ...
        );
    
    assert ...
        ( ~any( exist(outFilePath, 'file') == [2 7] ) ...
        , "The target file\n\n\t``%s``\n\n already exists on disk, not creating a new file." ...
        , outFilePath ...
        )
    
    author = "Julius Koppen";
    institute = "Erasmus Medical Center, Rotterdam, The Netherlands";
    timestamp = datestr(now, "mmmm dd, yyyy");
    
    newFile = fopen(outFilePath, 'w');
    fprintf ...
        ( newFile ...
        , "function [out] = %s(in)\n" ...
        + "\t%%%% Author: %s\n" ...
        + "\t%% %s\n" ...
        + "\t%% %s\n" ...
        + "\t%%\n" ...
        + "\t%% out = %s(in) --- DOCUMENTATION GOES HERE ---\n" ...
        + "\t%%\n" ...
        + "\n\n" ...
        + "end" ...
        , funcName ...
        , author ...
        , institute ...
        , timestamp ...
        , funcName ...
        );
    
    fclose(newFile);
        
end
