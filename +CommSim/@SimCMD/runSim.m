function runSim(simEnvironment,duration)
%RUNSIM: Run simulation in Environment simEnvironment for duration
%seconds
    simEnvironment.Time = simEnvironment.Time + duration;
    for i=1:length(simEnvironment.Entities)
        pos = simEnvironment.Entities(i).Position;
        vel = simEnvironment.Entities(i).Velocity;
        simEnvironment.Entities(i).Position = pos+(vel.*duration);
    end
end

