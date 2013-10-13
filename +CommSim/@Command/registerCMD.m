function registry = registerCMD(obj,registry)
%REGISTERCMD: Register command in registry vector
%   Allocates memory within the registry vector to a command. Ensures that
%   no redundant commands may be inserted into the registry
    if ~isempty(registry) && cmp(registry(:),obj)
        error('CommSim:CMDRegistry',['Command ' obj.Name ' already exists in the registry.'])
    else
        registry = [registry,obj];
    end
end

