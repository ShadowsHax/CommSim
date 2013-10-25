#include "command.h"

Command::Command(std::string CmdName, std::string CmdPath, std::vector AvailableCMD, std::vector CMDParams)
{
    Name = CmdName;
    Path = CmdPath;
    CommandList = AvailableCMD;
    ParamList = CMDParams;
    CMDRegistry.push_back(this);
}

int Command::getID()
{
    return CmdID;
}

std::string Command::getName()
{
    return Name;
}

std::string Command::getDataPath()
{
    return DataPath;
}

std::string Command::CMDList()
{
    std::string Listing;
    foreach(std::string &current,CommandList){
        Listing.append(current);
    }
    return Listing;
}

std::string Command::CMDUsage(std::string CMDName)
{
    bool isValidCMD;
    foreach(std::string &current,CommandList){
        if(CMDName == current){
            isValidCMD == true;
            break;
        }
    }
    if(isValidCMD){
        std::string Listing;
        foreach(std::string &thisParam,ParamList){
            Listing.append(thisParam);
        }
        return Listing;
    }
    return "Invalid Command Requested.";
}
