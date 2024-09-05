#!../../bin/linux-x86_64/waveformIOC

#- You may have to change waveformIOC to something else
#- everywhere it appears in this file

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/proto")

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/waveformIOC.dbd", 0, 0)
waveformIOC_registerRecordDeviceDriver(pdbbase)

#drvAsynSerialPortConfiguration("portName","ttyName",priority,noAutoConnect,noEos)
drvAsynIPPortConfigure("L0", "169.254.5.21:5025")


## Load record instances
#dbLoadRecords("waveformIOC.db","user=kyh")
dbLoadRecords("db/waveformIOC.db", "SYS=KEYSIGHT, DEV=33500B, PORT=L0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

## Start any sequence programs
#seq sncxxx,"user=kyh"
