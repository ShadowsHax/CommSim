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

%Initialize Testing Entities
disp('Creating Peer Network...')
Central = CommSim.EntityData([0 0 0],0,[0 0 0],0);
for i=1:peerCount
    Peers(i) = CommSim.EntityData([100*randi(10) 25+100*randi([0 10]) 100*randi(10)],0,[0 0 0],0);
    rng('shuffle');
end
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
disp('Initializing Command Registry...')
disp('Commands Registered with Simulation.')
cmd = input('CommSim:>>','s');
while ~strcmp(cmd,'exit')
    strcmp(cmd,registry)
    cmd = input('CommSim:>>','s');
end
disp('Decomposing Simulation...')
