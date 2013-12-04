function simStart(simEnvironment)
%SIMSTART: Initialize Command interface for Environment simEnvironment
    cmd = input('CommSim:>>','s');
    rawCmd = cmd(1:find(cmd=='(')-1);
    while ~strcmp(rawCmd,'closeSim')
        if ~isequal(strcmp(simEnvironment.commRegistry(:).CommandList(:),rawCmd),...
                zeros(length(simEnvironment.commRegistry(:).CommandList(:)),1))
            eval(['sim.' cmd(1:find(cmd==')'))])
        else
            disp(['Command "' cmd '" not found.'])
        end
        cmd = input('CommSim:>>','s');
        rawCmd = cmd(1:find(cmd=='(')-1);
    end
end