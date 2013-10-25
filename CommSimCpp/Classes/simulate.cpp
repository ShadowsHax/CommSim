#include "simulate.h"

Simulate::Simulate()
{
    std::vector<std::vector<std::string>> CMDList;
    std::vector<std::string> CMDParams;
    CMDList.push_back("runSim");
    CMDList.push_back("simStats");
    CMDList.push_back("simRestart");
    CMDParams.push_back();
    Command("sim","",CMDList,CMDParams);
}

void Simulate::runSim(double duration)
{
}

void Simulate::simStats()
{
}

void Simulate::simRestart()
{
}

void Simulate::quitSim()
{
}
