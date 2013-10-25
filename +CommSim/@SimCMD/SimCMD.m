classdef SimCMD < CommSim.Command
	%SIMCMD: Run simulation using current parameters
	%	Simulation command to run a network communications test for
	%	the current set of parameters. Assumes that all defined vars
	%	will be held constant during simulation.
	
	properties
		Path = [];
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
        function closeSim()
            disp('Closing simulation interface...')
            clc,clear,close all
        end
        
        function simStats(simEnvironment, property, index)
            if nargin > 0
                if nargin == 1
                    disp(['Sim Time: ' num2str(simEnvironment.Time)])
                    disp(['Map Size: [' num2str(simEnvironment.MapSize(:)') ']'])
                    disp(['Weather conditions: ' simEnvironment.Weather])
                    disp('Entities in Simulation: ')
                    for i = 1:length(simEnvironment.Entities)
                        disp(['Entity ' int2str(i) ' data:'])
                        simEnvironment.Entities(i)'
                    end

                else
                    switch property
                        case {'Time','time'},
                            disp(['Sim Time: ' num2str(simEnvironment.Time)])
                        case {'MapSize','Map Size'},
                            disp(['Map Size: [' num2str(simEnvironment.MapSize(:)') ']'])
                        case {'Weather','weather'},
                            disp(['Weather conditions: ' simEnvironment.Weather])
                        case {'Entity','entity',},
                            if nargin == 3
                                disp(['Entity ' int2str(index) ' data:'])
                                simEnvironment.Entities(index)
                            else
                                for i = 1:length(simEnvironment.Entities)
                                    disp(['Entity ' int2str(i) ' data:'])
                                    simEnvironment.Entities(i)
                                end
                            end
                        otherwise
                            %error('CommSim:simStats', ['Property "' property '" does not exist within simulation environment.'])
                            disp(['Property "' property '" does not exist within simulation environment.'])
                    end
                    disp(' ')
                end
            end
        end
        
        function runSim(simEnvironment,duration)
            simEnvironment.Time = simEnvironment.Time + duration;
            for i=1:length(simEnvironment.Entities)
                pos = simEnvironment.Entities(i).Position;
                vel = simEnvironment.Entities(i).Velocity;
                simEnvironment.Entities(i).Position = pos+(vel.*duration);
            end
        end
        
        function simRestart(simEnvironment)
            simEnvironment.Time = origTime;
            simEnvironment.Weather = origWeather;
            simEnvironment.Entities = origEntities;
        end
        
        function simStart(simEnvironment)
            disp('Initializing simulation interface...')
        end
    end
end