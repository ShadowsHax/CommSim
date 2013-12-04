#ifndef SIMENVIRONMENT_H
#define SIMENVIRONMENT_H

#include <string>
#include "/Processes/StaticVec.h"

class SimEnvironment
{
private:
    float Time;
    float origTime;
    int* MapSize;
    int SimID;
    static int NumSim;
public:
    SimEnvironment() : Time(0), origTime(0), MapSize(new int[5]), SimID(NumSim){NumSim++;}
    SimEnvironment(int* MapBounds, float initTime=0) : Time(initTime), origTime(initTime), MapSize(MapBounds), SimID(NumSim){NumSim++;}
    ~SimEnvironment(){NumSim--;}
    float getTime(){return Time;}
    int* getMapSize(){return MapSize;}
    int getID(){return SimID;}
    void setTime(float newTime){Time = newTime;}
};

#endif // SIMENVIRONMENT_H
