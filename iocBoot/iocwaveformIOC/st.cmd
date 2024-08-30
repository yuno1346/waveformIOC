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
#drvAsynSerialPortConfigure("L0","169.254.5.21:5025", 0, 0, 0)
#asynSetOption("portName","addr","key","value")
#drvAsynIPSocketConfigure("L0", "169.254.5.21:5025", 0)
drvAsynIPPortConfigure("L0", "169.254.5.21:5025")
#drvAsynTCPPortConfigure("L0", "169.254.5.21:5025", 0, 0, 0)

## Load record instances
#dbLoadRecords("waveformIOC.db","user=kyh")
# Use the configured prot name L0 in the dbLoadRecords command
dbLoadRecords("/home/kyh/EPICS/IOCs/waveformIOC/waveformIOCApp/Db/waveformIOC.db", "SYS=KEYSIGHT:, DEV=33500B:, PORT=L0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

## Start any sequence programs
#seq sncxxx,"user=kyh"
