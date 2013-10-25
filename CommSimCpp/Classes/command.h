#ifndef COMMAND_H
#define COMMAND_H

#include <string>
#include <vector>

class Command
{
private:
    static std::vector<Command> CMDRegistry;

public:
    Command(std::string CmdName, std::string CmdPath, std::vector<std::string> AvailableCMD, std::vector<std::string> CMDParams);
    ~Command();
    int getID();
    std::string getName();
    std::string getDataPath();
    std::string CMDList();
    std::string CMDUsage(std::string CMDName);

protected:
    std::string Name;
    std::string DataPath;
    std::vector<std::string> CommandList;
    std::vector<std::string> ParamList;
    int CmdID;
};

#endif // COMMAND_H
