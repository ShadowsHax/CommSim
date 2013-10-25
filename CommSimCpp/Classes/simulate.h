#ifndef SIMULATE_H
#define SIMULATE_H

#include <command.h>

class Simulate: Command
{
private:

public:
    Simulate();
    ~Simulate();
    void runSim(double duration);
    void simStats();
    void simRestart();
    void quitSim();
};

#endif // SIMULATE_H
