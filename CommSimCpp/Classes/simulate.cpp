#include "simulate.h"

Simulate::Simulate()
{
    std::vector<std::vector<std::string>> CMDParams;
    std::vector<std::string> CMDList;
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

void Simulate::quitSim(SimEnvironment environ)
{
}
