classdef Command
    %COMMAND: Abstract class for comm protocol command interface
    %   Communication system command implementation for P2P Network.
    %   Class serves to provide common inheritance for all implemented
    %   commands.
    
    properties (Abstract)
        hasPath
        longCmd
        Name
    end
    
    methods
        function obj = Command(name)
            obj.Name = name
        end
        
        function registerCmd(obj, registry)
            registry = [registry,obj];
        end
    end
    
end
