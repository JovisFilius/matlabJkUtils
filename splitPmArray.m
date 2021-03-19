function [] = splitPmArray(pmArrFile, pms)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 17, 2021
	%
	% splitPmArray(pmArrFile) loads the .mat file `pmArrFile` and
	% saves each pm in the array in a separate file relative to the
    % location of `pmArrFile` in the directory `./PosteriorMeans`.
	%
    % splitPmArray(pmArrFile, pmVar) uses the already loaded variable pmVar
    % instead of (re)loading a file from disk.
    
    rootDir = fileparts(pmArrFile);
    outputDir = fullfile(rootDir, "PosteriorMeans");
    
    if exist(outputDir, 'file')
        error("Destination folder already exists, aborting to prevent potential overwriting of data")
    else
        mkdir(outputDir)
    end
    
    if nargin == 1
        pms = load(pmArrFile);
    end
    
    for i = 1:numel(pms)
        pm = pms(i);
%         class(pm)
        
        fname = fullfile ...
            ( outputDir ...
            , sprintf("pm%03d.mat", i) ...
            );
        JkUtils.JkDisp(sprintf ...
            ( "Saving file: %s" ...
            , JkUtils.wrapFilepath(fname) ...
            ))
        save(fname, 'pm')
    end


end