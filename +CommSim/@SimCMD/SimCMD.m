classdef SimCMD < CommSim.Command
	%SIMCMD: Run simulation using current parameters
	%	Simulation command to run a network communications test for
	%	the current set of parameters. Assumes that all defined vars
	%	will be held constant during simulation.
	
	properties
		hasPath = 0;
		Name = 'Simulate';
		Usage = 'runSim(';
		ParameterList = ['duration'];
	end
	methods
        function obj = SimCMD()
        end
        
		function runSim(duration,simEnvironment)
			simEnvironment.Time = simEnvironment.Time + duration;
		end
		
		function simStats(simEnvironment)
			simEnvironment.Time
			simEnvironment.MapSize
			simEnvironment.Weather
			simEnvironment.Entities(:)
		end
		
		function simRestart(simEnvironment)
			simEnvironment.Time = origTime;
			simEnvironment.Weather = origWeather;
			simEnvironment.Entities(:) = origEntities(:);
		end
	end
end