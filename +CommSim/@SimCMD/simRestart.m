function simRestart(simEnvironment)
%SIMRESTART: Restart simulation for Environment simEnvironment
    simEnvironment.Time = simEnvironment.origTime;
    simEnvironment.Weather = simEnvironment.origWeather;
    simEnvironment.Entities = simEnvironment.origEntities;
end

