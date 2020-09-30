#-------------------------------------------------
#
# Project created by QtCreator 2016-04-23T10:43:26
#
#-------------------------------------------------

QT       -= gui

QT += serialport  network

TARGET = DobotDll
TEMPLATE = lib

DEFINES += DOBOTDLL_LIBRARY

include(src/ComPlatform/ComPlatform.pri)
include(src/DobotDevice/DobotDevice.pri)

SOURCES += src/DobotDll.cpp\
           src/CDobot.cpp\
           src/CDobotConnector.cpp\
           src/CDobotProtocol.cpp\
           src/CDobotCommunicator.cpp\

HEADERS += src/dobotdll_global.h \
           src/DobotType.h\
           src/DobotDll.h\
           src/CDobot.h\
           src/CDobotConnector.h\
           src/CDobotProtocol.h\
           src/CDobotCommunicator.h\

#unix {
#    target.path = /usr/lib
#    INSTALLS += target
#}

#DESTDIR = ../../../DobotDllOutput

DestinationDir = $$PWD/build
win32 {
    CONFIG(debug, debug|release):DestinationDir = $$DestinationDir/win32/debug
    CONFIG(release, debug|release): DestinationDir = $$DestinationDir/win32/release
    DESTDIR = $$DestinationDir
}

linux:!android {
    CONFIG(debug, debug|release):DestinationDir = $$DestinationDir/unix/debug
    CONFIG(release, debug|release): DestinationDir = $$DestinationDir/unix/release
    DESTDIR = $$DestinationDir
}

global.files = $$DestinationDir/*
global.path = $$(DOBOT_INSTALL)/lib
INSTALLS += global

headers.files = src/dobotdll_global.h \
               src/DobotType.h\
               src/DobotDll.h
headers.path = $$(DOBOT_INSTALL)/include/dobot
INSTALLS += headers

CONFIG(debug, debug | release) {
    TARGET = DobotDll_d
} else {
    TARGET = DobotDll
}
