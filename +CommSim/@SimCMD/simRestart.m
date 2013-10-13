function simRestart( simEnvironment )
%SIMRESTART Summary of this function goes here
%   Detailed explanation goes here

    simEnvironment.Time = origTime;
	simEnvironment.Weather = origWeather;
	simEnvironment.Entities = origEntities;
end

