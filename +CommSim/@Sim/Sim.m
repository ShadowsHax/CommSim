classdef Sim
	%SIM: Simulation Environment Object
	%	Class contains all data for a specific simulation pass,
	%	and holds all information pertaining to the system after
	%	a runSim command.
	
	properties
		Time = 0;								% Current time of simulation, in seconds
		origTime = 0;							% Time that sim was initialized to. Used for simRestart command
		MapSize = [0 0 0 0 0];					% Size of simulation map. Format: [Xmin,Xmax,Ymax,Zmin,Zmax]
		Weather = 'Clear';						% Simulation Weather conditions. Currently only aesthetic.
		origWeather = 'Clear';					% Original Weather conditions. Used for simRestart command
		Entities = [];							% List of all Entities within the simulation
		origEntities = [];						% Original Entity data. Used for simRestart command.
	end
	
	methods
		function obj = Sim(size,time,weather,EntityList)
			if nargin > 0
                if length(size) ~= 5
					error('CommSim:Sim','MapSize vector is of invalid length. Size must be a 5 element vector');
                end
                switch nargin
                    case 4,
                        obj.MapSize = size;
                        obj.Time = time;
                        obj.Weather = weather;
                        obj.Entities = EntityList;
                        obj.origTime = time;
                        obj.origWeather = weather;
                        obj.origEntities = EntityList;
                    case 3,
                        obj.MapSize = size;
                        obj.Time = time;
                        obj.Weather = weather;
                        obj.origTime = time;
                        obj.origWeather = weather;
                    case 2,
                        obj.MapSize = size;
                        obj.Time = time;
                        obj.origTime = time;
                    case 1,
                        obj.MapSize = size;
                end
			else
			error('CommSim:Sim','Sim constructor requires at least MapSize parameter.');
			end
		end
	end
end