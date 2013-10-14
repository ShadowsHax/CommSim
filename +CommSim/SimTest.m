clc,clear,close all
%{
    Simulation Workbench
    Currently under development: Communication Relay Simulation
    Current Stage: Command Class Development
%}
maxCommsDist = 1e3;                 % Maximum Communication Distance, km
processorSpeed = 2.4e6;             % Processor Speed, Hz
peerCount = 4;                      % # Network Peers, excluding Central Command

pathMap = logical(eye(peerCount+1));

disp('Creating Simulation Environment...')
environ = CommSim.Sim([0,10000,1000,0,10000],0,'Clear');
disp('Creating Peer Network...')
Central = CommSim.EntityData([0 0 0],0,[0 0 0],0);
for i=1:peerCount
    Peers(i) = CommSim.EntityData([100*randi(10) 25+100*randi([0 10]) 100*randi(10)],0,[0 0 0],0);
    rng('shuffle');
end
environ.Entities = [Central Peers(:)'];
disp('Peer Network Established.')
disp('Checking Network Connections...')
for i=1:length(Peers)
    disp(['Checking Peer ' num2str(i) '...'])
    if checkDistanceTo(Central, Peers(i)) < maxCommsDist
        pathMap(i,1) = 1;
        pathMap(1,i) = 1;
    end
    for j=1:length(Peers)
        if checkDistanceTo(Peers(i),Peers(j)) < maxCommsDist
            pathMap(i+1,j+1) = 1;
        end
    end
end
disp('Network Check Complete.')
disp('Simulation Environment Created.')
disp('Initializing Command Registry...')
registry = [];
sim = CommSim.SimCMD();
registry = registerCMD(sim,registry);
disp('Commands Registered with Simulation.')
cmd = input('CommSim:>>','s');
rawCmd = cmd(1:find(cmd=='(')-1);
while ~strcmp(rawCmd,'quitSim')
    if ~isequal(strcmp(registry(:).CommandList(:),rawCmd),zeros(length(registry(:).CommandList(:)),1))
        disp('Let me run that command for you...')
        eval(['sim.' cmd])
    else
        error('CommSim:CmdLine', ['Command "' cmd '" not found.'])
    end
    cmd = input('CommSim:>>','s');
    rawCmd = cmd(1:find(cmd=='(')-1);
end
disp('Decomposing Simulation...')
clc,clear,close all