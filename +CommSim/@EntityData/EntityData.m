classdef EntityData
    %ENTITYDATA: Object geographical positioning and operational data
    %   Class summarizes network position information for a single entity.
    %   Also contains information about physical operation status.
    
    properties
        Name = '';
        Position = [0 0 0];
		Velocity = [0 0 0];
        TargetAltitude = 0;
        Status = 'Operational';
    end
    
    methods
        function obj = EntityData(position,velocity,status,name)
            if nargin > 0
                if length(position) ~= 3
                    error('CommSim:positionVector', 'Invalid Vector size. Must be 3 elements (quaternions not implemented yet).')
                end
                obj.Position = position;
                obj.TargetAltitude = position(2);
                if nargin > 1
                    if length(velocity) ~= 3
                        error('CommSim:velocityVector', 'Invalid Vector size. Must be 3 elements (quaternions not implemented yet).')
                    else
                        obj.Velocity = velocity;
                    end
                end
                if nargin > 2
                    obj.Status = status;
                end
                if nargin > 3
                    obj.Name = name;
                end
            else
                error('CommSim:EntityData', 'EntityData Constructor requires at least position parameter.')
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
