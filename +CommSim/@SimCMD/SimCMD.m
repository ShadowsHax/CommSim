classdef SimCMD < CommSim.Command
	%SIMCMD: Run simulation using current parameters
	%	Simulation command to run a network communications test for
	%	the current set of parameters. Assumes that all defined vars
	%	will be held constant during simulation.
	
	properties
		Path = 'sim';
		Name = 'Simulate';
		CommandList = {'runSim' 'simStats' 'simRestart' 'closeSim' 'simStart'};
		ParameterList = {'duration' 'simEnvironment' '';
                         'simEnvironment' '(property)' '(index)';
                         'simEnvironment' '' '';
                         '' '' '';
                         'simEnvironment' '' ''};
    end
    
    methods (Static)
        
        %Planned for implementation.
        closeSim()
        simStats(simEnvironment, property, index)
        runSim(simEnvironment,duration)
        simRestart(simEnvironment)
        simStart(simEnvironment)
        function simHelp(command)
            if nargin < 0
                disp('Help text goes here.')
            else
                eval(['help ' command])
            end
        end
    end
end