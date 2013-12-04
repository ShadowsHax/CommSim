#ifndef ERRORBASE_H
#define ERRORBASE_H

#include <exception>

class ErrorBase: public std::exception
{
public:
    ErrorBase();
    virtual const char* what() const throw(){return "An unknown exception occured.";}
    virtual char* where(char &source) const throw(){
        char *temp = new char[];
        strcpy(temp,"Exception source: ");
        strcat(temp,source);
        char result = temp;
        delete [] temp;
        return result;
    }
} baseEx;

class UndefError: public ErrorBase
{
public:
    UndefError();
    virtual const char* what() const throw(){return "Calculation resulted in undefined result.";}
} undefEx;

class OutOfBounds: public ErrorBase
{
public:
    OutOfBounds();
    virtual const char* what() const throw(){return "Attempted to access value outside domain.";}
} OoBEx;

class ClientError: public ErrorBase
{
public:
    ClientError();
    virtual const char* what() const throw(){return "A client object has produced an error.";}
} ClientEx;

class CommandError: public ErrorBase
{
public:
    CommandError();
    virtual const char* what() const throw(){return "Command could not be executed, due to an internal error.";}
} ComEx;

#endif // ERRORBASE_H
