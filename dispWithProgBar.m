function [] = dispWithProgBar(str, progBar)
	%% Author: Julius Koppen
	% Erasmus Medical Center, Rotterdam, The Netherlands
	% March 18, 2021
	%
	% dispWithProgBar(str, progBar) display output `str` without
	% interfering with the active progress bar `progBar`.
    %
    % NOTA BENE: If the progress bar is already done (i.e. the field `done`
    % exists), the `progBar` argument is ignored and this function behaves
    % exactly like `JkDisp`.
	%

    if isDone(progBar)
        JkUtils.JkDisp(str)
    else
        JkUtils.clearProgBarOutput(progBar);
        JkUtils.JkDisp(str);
        JkUtils.dispProgBar(progBar);
    end
    
end

function bool = isDone(progBar)
    fields = fieldnames(progBar);
    bool = any(strcmp(fields, "done"));
end