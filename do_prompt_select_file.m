function [mname] = do_prompt_select_file(folder)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 25, 2021
	%
	% mname = do_prompt_select_mouse() Looks for the names of mice that have
	% analyzed ephys data available on drive and prompts the user to select
	% one of them. Then, the returned string `mname` is the selected mouse
	% name.
    %
    % ~ = do_prompt_select_mouse(ephysRoot) Looks inside the supplied
    % `ephysRoot`, instead of the default directory.
	%

    if nargin == 0
        folder = fullfile ...
            ( JkUtils.getBayesLabRoot() ...
            , 'TraceExperiments/ExperimentOutput/Ephys4Trace1/MainFolder' ...
            );
    end
    
    assert ... % Assert that ephysRoot exists and is a directory
        ( exist(folder, 'dir') == 7 ...
        , "ephysRoot not found on drive." ...
        )
    
    % detect names of mice with ephys data
    % (NB: this may vary due to syncing settings)
    mnames = JkUtils.getDirNames(folder);
    
    mname = JkUtils.do_prompt_select_option(mnames);
    
end