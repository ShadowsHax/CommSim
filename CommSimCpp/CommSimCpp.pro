#-------------------------------------------------
#
# Project created by QtCreator 2013-10-23T17:02:54
#
#-------------------------------------------------

QT       += core gui

TARGET = CommSimCpp
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    Classes/command.cpp \
    ErrorHandles/errorbase.cpp \
    Classes/simulate.cpp \
    Classes/simenvironment.cpp

HEADERS  += mainwindow.h \
    Classes/command.h \
    ErrorHandles/errorbase.h \
    Classes/simulate.h \
    Classes/simenvironment.h \
    Processes/StaticVec.h

FORMS    += mainwindow.ui
