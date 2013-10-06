classdef Sim
	%SIM: Simulation Environment Object
	%	Class contains all data for a specific simulation pass,
	%	and holds all information pertaining to the system after
	%	a runSim command.
	
	properties
		Time = 0;								% Current time of simulation, in seconds
		MapSize = [0 0 0 0 0];					% Size of simulation map. Format: [Xmin,Xmax,Ymax,Zmin,Zmax]
		Weather = 'Clear';						% Simulation Weather conditions. Currently only aesthetic.
		Entities = [];							% List of all Entities within the simulation
	end
	
	methods
		function obj = Sim(size,time)
			if nargin > 0
				if length(size) ~= 5
					error('CommSim:Sim','MapSize vector is of invalid length. Size must be a 5 element vector');
				if nargin == 2
					obj.MapSize = size;
					obj.Time = time;
				else if nargin == 1
					obj.MapSize = size;
				end
			else
			error('CommSim:Sim','Sim constructor requires at least MapSize parameter.');
			end
		end
	end
end