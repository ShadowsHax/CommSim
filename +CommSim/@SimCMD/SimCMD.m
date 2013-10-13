classdef SimCMD < CommSim.Command
	%SIMCMD: Run simulation using current parameters
	%	Simulation command to run a network communications test for
	%	the current set of parameters. Assumes that all defined vars
	%	will be held constant during simulation.
	
	properties
		Path = [];
		Name = 'Simulate';
		CommandList = {'runSim' 'simStats' 'simRestart' 'quitSim'};
		ParameterList = {'duration' 'simEnvironment';...
                         'simEnvironment';...
                         'simEnvironment';...
                         ''};
    end
    
    methods (Static)
        
        function quitSim()
            clc,clear,close all
        end
        
        function simStats(simEnvironment, property, index)
            if nargin > 0
                if nargin == 1
                    disp(['Sim Time: ' num2str(simEnvironment.Time)])
                    disp(['Map Size: [' num2str(simEnvironment.MapSize(:)') ']'])
                    disp(['Weather conditions: ' simEnvironment.Weather])
                    disp('Entities in Simulation: ')
                    EntityList = simEnvironment.Entities(:)'
                else
                    switch property
                        case 'Time',
                            disp(['Sim Time: ' num2str(simEnvironment.Time)])
                        case {'MapSize','Map Size'},
                            disp(['Map Size: [' num2str(simEnvironment.MapSize(:)') ']'])
                        case 'Weather',
                            disp(['Weather conditions: ' simEnvironment.Weather])
                        case 'Entity',
                            disp('Working on it.')
                        otherwise
                            error('CommSim:')
                    end
                    disp(' ')
                end
            end
        end
    end
end