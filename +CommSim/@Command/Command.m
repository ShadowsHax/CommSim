classdef Command
    %COMMAND: Abstract class for comm protocol command interface
    %   Communication system command implementation for P2P Network.
    %   Class serves to provide common inheritance for all implemented
    %   commands.
    
    properties (Abstract)
        Path
        Name
		CommandList
		ParameterList
    end
    
    methods
		
		function commands(obj)
			disp(obj.CommandList(:))
        end
        
        function usage(obj,command)
            i = find(strcmp([obj.CommandList],command));
            if logical(i)
                disp(obj.ParameterList(i,:))
            end
        end
        
        function equality = cmp(obj1,obj2)
            if obj1.Name == obj2.Name
                equality = 1;
            else
                equality = 0;
            end
        end
    end
end
