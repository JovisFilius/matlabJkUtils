function [] = setup()
    %% Author: Julius Koppen
    % Erasmus Medical Center, Rotterdam, The Netherlands
    % March 17, 2021
    %
    % This is a function meant to manage running code (specifically code
    % that searches for files) on different machines, with different
    % environments.
    %
    
    import JkUtils.JkDisp
    
    JkDisp(JkUtils.printHeader("Setup for Jk script"))
    
    switch computer
        
        case 'GLNXA64'
            %% This is a linux machine
            
            [~, hostname] = system('hostname');
            hostname = strtrim(hostname);
            
            switch hostname
            case "narain-XPS-8930"
                JkDisp(sprintf ...
                    ( "Detected unix-type host: %s" ...
                    , JkUtils.printImportant(JkUtils.printValue(hostname))) ...
                    )
                nssuiteDir = "~/Dropbox (BayesLab)/TraceExperiments/NarainSpikeSuite/NSSuite/";
                JkDisp(sprintf( ...
                    "Adding NSSuite to path: %s" ...
                    , JkUtils.wrapFilePath( ...
                        nssuiteDir ...
                        ) ...
                    ))
                    
                addpath("~/Dropbox (BayesLab)/TraceExperiments/NarainSpikeSuite/NSSuite/")
            otherwise
                JkDisp("unix-type host not recognized, no path setup or other configuration actions performed.")
            end
        
            
        case 'PCWIN64'
            %% This is a windows pc
            
            JkDisp("Windows-type host detected.")
            JkDisp("This code was developed on the narain-XPS-8930, some path variables or package locations might be wrong")
            
        case 'MACI64'
            %% This is a mac
            
            JkDisp("Mac-type host detected.")
            JkDisp("This code was developed on the narain-XPS-8930, some path variables or package locations might be wrong")
            
            
        otherwise
            %% Say what?
            
            JkDisp(sprintf ...
                ( "Host-type unknown. Detected architecture is: %s" ...
                , computer('arch') ...
                ))
            
            JkDisp("This code was developed on the narain-XPS-8930, some path variables or package locations might be wrong")
            
    end

        
        
        
    
    
    
end