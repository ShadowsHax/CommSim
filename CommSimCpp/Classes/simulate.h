#ifndef SIMULATE_H
#define SIMULATE_H

#include <command.h>
#include "Classes/simenvironment.h"

class Simulate: Command
{
private:

public:
    Simulate();
    ~Simulate();
    void runSim(double duration);
    void simStats();
    void simRestart();
    void quitSim(SimEnvironment environ);
};

#endif // SIMULATE_H
