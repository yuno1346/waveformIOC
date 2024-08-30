TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = waveformIOC
# waveformIOC.dbd will be created and installed
DBD += waveformIOC.dbd

# waveformIOC.dbd will be made up from these files:
waveformIOC_DBD += base.dbd

# Include dbd files from all support applications:
#waveformIOC_DBD += xxx.dbd
waveformIOC_DBD += calc.dbd
waveformIOC_DBD += stream.dbd
waveformIOC_DBD += drvAsynSerialPort.dbd
waveformIOC_DBD += drvAsynIPPort.dbd
waveformIOC_DBD += asyn.dbd

# Add all the support libraries needed by this IOC
#waveformIOC_LIBS += xxx
waveformIOC_LIBS += calc stream asyn

# waveformIOC_registerRecordDeviceDriver.cpp derives from waveformIOC.dbd
waveformIOC_SRCS += waveformIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
waveformIOC_SRCS_DEFAULT += waveformIOCMain.cpp
waveformIOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#waveformIOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
waveformIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

