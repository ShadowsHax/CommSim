classdef Command
    %COMMAND: Abstract class for comm protocol command interface
    %   Communication system command implementation for P2P Network.
    %   Class serves to provide common inheritance for all implemented
    %   commands.
    
    properties (Abstract)
        hasPath
        Name
		Usage
		ParameterList
    end
    
    methods
		
		function usage(obj)
			disp(obj.Usage)
		end
        
        function registry = registerCmd(obj, registryVec)
            registry = [registryVec,obj];
        end
    end
    
end
