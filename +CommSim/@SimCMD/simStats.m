function simStats(simEnvironment, property, index)
%SIMSTATS: Return statistics for Environment simEnvironment property, at index.
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

