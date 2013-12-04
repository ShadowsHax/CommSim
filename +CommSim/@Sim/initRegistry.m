function Registry = initRegistry()
%INITREGISTRY: Initialize command registry
    Registry = [];
    sim = CommSim.SimCMD();
    Registry = registerCMD(sim,Registry);
end