#ifndef SIMENVIRONMENT_H
#define SIMENVIRONMENT_H

#include <string>
#include "/Processes/StaticVec.h"

class SimEnvironment
{
private:
    double Time;
    double origTime;
    int* MapSize;
    std::string Name;
public:
    SimEnvironment();
    ~SimEnvironment();
};

#endif // SIMENVIRONMENT_H
