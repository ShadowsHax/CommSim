classdef EntityData
    %ENTITYDATA: Object geographical positioning and operational data
    %   Class summarizes network position information for a single entity.
    %   Also contains information about physical operation status.
    
    properties
        Position = [0 0 0];
        Speed = 0;
        TargetAltitude = 0;
        Status = 'Operational';
    end
    
    methods
        function obj = EntityData(position,speed,status)
            if nargin > 0
                if length(position) ~= 3
                    error('quadSim:Vector', 'Invalid Vector size. Must be 3 elements (quaternions not implemented yet).')
                end
                obj.Position = position;
                obj.Speed = speed;
                obj.Status = status;
                obj.TargetAltitude = position(2);
            end
        end
        
        function obj = adjustHeight(target)
            obj.TargetAltitude = target;
        end
        
        function d = checkDistanceTo(obj,entity)
            internal = sum((obj.Position).^2)-sum((entity.Position).^2);
            if internal < 0
                d = sqrt(sum((entity.Position).^2)-sum((obj.Position).^2));
            else
                d = sqrt(sum((obj.Position).^2)-sum((entity.Position).^2));
            end
        end
    end
    
end
