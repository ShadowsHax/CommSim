clc,clear,close all
%{
    Simulation Workbench
    Currently under development: Communication Relay Simulation
    Current Stage: Command Class Development
%}
maxCommsDist = 1e3;                 % Maximum Communication Distance, km
processorSpeed = 2.4e6;             % Processor Speed, Hz
peerCount = 100;                    % # Network Peers, excluding Central Command

pathMap = logical(eye(peerCount+1));

disp('Creating Simulation Environment...')
environ = CommSim.Sim([0,10000,1000,0,10000],0,'Clear');
disp('Creating Peer Network...')
Central = CommSim.EntityData([0 0 0],[0 0 0],0,'Central');
for i=1:peerCount
    Peers(i) = CommSim.EntityData([100*randi(10) 25+100*randi([0 10]) 100*randi(10)],[10 0 0],0,['Peer' int2str(i)]);
    rng('shuffle');
end
environ.Entities = [Central Peers(:)'];
disp('Peer Network Established.')
disp('Checking Network Connections...')
fprintf('Checking Peer ');
for i=1:length(Peers)
    peerNum = [num2str(i) '...'];
    fprintf(peerNum)
    if checkDistanceTo(Central, Peers(i)) < maxCommsDist
        pathMap(i,1) = 1;
        pathMap(1,i) = 1;
    end
    for j=1:length(Peers)
        if checkDistanceTo(Peers(i),Peers(j)) < maxCommsDist
            pathMap(i+1,j+1) = 1;
        end
    end
    if i<length(Peers)
        fprintf(repmat('\b',1,numel(peerNum)));
    else fprintf('\n');
    end
end
disp('Network Check Complete.')
disp('Simulation Environment Created.')
disp('Initializing Command Registry...')
disp('Commands Registered with Simulation.')
sim.simStart();
disp('Decomposing Simulation...')
clc,close all
