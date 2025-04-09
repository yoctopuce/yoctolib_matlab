/*********************************************************************
*
*  $Id: svn_id $
*
*  Declares YCellularProxy, the high-level API for Cellular functions
*
*  - - - - - - - - - License information: - - - - - - - - -
*
*  Copyright (C) 2011 and beyond by Yoctopuce Sarl, Switzerland.
*
*  Yoctopuce Sarl (hereafter Licensor) grants to you a perpetual
*  non-exclusive license to use, modify, copy and integrate this
*  file into your software for the sole purpose of interfacing
*  with Yoctopuce products.
*
*  You may reproduce and distribute copies of this file in
*  source or object form, as long as the sole purpose of this
*  code is to interface with Yoctopuce products. You must retain
*  this notice in the distributed source file.
*
*  You should refer to Yoctopuce General Terms and Conditions
*  for additional information regarding your rights and
*  obligations.
*
*  THE SOFTWARE AND DOCUMENTATION ARE PROVIDED 'AS IS' WITHOUT
*  WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
*  WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS
*  FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO
*  EVENT SHALL LICENSOR BE LIABLE FOR ANY INCIDENTAL, SPECIAL,
*  INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA,
*  COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR
*  SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT
*  LIMITED TO ANY DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR
*  CONTRIBUTION, OR OTHER SIMILAR COSTS, WHETHER ASSERTED ON THE
*  BASIS OF CONTRACT, TORT (INCLUDING NEGLIGENCE), BREACH OF
*  WARRANTY, OR OTHERWISE.
*
*********************************************************************/

#ifndef YPA_H
#define YPA_H

#ifdef  __cplusplus
extern "C" {
#endif

#if defined(_WIN32) && defined(GENERATE_PROXY_DLL)
#define YPA_FUNCTION_EXPORT __declspec(dllexport)
#else
#define YPA_FUNCTION_EXPORT
#endif

#include <stdint.h>
#include <stddef.h>

// Result codes for all ypa functions
#define YPA_SUCCESS                      0  // everything worked all right
#define YPA_ERROR_NOT_INITIALIZED       -1  // call ypaRegisterHub first !
#define YPA_ERROR_INVALID_ARGUMENT      -2  // one of the arguments passed to the function is invalid
#define YPA_ERROR_BUFFER_TOO_SMALL     -50  // buffer provided as argument is too small
#define YPA_ERROR_EXCEPTION            -99  // an exception occured while running function

// Opaque type used to work with ypa objects
typedef int32_t ypaHandle;

// Default handles
#define YPA_NULL_HANDLE                 ((ypaHandle)0)

//--- (generated code: Class Handles)
#define YPA_Accelerometer               ((ypaHandle)-160312312)     // accelerometer control
#define YPA_Altitude                    ((ypaHandle)1119668068)     // altimeter control
#define YPA_AnButton                    ((ypaHandle)-671866358)     // analog input control
#define YPA_ArithmeticSensor            ((ypaHandle)-901979247)     // arithmetic sensor control
#define YPA_AudioIn                     ((ypaHandle)-967221045)     // audio input control
#define YPA_AudioOut                    ((ypaHandle)614576088)      // audio output control
#define YPA_BluetoothLink               ((ypaHandle)270005284)      // Bluetooth sound controller control
#define YPA_Buzzer                      ((ypaHandle)956647415)      // buzzer control
#define YPA_CarbonDioxide               ((ypaHandle)-667224881)     // CO2 sensor control
#define YPA_Cellular                    ((ypaHandle)-410319788)     // cellular
#define YPA_ColorLed                    ((ypaHandle)830025670)      // RGB LED control
#define YPA_ColorLedCluster             ((ypaHandle)-820359136)     // RGB LED cluster control
#define YPA_ColorSensor                 ((ypaHandle)-968744065)     // color sensor control
#define YPA_Compass                     ((ypaHandle)-1615088175)    // compass function control
#define YPA_Current                     ((ypaHandle)323882391)      // current sensor control
#define YPA_CurrentLoopOutput           ((ypaHandle)-1008979631)    // 4-20mA output control
#define YPA_DaisyChain                  ((ypaHandle)-1221871689)    // Module chain configuration
#define YPA_DataLogger                  ((ypaHandle)336082198)      // DataLogger control
#define YPA_DigitalIO                   ((ypaHandle)-1025204820)    // digital IO port control
#define YPA_Display                     ((ypaHandle)-1016313025)    // display control
#define YPA_DualPower                   ((ypaHandle)2136574104)     // dual power switch control
#define YPA_Files                       ((ypaHandle)-940282019)     // filesystem control
#define YPA_Function                    ((ypaHandle)869823595)      // Common function
#define YPA_GenericSensor               ((ypaHandle)-347075075)     // GenericSensor control
#define YPA_Gps                         ((ypaHandle)1822890791)     // Geolocalization control
#define YPA_GroundSpeed                 ((ypaHandle)1091265983)     // ground speed sensor control
#define YPA_Gyro                        ((ypaHandle)-1130132486)    // gyroscope control
#define YPA_HubPort                     ((ypaHandle)-1871547951)    // YoctoHub slave port control
#define YPA_Humidity                    ((ypaHandle)-1869998700)    // humidity sensor control
#define YPA_I2cPort                     ((ypaHandle)423127297)      // I2C port control
#define YPA_InputCapture                ((ypaHandle)1777674847)     // instant snapshot trigger control
#define YPA_InputChain                  ((ypaHandle)567738162)      // InputChain function
#define YPA_Latitude                    ((ypaHandle)-1200704651)    // latitude sensor control
#define YPA_Led                         ((ypaHandle)-728459499)     // monochrome LED control
#define YPA_LightSensor                 ((ypaHandle)-1276902144)    // light sensor control
#define YPA_Longitude                   ((ypaHandle)118549960)      // longitude sensor control
#define YPA_Magnetometer                ((ypaHandle)41181293)       // magnetometer control
#define YPA_MessageBox                  ((ypaHandle)1250089747)     // SMS message box
#define YPA_MicroPython                 ((ypaHandle)-1082736365)    // MicroPython interpreter control
#define YPA_Module                      ((ypaHandle)193471262)      // Global parameters control
#define YPA_Motor                       ((ypaHandle)177351492)      // motor control
#define YPA_MultiAxisController         ((ypaHandle)1509950627)     // MultiAxisController function
#define YPA_MultiCellWeighScale         ((ypaHandle)-834229248)     // multi-cell weighing scale sensor control
#define YPA_MultiSensController         ((ypaHandle)1517278025)     // Sensor chain configuration
#define YPA_Network                     ((ypaHandle)-1355170272)    // network
#define YPA_OsControl                   ((ypaHandle)2063041698)     // Operating system control
#define YPA_Power                       ((ypaHandle)1783312036)     // electrical power sensor control
#define YPA_PowerOutput                 ((ypaHandle)1046168319)     // power output control
#define YPA_PowerSupply                 ((ypaHandle)547144429)      // regulated power supply control
#define YPA_Pressure                    ((ypaHandle)-1495678415)    // pressure sensor control
#define YPA_Proximity                   ((ypaHandle)-1740386382)    // proximity sensor control
#define YPA_PwmInput                    ((ypaHandle)1919562816)     // PWM input control
#define YPA_PwmOutput                   ((ypaHandle)-1575006081)    // PWM generator control
#define YPA_PwmPowerSource              ((ypaHandle)1094860190)     // PWM generator power source control
#define YPA_Qt                          ((ypaHandle)-1257124913)    // Base
#define YPA_QuadratureDecoder           ((ypaHandle)45759629)       // quadrature decoder control
#define YPA_RangeFinder                 ((ypaHandle)-1644905758)    // range finder control
#define YPA_RealTimeClock               ((ypaHandle)1728580619)     // real-time clock control
#define YPA_RefFrame                    ((ypaHandle)-954646525)     // 3D reference frame configuration
#define YPA_Relay                       ((ypaHandle)-1661219395)    // relay control
#define YPA_RfidReader                  ((ypaHandle)-1155647262)    // RfidReader function
#define YPA_Sdi12Port                   ((ypaHandle)830069866)      // SDI12 port control
#define YPA_SegmentedDisplay            ((ypaHandle)-1913115059)    // segmented display control
#define YPA_Sensor                      ((ypaHandle)-1154870650)    // Sensor function
#define YPA_SerialPort                  ((ypaHandle)176907600)      // serial port control
#define YPA_Servo                       ((ypaHandle)1182030768)     // RC servo motor control
#define YPA_SpectralChannel             ((ypaHandle)1853609278)     // spectral analysis channel control
#define YPA_SpectralSensor              ((ypaHandle)850066180)      // spectral sensor control
#define YPA_SpiPort                     ((ypaHandle)-759817913)     // SPI port control
#define YPA_StepperMotor                ((ypaHandle)1176691010)     // stepper motor control
#define YPA_Temperature                 ((ypaHandle)953329083)      // temperature sensor control
#define YPA_Threshold                   ((ypaHandle)1770760245)     // Control
#define YPA_Tilt                        ((ypaHandle)-1139988792)    // tilt sensor control
#define YPA_Tvoc                        ((ypaHandle)59315329)       // Total Volatile Organic Compound sensor control
#define YPA_Voc                         ((ypaHandle)-1582379878)    // Volatile Organic Compound sensor control
#define YPA_Voltage                     ((ypaHandle)-1037706661)    // voltage sensor control
#define YPA_VoltageOutput               ((ypaHandle)1807323974)     // voltage output control
#define YPA_WakeUpMonitor               ((ypaHandle)-1424989366)    // wake-up monitor control
#define YPA_WakeUpSchedule              ((ypaHandle)1370082080)     // wake up schedule control
#define YPA_Watchdog                    ((ypaHandle)-639754450)     // watchdog control
#define YPA_WeighScale                  ((ypaHandle)536971517)      // weighing scale sensor control
#define YPA_Wireless                    ((ypaHandle)-1054526540)    // wireless LAN
//--- (end of generated code: Class Handles)

//--- (generated code: Property Handles)
#define YPA_AbcPeriod                   ((ypaHandle)1957054479)     // Int32
#define YPA_ActiveLedCount              ((ypaHandle)-375283963)     // Int32
#define YPA_AdminPassword               ((ypaHandle)-809628542)     // String
#define YPA_AdvMode                     ((ypaHandle)-1940140519)    // Int32
#define YPA_AdvertisedValue             ((ypaHandle)1087298174)     // String
#define YPA_AlertLevel                  ((ypaHandle)-958184872)     // Double
#define YPA_AnalogCalibration           ((ypaHandle)867280109)      // Int32
#define YPA_Apn                         ((ypaHandle)187435852)      // String
#define YPA_AutoStart                   ((ypaHandle)-1303422913)    // Int32
#define YPA_Bandwidth                   ((ypaHandle)150493132)      // Int32
#define YPA_Beacon                      ((ypaHandle)602156241)      // Int32
#define YPA_BeaconDriven                ((ypaHandle)-1131542791)    // Int32
#define YPA_Bearing                     ((ypaHandle)470503760)      // Double
#define YPA_BlinkSeqMaxCount            ((ypaHandle)111688311)      // Int32
#define YPA_BlinkSeqMaxSize             ((ypaHandle)1429993085)     // Int32
#define YPA_Blinking                    ((ypaHandle)-922969687)     // Int32
#define YPA_Brightness                  ((ypaHandle)-1775512269)    // Int32
#define YPA_CalibratedValue             ((ypaHandle)-179529870)     // Int32
#define YPA_CalibrationMax              ((ypaHandle)-2080585404)    // Int32
#define YPA_CalibrationMin              ((ypaHandle)-1074661859)    // Int32
#define YPA_CallbackCredentials         ((ypaHandle)1121734337)     // String
#define YPA_CallbackEncoding            ((ypaHandle)1734391266)     // Int32
#define YPA_CallbackInitialDelay        ((ypaHandle)1870200206)     // Int32
#define YPA_CallbackMaxDelay            ((ypaHandle)1580054225)     // Int32
#define YPA_CallbackMethod              ((ypaHandle)-377950888)     // Int32
#define YPA_CallbackMinDelay            ((ypaHandle)-1202906832)    // Int32
#define YPA_CallbackSchedule            ((ypaHandle)1427135830)     // String
#define YPA_CallbackTemplate            ((ypaHandle)-1740090578)    // Int32
#define YPA_CallbackUrl                 ((ypaHandle)-111853320)     // String
#define YPA_CaptureTypeAtStartup        ((ypaHandle)439726280)      // Int32
#define YPA_CellCount                   ((ypaHandle)671608952)      // Int32
#define YPA_CellOperator                ((ypaHandle)668276197)      // String
#define YPA_ClassName                   ((ypaHandle)1191326365)     // String
#define YPA_Clock                       ((ypaHandle)2142933398)     // String
#define YPA_CondAlign                   ((ypaHandle)-1813865635)    // Int32
#define YPA_CondValue                   ((ypaHandle)1520788386)     // Double
#define YPA_CondValueAtStartup          ((ypaHandle)-1659506434)    // Double
#define YPA_CoordSystem                 ((ypaHandle)1773442191)     // Int32
#define YPA_Current                     ((ypaHandle)323882391)      // Double
#define YPA_CurrentAtStartUp            ((ypaHandle)-2136585727)    // Double
#define YPA_CurrentLimitAtStartUp       ((ypaHandle)-1172706664)    // Double
#define YPA_CurrentValue                ((ypaHandle)1444001205)     // Double
#define YPA_CurrentVoltage              ((ypaHandle)-239362194)     // Double
#define YPA_CutOffVoltage               ((ypaHandle)-198941592)     // Double
#define YPA_DebouncePeriod              ((ypaHandle)-305491294)     // Int32
#define YPA_Decoding                    ((ypaHandle)1603522429)     // Int32
#define YPA_DefaultPage                 ((ypaHandle)1370029086)     // String
#define YPA_DetectionHysteresis         ((ypaHandle)1337846157)     // Int32
#define YPA_DetectionThreshold          ((ypaHandle)-1760438400)    // Int32
#define YPA_DisableHostSync             ((ypaHandle)2143161149)     // Int32
#define YPA_Discoverable                ((ypaHandle)2058888627)     // Int32
#define YPA_DisplayHeight               ((ypaHandle)-889758533)     // Int32
#define YPA_DisplayType                 ((ypaHandle)860800352)      // Int32
#define YPA_DisplayWidth                ((ypaHandle)-2086327159)    // Int32
#define YPA_DutyCycle                   ((ypaHandle)44595434)       // Double
#define YPA_DutyCycleAtPowerOn          ((ypaHandle)-113709649)     // Double
#define YPA_DynamicLedCount             ((ypaHandle)-248476858)     // Int32
#define YPA_EdgePerCycle                ((ypaHandle)1810894099)     // Int32
#define YPA_EdgesPerCycle               ((ypaHandle)2125116694)     // Int32
#define YPA_EnableData                  ((ypaHandle)229750544)      // Int32
#define YPA_Enabled                     ((ypaHandle)-1622900200)    // Int32
#define YPA_EnabledAtPowerOn            ((ypaHandle)1248577487)     // Int32
#define YPA_EstimatedHSL                ((ypaHandle)952687281)      // Int32
#define YPA_EstimatedRGB                ((ypaHandle)-529594811)     // Int32
#define YPA_EstimationModel             ((ypaHandle)804222426)      // Int32
#define YPA_Excitation                  ((ypaHandle)1342015048)     // Int32
#define YPA_ExpectedNodes               ((ypaHandle)1505615639)     // Int32
#define YPA_ExternalSense               ((ypaHandle)-1246869699)    // Int32
#define YPA_FailSafeTimeout             ((ypaHandle)832905954)      // Int32
#define YPA_FilesCount                  ((ypaHandle)-777511476)     // Int32
#define YPA_FirmwareRelease             ((ypaHandle)318304357)      // String
#define YPA_Frequency                   ((ypaHandle)-1534182736)    // Double
#define YPA_FriendlyName                ((ypaHandle)-671461928)     // String
#define YPA_FunctionId                  ((ypaHandle)-69437597)      // String
#define YPA_FusionMode                  ((ypaHandle)1073169764)     // Int32
#define YPA_Gain                        ((ypaHandle)1890026046)     // Int32
#define YPA_GainAtPowerOn               ((ypaHandle)1859791163)     // Int32
#define YPA_HardwareId                  ((ypaHandle)-498591861)     // String
#define YPA_Hours                       ((ypaHandle)1272681097)     // Int32
#define YPA_HslColor                    ((ypaHandle)1549374294)     // Int32
#define YPA_HttpPort                    ((ypaHandle)754675967)      // Int32
#define YPA_HttpsPort                   ((ypaHandle)-993434413)     // Int32
#define YPA_I2cMode                     ((ypaHandle)-849120410)     // String
#define YPA_I2cVoltageLevel             ((ypaHandle)1933961956)     // Int32
#define YPA_InputType                   ((ypaHandle)-417055194)     // Int32
#define YPA_InstanceId                  ((ypaHandle)-969053799)     // Int32
#define YPA_IntegrationTime             ((ypaHandle)563999031)      // Int32
#define YPA_IntegrationTimeAtPowerOn    ((ypaHandle)728180829)      // Int32
#define YPA_InvertedOutput              ((ypaHandle)-503052120)     // Int32
#define YPA_IpAddress                   ((ypaHandle)1744288001)     // String
#define YPA_IsFixed                     ((ypaHandle)1482917520)     // Int32
#define YPA_IsOnline                    ((ypaHandle)-1507010970)    // Int32 (bool)
#define YPA_IsPresent                   ((ypaHandle)428506996)      // Int32
#define YPA_IsPressed                   ((ypaHandle)-10327783)      // Int32
#define YPA_JobMaxSize                  ((ypaHandle)577118636)      // Int32
#define YPA_JobMaxTask                  ((ypaHandle)-2015830301)    // Int32
#define YPA_LastCaptureTime             ((ypaHandle)-2017387805)    // Int64
#define YPA_LayerCount                  ((ypaHandle)-2108308489)    // Int32
#define YPA_LayerHeight                 ((ypaHandle)1966018115)     // Int32
#define YPA_LayerWidth                  ((ypaHandle)-1953054022)    // Int32
#define YPA_LedCalibration              ((ypaHandle)-1817793783)    // Int32
#define YPA_LedCurrent                  ((ypaHandle)-1417988325)    // Int32
#define YPA_LedCurrentAtPowerOn         ((ypaHandle)741389257)      // Int32
#define YPA_LedType                     ((ypaHandle)669296668)      // Int32
#define YPA_LinkQuality                 ((ypaHandle)-1385947561)    // Int32
#define YPA_LockedOperator              ((ypaHandle)-1023493418)    // String
#define YPA_LogFrequency                ((ypaHandle)-64196617)      // String
#define YPA_LogicalName                 ((ypaHandle)-1694618581)    // String
#define YPA_LoopPower                   ((ypaHandle)231849694)      // Int32
#define YPA_LoopbackTest                ((ypaHandle)-614787111)     // Int32
#define YPA_Luminosity                  ((ypaHandle)-43863649)      // Int32
#define YPA_MacAddress                  ((ypaHandle)-1037213766)    // String
#define YPA_MaxLedCount                 ((ypaHandle)-1243181488)    // Int32
#define YPA_MaxTimeOnStateA             ((ypaHandle)1380265060)     // Int64
#define YPA_MaxTimeOnStateB             ((ypaHandle)-884179490)     // Int64
#define YPA_MeasureType                 ((ypaHandle)-1936546348)    // Int32
#define YPA_MinFrequency                ((ypaHandle)1932116497)     // Double
#define YPA_MinutesA                    ((ypaHandle)1708156357)     // Int32
#define YPA_MinutesB                    ((ypaHandle)-52874113)      // Int32
#define YPA_MonthDays                   ((ypaHandle)1224051278)     // Int32
#define YPA_Months                      ((ypaHandle)-179316456)     // Int32
#define YPA_MotorStatus                 ((ypaHandle)1152031420)     // Int32
#define YPA_Mute                        ((ypaHandle)1821105250)     // Int32
#define YPA_NSamples                    ((ypaHandle)309771811)      // Int32
#define YPA_NSensors                    ((ypaHandle)-617147452)     // Int32
#define YPA_NTags                       ((ypaHandle)-819202767)     // Int32
#define YPA_NearSimpleColorIndex        ((ypaHandle)1535154588)     // Int32
#define YPA_Neutral                     ((ypaHandle)1805245548)     // Int32
#define YPA_NextOccurence               ((ypaHandle)1140328534)     // Int64
#define YPA_NextWakeUp                  ((ypaHandle)-1833688379)    // Int64
#define YPA_NtpServer                   ((ypaHandle)-668405223)     // String
#define YPA_Obey                        ((ypaHandle)-1741431229)    // String
#define YPA_Orientation                 ((ypaHandle)-1340323199)    // Int32
#define YPA_OutputVoltage               ((ypaHandle)1555385540)     // Int32
#define YPA_OverCurrentLimit            ((ypaHandle)-176537650)     // Int32
#define YPA_PairingPin                  ((ypaHandle)2018831182)     // String
#define YPA_Period                      ((ypaHandle)-1038869512)    // Double
#define YPA_Pin                         ((ypaHandle)-1916245229)    // String
#define YPA_PingInterval                ((ypaHandle)512343684)      // Int32
#define YPA_PlaySeqMaxSize              ((ypaHandle)690799168)      // Int32
#define YPA_PortDirection               ((ypaHandle)1600523236)     // Int32
#define YPA_PortOpenDrain               ((ypaHandle)2025502540)     // Int32
#define YPA_PortPolarity                ((ypaHandle)-864581083)     // Int32
#define YPA_PortSize                    ((ypaHandle)1911860782)     // Int32
#define YPA_PortState                   ((ypaHandle)-760978440)     // Int32
#define YPA_Position                    ((ypaHandle)-1084586333)    // Int32
#define YPA_PositionAtPowerOn           ((ypaHandle)878540240)      // Int32
#define YPA_Power                       ((ypaHandle)1783312036)     // Int32
#define YPA_PowerControl                ((ypaHandle)-677578541)     // Int32
#define YPA_PowerDuration               ((ypaHandle)2024922210)     // Int32
#define YPA_PowerMode                   ((ypaHandle)2043155365)     // Int32
#define YPA_PowerOutputAtStartUp        ((ypaHandle)427039869)      // Int32
#define YPA_PowerState                  ((ypaHandle)1153826216)     // Int32
#define YPA_PreAmplifier                ((ypaHandle)-1398814721)    // Int32
#define YPA_PresenceMinTime             ((ypaHandle)-1009984493)    // Int32
#define YPA_PrimaryDNS                  ((ypaHandle)478696519)      // String
#define YPA_ProductId                   ((ypaHandle)-1266150234)    // Int32
#define YPA_ProductName                 ((ypaHandle)-708242678)     // String
#define YPA_ProductRelease              ((ypaHandle)131196030)      // Int32
#define YPA_Protocol                    ((ypaHandle)834067994)      // String
#define YPA_ProximityReportMode         ((ypaHandle)1400758512)     // Int32
#define YPA_PwmReportMode               ((ypaHandle)-338484999)     // Int32
#define YPA_Qnh                         ((ypaHandle)707277526)      // Double
#define YPA_RadioConfig                 ((ypaHandle)-1539217766)    // String
#define YPA_Range                       ((ypaHandle)1380349261)     // Int32
#define YPA_RangeFinderMode             ((ypaHandle)2099892640)     // Int32
#define YPA_Readiness                   ((ypaHandle)1356550120)     // Int32
#define YPA_Recording                   ((ypaHandle)966961648)      // Int32
#define YPA_RefreshRate                 ((ypaHandle)511122244)      // Int32
#define YPA_RemoteAddress               ((ypaHandle)119860743)      // String
#define YPA_RemovalMinTime              ((ypaHandle)-2078298610)    // Int32
#define YPA_ReportFrequency             ((ypaHandle)49010739)       // String
#define YPA_RequiredChildCount          ((ypaHandle)-1652825674)    // Int32
#define YPA_Resolution                  ((ypaHandle)-1299313574)    // Double
#define YPA_RgbColor                    ((ypaHandle)414803736)      // Int32
#define YPA_RgbColorAtPowerOn           ((ypaHandle)-2025352269)    // Int32
#define YPA_Running                     ((ypaHandle)-526601997)     // Int32
#define YPA_SafeLevel                   ((ypaHandle)-1665058300)    // Double
#define YPA_SatCount                    ((ypaHandle)-2117877839)    // Int64
#define YPA_Saturation                  ((ypaHandle)1702342232)     // Int32
#define YPA_SecondaryDNS                ((ypaHandle)-1347971057)    // String
#define YPA_SecondsBefore               ((ypaHandle)-1849004517)    // Int32
#define YPA_SecurityMode                ((ypaHandle)331425851)      // Int32
#define YPA_Sensitivity                 ((ypaHandle)2047615200)     // Int32
#define YPA_SensorType                  ((ypaHandle)-928726846)     // Int32
#define YPA_SerialMode                  ((ypaHandle)-556761289)     // String
#define YPA_SerialNumber                ((ypaHandle)1667640262)     // String
#define YPA_ShiftSampling               ((ypaHandle)1791691873)     // Int32
#define YPA_Signal                      ((ypaHandle)1939902659)     // Int32
#define YPA_SignalBias                  ((ypaHandle)475373586)      // Double
#define YPA_SignalRange                 ((ypaHandle)-1663471177)    // String
#define YPA_SignalSampling              ((ypaHandle)2082678665)     // Int32
#define YPA_SignalUnit                  ((ypaHandle)-2106997222)    // String
#define YPA_SlotsInUse                  ((ypaHandle)1241773948)     // Int32
#define YPA_SpiMode                     ((ypaHandle)116196128)      // String
#define YPA_SsPolarity                  ((ypaHandle)1870731753)     // Int32
#define YPA_Ssid                        ((ypaHandle)1353440502)     // String
#define YPA_StarterTime                 ((ypaHandle)-33940168)      // Int32
#define YPA_StartupJob                  ((ypaHandle)-1925555907)    // String
#define YPA_StartupScript               ((ypaHandle)-253344446)     // String
#define YPA_StartupSeq                  ((ypaHandle)-526620522)     // String
#define YPA_State                       ((ypaHandle)1649606143)     // Int32
#define YPA_StateAtPowerOn              ((ypaHandle)-867300382)     // Int32
#define YPA_TempAvgAdaptRatio           ((ypaHandle)-556076344)     // Double
#define YPA_TempChgAdaptRatio           ((ypaHandle)1538226529)     // Double
#define YPA_ThresholdState              ((ypaHandle)-636231828)     // Int32
#define YPA_TimeFrame                   ((ypaHandle)105965660)      // Int64
#define YPA_TriggerDelay                ((ypaHandle)119910737)      // Int64
#define YPA_TriggerDuration             ((ypaHandle)-2015086004)    // Int64
#define YPA_Unit                        ((ypaHandle)2089395053)     // String
#define YPA_UpdateFrequency             ((ypaHandle)-961692945)     // String
#define YPA_UserPassword                ((ypaHandle)-121634804)     // String
#define YPA_UtcOffset                   ((ypaHandle)-1544767552)    // Int32
#define YPA_ValueRange                  ((ypaHandle)-372155041)     // String
#define YPA_Voltage                     ((ypaHandle)-1037706661)    // Int32
#define YPA_VoltageAtStartUp            ((ypaHandle)-2107764019)    // Double
#define YPA_VoltageLevel                ((ypaHandle)-1706330633)    // Int32
#define YPA_VoltageLimitAtStartUp       ((ypaHandle)295995621)      // Double
#define YPA_Volume                      ((ypaHandle)-1103705880)    // Int32
#define YPA_WatchdogPeriod              ((ypaHandle)1506918392)     // Int32
#define YPA_WeekDays                    ((ypaHandle)1057362437)     // Int32
#define YPA_WorkingMode                 ((ypaHandle)1480886976)     // Int32
#define YPA_WwwWatchdogDelay            ((ypaHandle)380497578)      // Int32
#define YPA_ZeroTracking                ((ypaHandle)-917206389)     // Double
//--- (end of generated code: Property Handles)

//--- (generated code: Method Handles)
#define YPA_CheckFirmware_Sssd          ((ypaHandle)-1957478924)    // e.g. FirmwareUpdate: char* resPtr, size_t* resSize, char* serial, char* path, int32_t minrelease
#define YPA_FirstHubInUse_H             ((ypaHandle)509972744)      // e.g. Hub: int32_t* resHdlPtr
#define YPA_GetAllBootLoaders_xS        ((ypaHandle)649060993)      // e.g. FirmwareUpdate: char* resPtr, size_t* resSize
#define YPA_Init_Yxsff                  ((ypaHandle)1704333356)     // e.g. ConsolidatedDataSet: YConsolidatedDataSetProxy* resPtr, char** sensorNamesPtr, size_t sensorNamesSize, double startTime, double endTime
#define YPA__AT_Ss                      ((ypaHandle)1386001681)     // e.g. Cellular: char* resPtr, size_t* resSize, char* cmd
#define YPA_abortAndBrake_D             ((ypaHandle)-2142153652)    // e.g. StepperMotor: int32_t* resPtr
#define YPA_abortAndHiZ_D               ((ypaHandle)711487166)      // e.g. StepperMotor: int32_t* resPtr
#define YPA_addFileToHTTPCallback_Ds    ((ypaHandle)1703241451)     // e.g. Module: int32_t* resPtr, char* filename
#define YPA_addFreqMoveToPlaySeq_Ddd    ((ypaHandle)-1172786252)    // e.g. Buzzer: int32_t* resPtr, int32_t freq, int32_t msDelay
#define YPA_addHslMoveToBlinkSeq_Ddd    ((ypaHandle)1555703222)     // e.g. ColorLed: int32_t* resPtr, int32_t HSLcolor, int32_t msDelay
#define YPA_addHslMoveToBlinkSeq_Dddd   ((ypaHandle)-1165760944)    // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex, int32_t hslValue, int32_t delay
#define YPA_addJumpToBlinkSeq_Ddd       ((ypaHandle)-723903890)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex, int32_t linkSeqIndex
#define YPA_addMirrorToBlinkSeq_Dd      ((ypaHandle)-1501498761)    // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_addNotesToPlaySeq_Ds        ((ypaHandle)-1417042561)    // e.g. Buzzer: int32_t* resPtr, char* notes
#define YPA_addPulseToPlaySeq_Ddd       ((ypaHandle)576765521)      // e.g. Buzzer: int32_t* resPtr, int32_t freq, int32_t msDuration
#define YPA_addRgbMoveToBlinkSeq_Ddd    ((ypaHandle)-331454021)     // e.g. ColorLed: int32_t* resPtr, int32_t RGBcolor, int32_t msDelay
#define YPA_addRgbMoveToBlinkSeq_Dddd   ((ypaHandle)-998105439)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex, int32_t rgbValue, int32_t delay
#define YPA_addText_Ds                  ((ypaHandle)270824787)      // e.g. Sms: int32_t* resPtr, char* val
#define YPA_addUnicodeData_Dxd          ((ypaHandle)1577720391)     // e.g. Sms: int32_t* resPtr, int32_t* valPtr, size_t valSize
#define YPA_addUnlinkToBlinkSeq_Dd      ((ypaHandle)-958680432)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_addVolMoveToPlaySeq_Ddd     ((ypaHandle)779706383)      // e.g. Buzzer: int32_t* resPtr, int32_t volume, int32_t msDuration
#define YPA_adhocNetwork_Dss            ((ypaHandle)1042564611)     // e.g. Wireless: int32_t* resPtr, char* ssid, char* securityKey
#define YPA_alertStepDir_Dd             ((ypaHandle)-326076859)     // e.g. StepperMotor: int32_t* resPtr, int32_t dir
#define YPA_alertStepOut_D              ((ypaHandle)-1786989049)    // e.g. StepperMotor: int32_t* resPtr
#define YPA_brakingForceMove_Dfd        ((ypaHandle)-1719992412)    // e.g. Motor: int32_t* resPtr, double targetPower, int32_t delay
#define YPA_calibrateFromPoints_Dxfxf   ((ypaHandle)470454055)      // e.g. Sensor: int32_t* resPtr, double* rawValuesPtr, size_t rawValuesSize, double* refValuesPtr, size_t refValuesSize
#define YPA_calibrateToZero_D           ((ypaHandle)458331972)      // e.g. Tilt: int32_t* resPtr
#define YPA_calibrate_f                 ((ypaHandle)608564150)      // e.g. LightSensor: double calibratedVal
#define YPA_callbackLogin_ss            ((ypaHandle)2002495633)     // e.g. Network: char* username, char* password
#define YPA_cancel3DCalibration_D       ((ypaHandle)1638480466)     // e.g. RefFrame: int32_t* resPtr
#define YPA_cancelCoverGlassCalibrations_D ((ypaHandle)1547193273)     // e.g. RangeFinder: int32_t* resPtr
#define YPA_changeAddress_Rss           ((ypaHandle)654451080)      // e.g. Sdi12Port: YSdi12SensorInfoStruct* resPtr, char* oldAddress, char* newAddress
#define YPA_changeSpeed_Df              ((ypaHandle)1009228242)     // e.g. StepperMotor: int32_t* resPtr, double speed
#define YPA_checkFirmware_Ssb           ((ypaHandle)-1493402608)    // e.g. Module: char* resPtr, size_t* resSize, char* path, int32_t onlynew
#define YPA_clearConsole_D              ((ypaHandle)-1230104791)    // e.g. DisplayLayer: int32_t* resPtr
#define YPA_clearDataCounters_D         ((ypaHandle)-1188907209)    // e.g. Cellular: int32_t* resPtr
#define YPA_clearPduCounters_D          ((ypaHandle)1103123865)     // e.g. MessageBox: int32_t* resPtr
#define YPA_clear_D                     ((ypaHandle)-1851042224)    // e.g. DisplayLayer: int32_t* resPtr
#define YPA_connect_D                   ((ypaHandle)74507780)       // e.g. BluetoothLink: int32_t* resPtr
#define YPA_consoleOut_Ds               ((ypaHandle)903822282)      // e.g. DisplayLayer: int32_t* resPtr, char* text
#define YPA_copyLayerContent_Ddd        ((ypaHandle)492890742)      // e.g. Display: int32_t* resPtr, int32_t srcLayerId, int32_t dstLayerId
#define YPA_currentMove_Dfd             ((ypaHandle)1697453512)     // e.g. CurrentLoopOutput: int32_t* resPtr, double mA_target, int32_t ms_duration
#define YPA_decodePLMN_Ss               ((ypaHandle)-1106449621)    // e.g. Cellular: char* resPtr, size_t* resSize, char* mccmnc
#define YPA_defineAuxiliaryFunction_Dsxfxf ((ypaHandle)271307659)      // e.g. ArithmeticSensor: int32_t* resPtr, char* name, double* inputValuesPtr, size_t inputValuesSize, double* outputValuesPtr, size_t outputValuesSize
#define YPA_defineExpression_Fss        ((ypaHandle)949736265)      // e.g. ArithmeticSensor: double* resPtr, char* expr, char* descr
#define YPA_delayedPulse_Dddd           ((ypaHandle)1525073260)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t ms_delay, int32_t ms_duration
#define YPA_delayedPulse_dd             ((ypaHandle)-1994666463)    // e.g. Watchdog: int32_t ms_delay, int32_t ms_duration
#define YPA_detectAddress_D             ((ypaHandle)2111931039)     // e.g. MultiSensController: int32_t* resPtr
#define YPA_disconnect_D                ((ypaHandle)-2078280300)    // e.g. BluetoothLink: int32_t* resPtr
#define YPA_discoverAllSensors_xR       ((ypaHandle)1064563653)     // e.g. Sdi12Port: YSdi12SensorInfoStruct* resPtr, size_t* resSize
#define YPA_discoverSingleSensor_R      ((ypaHandle)1299005087)     // e.g. Sdi12Port: YSdi12SensorInfoStruct* resPtr
#define YPA_download_Ss                 ((ypaHandle)1612576021)     // e.g. Files: char* resPtr, size_t* resSize, char* pathname
#define YPA_drawBar_Ddddd               ((ypaHandle)-80922497)      // e.g. DisplayLayer: int32_t* resPtr, int32_t x1, int32_t y1, int32_t x2, int32_t y2
#define YPA_drawBitmap_Ddddsd           ((ypaHandle)-1735211966)    // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, int32_t w, char* bitmap, int32_t bgcol
#define YPA_drawCircle_Dddd             ((ypaHandle)-876321690)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, int32_t r
#define YPA_drawDisc_Dddd               ((ypaHandle)958373775)      // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, int32_t r
#define YPA_drawImage_Ddds              ((ypaHandle)370191290)      // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, char* imagename
#define YPA_drawPixel_Ddd               ((ypaHandle)1169780541)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y
#define YPA_drawRect_Ddddd              ((ypaHandle)-140158414)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x1, int32_t y1, int32_t x2, int32_t y2
#define YPA_drawText_Dddds              ((ypaHandle)1488552655)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, int32_t anchor, char* text
#define YPA_drivingForceMove_Dfd        ((ypaHandle)266860050)      // e.g. Motor: int32_t* resPtr, double targetPower, int32_t delay
#define YPA_dutyCycleMove_Dfd           ((ypaHandle)-674028340)     // e.g. PwmOutput: int32_t* resPtr, double target, int32_t ms_duration
#define YPA_emergencyStop_D             ((ypaHandle)1184506499)     // e.g. StepperMotor: int32_t* resPtr
#define YPA_enableDryRun_Db             ((ypaHandle)1948249140)     // e.g. RfidOptions: int32_t* resPtr, int32_t dryRun
#define YPA_enableRawAccess_Db          ((ypaHandle)693783517)      // e.g. RfidOptions: int32_t* resPtr, int32_t enableRaw
#define YPA_eval_Dss                    ((ypaHandle)-1005002161)    // e.g. MicroPython: int32_t* resPtr, char* codeName, char* mpyCode
#define YPA_fade_Ddd                    ((ypaHandle)862172543)      // e.g. Display: int32_t* resPtr, int32_t brightness, int32_t duration
#define YPA_fileExist_Bs                ((ypaHandle)-310296032)     // e.g. Files: int32_t* resPtr, char* filename
#define YPA_findHomePosition_Df         ((ypaHandle)881844422)      // e.g. StepperMotor: int32_t* resPtr, double speed
#define YPA_findHomePosition_Dxf        ((ypaHandle)-794690470)     // e.g. MultiAxisController: int32_t* resPtr, double* speedPtr, size_t speedSize
#define YPA_forceMultiBlockAccess_Db    ((ypaHandle)-2123164863)    // e.g. RfidOptions: int32_t* resPtr, int32_t forceMultiBlock
#define YPA_forceSingleBlockAccess_Db   ((ypaHandle)759282890)      // e.g. RfidOptions: int32_t* resPtr, int32_t forceSingleBlock
#define YPA_format_fs_D                 ((ypaHandle)1709704715)     // e.g. Files: int32_t* resPtr
#define YPA_freqMove_Ddd                ((ypaHandle)647901388)      // e.g. Buzzer: int32_t* resPtr, int32_t frequency, int32_t duration
#define YPA_frequencyMove_Dfd           ((ypaHandle)-298638449)     // e.g. PwmOutput: int32_t* resPtr, double target, int32_t ms_duration
#define YPA_getLockState_xBsddOP        ((ypaHandle)443802496)      // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_getSensorInformation_Rs     ((ypaHandle)1111250120)     // e.g. Sdi12Port: YSdi12SensorInfoStruct* resPtr, char* sensorAddr
#define YPA_get_3DCalibrationHint_S     ((ypaHandle)-667547053)     // e.g. RefFrame: char* resPtr, size_t* resSize
#define YPA_get_3DCalibrationLogMsg_S   ((ypaHandle)1526301088)     // e.g. RefFrame: char* resPtr, size_t* resSize
#define YPA_get_3DCalibrationProgress_D ((ypaHandle)-2097943345)    // e.g. RefFrame: int32_t* resPtr
#define YPA_get_3DCalibrationStageProgress_D ((ypaHandle)-771084694)     // e.g. RefFrame: int32_t* resPtr
#define YPA_get_3DCalibrationStage_D    ((ypaHandle)-835861029)     // e.g. RefFrame: int32_t* resPtr
#define YPA_get_CTS_D                   ((ypaHandle)-626264431)     // e.g. SerialPort: int32_t* resPtr
#define YPA_get_abcPeriod_D             ((ypaHandle)771699240)      // e.g. CarbonDioxide: int32_t* resPtr
#define YPA_get_absHum_F                ((ypaHandle)268103226)      // e.g. Humidity: double* resPtr
#define YPA_get_activeLedCount_D        ((ypaHandle)835593059)      // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_adminPassword_S         ((ypaHandle)2013864002)     // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_advMode_D               ((ypaHandle)1150220092)     // e.g. Sensor: int32_t* resPtr
#define YPA_get_advertisedValue_S       ((ypaHandle)48074797)       // e.g. Function: char* resPtr, size_t* resSize
#define YPA_get_airplaneMode_D          ((ypaHandle)458648010)      // e.g. Cellular: int32_t* resPtr
#define YPA_get_alertLevel_F            ((ypaHandle)-292388736)     // e.g. Threshold: double* resPtr
#define YPA_get_allSettings_S           ((ypaHandle)-1026018998)    // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_altitude_F              ((ypaHandle)-1400979103)    // e.g. Gps: double* resPtr
#define YPA_get_analogCalibration_D     ((ypaHandle)1381456541)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_apnSecret_S             ((ypaHandle)1586901559)     // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_apn_S                   ((ypaHandle)-509984360)     // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_autoStart_D             ((ypaHandle)-284241322)     // e.g. Watchdog: int32_t* resPtr
#define YPA_get_auxSignal_D             ((ypaHandle)-2134872015)    // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_availableOperators_xS   ((ypaHandle)-1077064302)    // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_bandwidth_D             ((ypaHandle)1075889934)     // e.g. Tilt: int32_t* resPtr
#define YPA_get_baudRate_D              ((ypaHandle)-503767631)     // e.g. HubPort: int32_t* resPtr
#define YPA_get_beacon_D                ((ypaHandle)1865482844)     // e.g. Module: int32_t* resPtr
#define YPA_get_bearing_F               ((ypaHandle)-343180071)     // e.g. RefFrame: double* resPtr
#define YPA_get_bitChain1_S             ((ypaHandle)-1008359006)    // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain2_S             ((ypaHandle)-1046276101)    // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain3_S             ((ypaHandle)-1067352628)    // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain4_S             ((ypaHandle)-986813623)     // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain5_S             ((ypaHandle)-991166082)     // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain6_S             ((ypaHandle)-961888473)     // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitChain7_S             ((ypaHandle)-949431024)     // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_bitDirection_Dd         ((ypaHandle)-146326613)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno
#define YPA_get_bitOpenDrain_Dd         ((ypaHandle)-415676385)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno
#define YPA_get_bitPolarity_Dd          ((ypaHandle)-43159685)      // e.g. DigitalIO: int32_t* resPtr, int32_t bitno
#define YPA_get_bitState_Dd             ((ypaHandle)59978430)       // e.g. DigitalIO: int32_t* resPtr, int32_t bitno
#define YPA_get_blinkSeqMaxCount_D      ((ypaHandle)1823846814)     // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_blinkSeqMaxSize_D       ((ypaHandle)-1728364737)    // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_blinkSeqSignature_D     ((ypaHandle)1674038915)     // e.g. ColorLed: int32_t* resPtr
#define YPA_get_blinkSeqSignatures_xDdd ((ypaHandle)-527316549)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t seqIndex, int32_t count
#define YPA_get_blinkSeqSize_D          ((ypaHandle)-777471876)     // e.g. ColorLed: int32_t* resPtr
#define YPA_get_blinkSeqStateAtPowerOn_xDdd ((ypaHandle)2139383686)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t seqIndex, int32_t count
#define YPA_get_blinkSeqStateSpeed_xDdd ((ypaHandle)1215396793)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t seqIndex, int32_t count
#define YPA_get_blinkSeqState_xDdd      ((ypaHandle)-1046839097)    // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t seqIndex, int32_t count
#define YPA_get_blinking_D              ((ypaHandle)-1325924355)    // e.g. Led: int32_t* resPtr
#define YPA_get_brakingForce_F          ((ypaHandle)-1141916721)    // e.g. Motor: double* resPtr
#define YPA_get_brightness_D            ((ypaHandle)-386005521)     // e.g. Display: int32_t* resPtr
#define YPA_get_calibratedValue_D       ((ypaHandle)634835529)      // e.g. AnButton: int32_t* resPtr
#define YPA_get_calibrationMax_D        ((ypaHandle)1520747451)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_calibrationMin_D        ((ypaHandle)-2017774442)    // e.g. AnButton: int32_t* resPtr
#define YPA_get_calibrationState_D      ((ypaHandle)1336012176)     // e.g. RefFrame: int32_t* resPtr
#define YPA_get_callbackCredentials_S   ((ypaHandle)-1102651335)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_callbackEncoding_D      ((ypaHandle)495202488)      // e.g. Network: int32_t* resPtr
#define YPA_get_callbackInitialDelay_D  ((ypaHandle)-1640292899)    // e.g. Network: int32_t* resPtr
#define YPA_get_callbackMaxDelay_D      ((ypaHandle)1894137215)     // e.g. Network: int32_t* resPtr
#define YPA_get_callbackMethod_D        ((ypaHandle)-2133847885)    // e.g. Network: int32_t* resPtr
#define YPA_get_callbackMinDelay_D      ((ypaHandle)1911203787)     // e.g. Network: int32_t* resPtr
#define YPA_get_callbackSchedule_S      ((ypaHandle)-1339062535)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_callbackTemplate_D      ((ypaHandle)866259103)      // e.g. Network: int32_t* resPtr
#define YPA_get_callbackUrl_S           ((ypaHandle)-1139488800)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_captureTypeAtStartup_D  ((ypaHandle)813022526)      // e.g. InputCapture: int32_t* resPtr
#define YPA_get_captureType_D           ((ypaHandle)-1563263740)    // e.g. InputCapture: int32_t* resPtr
#define YPA_get_capturetype_D           ((ypaHandle)-1518438350)    // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_capturetype_F           ((ypaHandle)1265637662)     // e.g. InputCaptureData: double* resPtr
#define YPA_get_cellCount_D             ((ypaHandle)-2009351674)    // e.g. MultiCellWeighScale: int32_t* resPtr
#define YPA_get_cellId_D                ((ypaHandle)362542073)      // e.g. CellRecord: int32_t* resPtr
#define YPA_get_cellIdentifier_S        ((ypaHandle)-1891073777)    // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_cellOperator_S          ((ypaHandle)-345966488)     // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_cellType_D              ((ypaHandle)174582765)      // e.g. Cellular: int32_t* resPtr
#define YPA_get_chainDiags_D            ((ypaHandle)-1109019444)    // e.g. InputChain: int32_t* resPtr
#define YPA_get_channel_D               ((ypaHandle)-1801753993)    // e.g. Wireless: int32_t* resPtr
#define YPA_get_childCount_D            ((ypaHandle)-1950607263)    // e.g. DaisyChain: int32_t* resPtr
#define YPA_get_communicationProfiles_xS ((ypaHandle)1599782398)     // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_compTempAvg_F           ((ypaHandle)855390688)      // e.g. WeighScale: double* resPtr
#define YPA_get_compTempChg_F           ((ypaHandle)-117814740)     // e.g. WeighScale: double* resPtr
#define YPA_get_compensation_F          ((ypaHandle)-1922871604)    // e.g. WeighScale: double* resPtr
#define YPA_get_condAlign_D             ((ypaHandle)-1163367980)    // e.g. InputCapture: int32_t* resPtr
#define YPA_get_condValueAtStartup_F    ((ypaHandle)1403699324)     // e.g. InputCapture: double* resPtr
#define YPA_get_condValue_F             ((ypaHandle)1961117411)     // e.g. InputCapture: double* resPtr
#define YPA_get_connectionUrl_S         ((ypaHandle)-1677070421)    // e.g. Hub: char* resPtr, size_t* resSize
#define YPA_get_constellation_D         ((ypaHandle)-2019076300)    // e.g. Gps: int32_t* resPtr
#define YPA_get_coordSystem_D           ((ypaHandle)-569955526)     // e.g. Gps: int32_t* resPtr
#define YPA_get_cosPhi_F                ((ypaHandle)-639470758)     // e.g. Power: double* resPtr
#define YPA_get_countdown_Q             ((ypaHandle)-1586370564)    // e.g. Watchdog: int64_t* resPtr
#define YPA_get_crc_D                   ((ypaHandle)-1168585497)    // e.g. FileRecord: int32_t* resPtr
#define YPA_get_currentAtStartUp_F      ((ypaHandle)-1411646992)    // e.g. PowerSupply: double* resPtr
#define YPA_get_currentDNS_S            ((ypaHandle)-589221023)     // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_currentJob_S            ((ypaHandle)1593232124)     // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_get_currentLimitAtStartUp_F ((ypaHandle)674174672)      // e.g. PowerSupply: double* resPtr
#define YPA_get_currentLimit_F          ((ypaHandle)-10036538)      // e.g. PowerSupply: double* resPtr
#define YPA_get_currentRawValue_F       ((ypaHandle)1057921848)     // e.g. Sensor: double* resPtr
#define YPA_get_currentScript_S         ((ypaHandle)-2121681579)    // e.g. MicroPython: char* resPtr, size_t* resSize
#define YPA_get_currentTemperature_F    ((ypaHandle)2058614777)     // e.g. RangeFinder: double* resPtr
#define YPA_get_currentValue_F          ((ypaHandle)-355429381)     // e.g. Sensor: double* resPtr
#define YPA_get_currentVoltage_F        ((ypaHandle)1506404409)     // e.g. VoltageOutput: double* resPtr
#define YPA_get_current_F               ((ypaHandle)233648074)      // e.g. CurrentLoopOutput: double* resPtr
#define YPA_get_cutOffVoltage_F         ((ypaHandle)-231994049)     // e.g. Motor: double* resPtr
#define YPA_get_daisyState_D            ((ypaHandle)-1455339687)    // e.g. DaisyChain: int32_t* resPtr
#define YPA_get_dataLogger_H            ((ypaHandle)-1447954056)    // e.g. Sensor: int32_t* resHdlPtr
#define YPA_get_dataReceived_D          ((ypaHandle)-1110236170)    // e.g. Cellular: int32_t* resPtr
#define YPA_get_dataSent_D              ((ypaHandle)1860782358)     // e.g. Cellular: int32_t* resPtr
#define YPA_get_dateTime_S              ((ypaHandle)-825142318)     // e.g. RealTimeClock: char* resPtr, size_t* resSize
#define YPA_get_debouncePeriod_D        ((ypaHandle)-1371967077)    // e.g. PwmInput: int32_t* resPtr
#define YPA_get_debugMode_D             ((ypaHandle)598294949)      // e.g. MicroPython: int32_t* resPtr
#define YPA_get_decoding_D              ((ypaHandle)-676619192)     // e.g. QuadratureDecoder: int32_t* resPtr
#define YPA_get_defaultPage_S           ((ypaHandle)1994900688)     // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_deliveredEnergyMeter_F  ((ypaHandle)559481782)      // e.g. Power: double* resPtr
#define YPA_get_description_S           ((ypaHandle)282193973)      // e.g. ArithmeticSensor: char* resPtr, size_t* resSize
#define YPA_get_detectedNodes_D         ((ypaHandle)1077687294)     // e.g. InputChain: int32_t* resPtr
#define YPA_get_detectedWlans_xW        ((ypaHandle)2075795762)     // e.g. Wireless: YWlanRecordStruct* resPtr, size_t* resSize
#define YPA_get_detectionHysteresis_D   ((ypaHandle)703291101)      // e.g. Proximity: int32_t* resPtr
#define YPA_get_detectionThreshold_D    ((ypaHandle)-1458419129)    // e.g. Proximity: int32_t* resPtr
#define YPA_get_diags_D                 ((ypaHandle)1282096104)     // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_dilution_F              ((ypaHandle)1906606381)     // e.g. Gps: double* resPtr
#define YPA_get_direction_D             ((ypaHandle)1790983495)     // e.g. SnoopingRecord: int32_t* resPtr
#define YPA_get_direction_F             ((ypaHandle)-2066850709)    // e.g. Gps: double* resPtr
#define YPA_get_disableHostSync_D       ((ypaHandle)-1416702946)    // e.g. RealTimeClock: int32_t* resPtr
#define YPA_get_discoverable_D          ((ypaHandle)-1567888708)    // e.g. Network: int32_t* resPtr
#define YPA_get_displayHeight_D         ((ypaHandle)-1640661886)    // e.g. Display: int32_t* resPtr
#define YPA_get_displayLayer_Hd         ((ypaHandle)-1569211084)    // e.g. Display: int32_t* resHdlPtr, int32_t layerId
#define YPA_get_displayType_D           ((ypaHandle)462290817)      // e.g. Display: int32_t* resPtr
#define YPA_get_displayWidth_D          ((ypaHandle)-16878212)      // e.g. Display: int32_t* resPtr
#define YPA_get_display_H               ((ypaHandle)322175147)      // e.g. DisplayLayer: int32_t* resHdlPtr
#define YPA_get_displayedText_S         ((ypaHandle)1272944122)     // e.g. SegmentedDisplay: char* resPtr, size_t* resSize
#define YPA_get_drivingForce_F          ((ypaHandle)541265739)      // e.g. Motor: double* resPtr
#define YPA_get_dutyCycleAtPowerOn_F    ((ypaHandle)-1827887971)    // e.g. PwmOutput: double* resPtr
#define YPA_get_dutyCycle_F             ((ypaHandle)-970911217)     // e.g. PwmOutput: double* resPtr
#define YPA_get_dynamicLedCount_D       ((ypaHandle)-1963099763)    // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_edgePerCycle_D          ((ypaHandle)960098279)      // e.g. QuadratureDecoder: int32_t* resPtr
#define YPA_get_edgesPerCycle_D         ((ypaHandle)1548374183)     // e.g. QuadratureDecoder: int32_t* resPtr
#define YPA_get_edgesPerPeriod_D        ((ypaHandle)1472768428)     // e.g. PwmInput: int32_t* resPtr
#define YPA_get_enableData_D            ((ypaHandle)-169088672)     // e.g. Cellular: int32_t* resPtr
#define YPA_get_enabledAtPowerOn_D      ((ypaHandle)-2086316212)    // e.g. Servo: int32_t* resPtr
#define YPA_get_enabled_D               ((ypaHandle)587192537)      // e.g. Voltage: int32_t* resPtr
#define YPA_get_errCode_D               ((ypaHandle)1844698111)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_errCount_D              ((ypaHandle)-1720504838)    // e.g. SpiPort: int32_t* resPtr
#define YPA_get_errorBlock_D            ((ypaHandle)-1687382767)    // e.g. RfidStatus: int32_t* resPtr
#define YPA_get_errorCode_D             ((ypaHandle)1761786239)     // e.g. RfidStatus: int32_t* resPtr
#define YPA_get_errorMessage_S          ((ypaHandle)2027571326)     // e.g. Hub: char* resPtr, size_t* resSize
#define YPA_get_errorType_D             ((ypaHandle)1191848374)     // e.g. Hub: int32_t* resPtr
#define YPA_get_estimatedHSL_D          ((ypaHandle)-1111546429)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_estimatedOkLab_S        ((ypaHandle)619819217)      // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_estimatedRGB_D          ((ypaHandle)1107969826)     // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_estimatedXYZ_S          ((ypaHandle)697960480)      // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_estimationModel_D       ((ypaHandle)218938719)      // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_excitation_D            ((ypaHandle)-698909622)     // e.g. WeighScale: int32_t* resPtr
#define YPA_get_expectedNodes_D         ((ypaHandle)-399061321)     // e.g. InputChain: int32_t* resPtr
#define YPA_get_extVoltage_D            ((ypaHandle)1530538410)     // e.g. DualPower: int32_t* resPtr
#define YPA_get_externalSense_D         ((ypaHandle)2039084538)     // e.g. MultiCellWeighScale: int32_t* resPtr
#define YPA_get_failSafeTimeout_D       ((ypaHandle)-274932807)     // e.g. Motor: int32_t* resPtr
#define YPA_get_filesCount_D            ((ypaHandle)-295307876)     // e.g. Files: int32_t* resPtr
#define YPA_get_firmwareRelease_S       ((ypaHandle)1884340311)     // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_firstAffectedBlock_D    ((ypaHandle)-2028742983)    // e.g. RfidStatus: int32_t* resPtr
#define YPA_get_freeSpace_D             ((ypaHandle)1614949885)     // e.g. Files: int32_t* resPtr
#define YPA_get_frequency_F             ((ypaHandle)514269515)      // e.g. PwmOutput: double* resPtr
#define YPA_get_functionIds_xSs         ((ypaHandle)1148522145)     // e.g. Module: char* resPtr, size_t* resSize, char* funType
#define YPA_get_fusionMode_D            ((ypaHandle)-317983516)     // e.g. RefFrame: int32_t* resPtr
#define YPA_get_gainAtPowerOn_D         ((ypaHandle)-2049325737)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_gain_D                  ((ypaHandle)-1030468082)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_globalState_D           ((ypaHandle)1619671536)     // e.g. MultiAxisController: int32_t* resPtr
#define YPA_get_gpsRefreshRate_F        ((ypaHandle)2087568270)     // e.g. Gps: double* resPtr
#define YPA_get_groundSpeed_F           ((ypaHandle)636851920)      // e.g. Gps: double* resPtr
#define YPA_get_hardwareCalibrationTemperature_F ((ypaHandle)97189777)       // e.g. RangeFinder: double* resPtr
#define YPA_get_hardwareId_S            ((ypaHandle)844854119)      // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_heading_F               ((ypaHandle)-1423304767)    // e.g. Gyro: double* resPtr
#define YPA_get_heapUsage_D             ((ypaHandle)-187227414)     // e.g. MicroPython: int32_t* resPtr
#define YPA_get_highestValue_F          ((ypaHandle)238556338)      // e.g. Sensor: double* resPtr
#define YPA_get_hours_D                 ((ypaHandle)-1355471762)    // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_hslColor_D              ((ypaHandle)-1022984396)    // e.g. ColorLed: int32_t* resPtr
#define YPA_get_httpPort_D              ((ypaHandle)-2050966540)    // e.g. Network: int32_t* resPtr
#define YPA_get_httpsPort_D             ((ypaHandle)850027703)      // e.g. Network: int32_t* resPtr
#define YPA_get_i2cMode_S               ((ypaHandle)-634742325)     // e.g. I2cPort: char* resPtr, size_t* resSize
#define YPA_get_i2cVoltageLevel_D       ((ypaHandle)746157149)      // e.g. I2cPort: int32_t* resPtr
#define YPA_get_icon2d_S                ((ypaHandle)607279519)      // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_immediateCapture_Cd     ((ypaHandle)-1913116172)    // e.g. InputCapture: YInputCaptureDataStruct* resPtr, int32_t msDuration
#define YPA_get_imsi_S                  ((ypaHandle)-2074679610)    // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_inputType_D             ((ypaHandle)-790631864)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_inputVoltage_F          ((ypaHandle)-1879749387)    // e.g. PowerSupply: double* resPtr
#define YPA_get_integrationTimeAtPowerOn_D ((ypaHandle)1696442699)     // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_integrationTime_D       ((ypaHandle)201947573)      // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_invertedOutput_D        ((ypaHandle)1141697669)     // e.g. PwmOutput: int32_t* resPtr
#define YPA_get_ipAddress_S             ((ypaHandle)-99267654)      // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_ipConfig_S              ((ypaHandle)12286809)       // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_isFixed_D               ((ypaHandle)-691484252)     // e.g. Gps: int32_t* resPtr
#define YPA_get_isPresent_D             ((ypaHandle)1502173750)     // e.g. Proximity: int32_t* resPtr
#define YPA_get_isPressed_D             ((ypaHandle)2098076773)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_jobMaxSize_D            ((ypaHandle)-1527312014)    // e.g. SpiPort: int32_t* resPtr
#define YPA_get_jobMaxTask_D            ((ypaHandle)-32241525)      // e.g. SpiPort: int32_t* resPtr
#define YPA_get_knownUrls_Dxs           ((ypaHandle)572306945)      // e.g. Hub: int32_t* resPtr, char** knownUrlsPtr, size_t knownUrlsSize
#define YPA_get_knownUrls_xS            ((ypaHandle)-830125988)     // e.g. Hub: char* resPtr, size_t* resSize
#define YPA_get_lastAddressDetected_D   ((ypaHandle)-1943903437)    // e.g. MultiSensController: int32_t* resPtr
#define YPA_get_lastAffectedBlock_D     ((ypaHandle)-584826278)     // e.g. RfidStatus: int32_t* resPtr
#define YPA_get_lastCaptureTime_Q       ((ypaHandle)-1286078231)    // e.g. InputCapture: int64_t* resPtr
#define YPA_get_lastCapture_C           ((ypaHandle)1887979478)     // e.g. InputCapture: YInputCaptureDataStruct* resPtr
#define YPA_get_lastEvents_S            ((ypaHandle)1709506988)     // e.g. InputChain: char* resPtr, size_t* resSize
#define YPA_get_lastLogs_S              ((ypaHandle)28952501)       // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_lastMsg_S               ((ypaHandle)2062820646)     // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_get_lastTimeApproached_Q    ((ypaHandle)-97771528)      // e.g. Proximity: int64_t* resPtr
#define YPA_get_lastTimePressed_Q       ((ypaHandle)-305690090)     // e.g. AnButton: int64_t* resPtr
#define YPA_get_lastTimeReleased_Q      ((ypaHandle)1123889222)     // e.g. AnButton: int64_t* resPtr
#define YPA_get_lastTimeRemoved_Q       ((ypaHandle)978622805)      // e.g. Proximity: int64_t* resPtr
#define YPA_get_lastTrigger_D           ((ypaHandle)1845132316)     // e.g. Watchdog: int32_t* resPtr
#define YPA_get_latitude_S              ((ypaHandle)-988657299)     // e.g. Gps: char* resPtr, size_t* resSize
#define YPA_get_layerCount_D            ((ypaHandle)-1279478134)    // e.g. Display: int32_t* resPtr
#define YPA_get_layerHeight_D           ((ypaHandle)-1449994823)    // e.g. Display: int32_t* resPtr
#define YPA_get_layerWidth_D            ((ypaHandle)-2123579753)    // e.g. Display: int32_t* resPtr
#define YPA_get_ldoTemperature_F        ((ypaHandle)454228482)      // e.g. PowerSupply: double* resPtr
#define YPA_get_ledCalibration_D        ((ypaHandle)-1127226659)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_ledCurrentAtPowerOn_D   ((ypaHandle)910167995)      // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_ledCurrent_D            ((ypaHandle)-72936127)      // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_ledType_D               ((ypaHandle)-1658295125)    // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_linkQuality_D           ((ypaHandle)-1702114621)    // e.g. Wireless: int32_t* resPtr
#define YPA_get_linkState_D             ((ypaHandle)-1675383111)    // e.g. BluetoothLink: int32_t* resPtr
#define YPA_get_linkedSeqArray_xDdd     ((ypaHandle)-346457201)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t ledIndex, int32_t count
#define YPA_get_list_xUs                ((ypaHandle)-1961363202)    // e.g. Files: YFileRecordStruct* resPtr, size_t* resSize, char* pattern
#define YPA_get_locationAreaCode_D      ((ypaHandle)1149938661)     // e.g. CellRecord: int32_t* resPtr
#define YPA_get_lockState_xBsddOP       ((ypaHandle)-567253107)     // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_get_lockedOperator_S        ((ypaHandle)1393348448)     // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_logFrequency_S          ((ypaHandle)591711072)      // e.g. Sensor: char* resPtr, size_t* resSize
#define YPA_get_logicalName_S           ((ypaHandle)1376067556)     // e.g. Function: char* resPtr, size_t* resSize
#define YPA_get_longitude_S             ((ypaHandle)-1943285065)    // e.g. Gps: char* resPtr, size_t* resSize
#define YPA_get_loopPower_D             ((ypaHandle)-519903192)     // e.g. CurrentLoopOutput: int32_t* resPtr
#define YPA_get_loopbackTest_D          ((ypaHandle)-179398158)     // e.g. InputChain: int32_t* resPtr
#define YPA_get_lowestValue_F           ((ypaHandle)-2074258358)    // e.g. Sensor: double* resPtr
#define YPA_get_luminosity_D            ((ypaHandle)-1600964606)    // e.g. Led: int32_t* resPtr
#define YPA_get_macAddress_S            ((ypaHandle)-1946051310)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_magneticHeading_F       ((ypaHandle)307985188)      // e.g. Compass: double* resPtr
#define YPA_get_maintenanceMode_D       ((ypaHandle)-1026204954)    // e.g. MultiSensController: int32_t* resPtr
#define YPA_get_maxAccel_F              ((ypaHandle)-1427199769)    // e.g. StepperMotor: double* resPtr
#define YPA_get_maxLedCount_D           ((ypaHandle)633722818)      // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_get_maxSensors_D            ((ypaHandle)52493196)       // e.g. MultiSensController: int32_t* resPtr
#define YPA_get_maxSpeed_F              ((ypaHandle)1589571885)     // e.g. StepperMotor: double* resPtr
#define YPA_get_maxTimeOnStateA_Q       ((ypaHandle)136334968)      // e.g. Watchdog: int64_t* resPtr
#define YPA_get_maxTimeOnStateB_Q       ((ypaHandle)174518305)      // e.g. Watchdog: int64_t* resPtr
#define YPA_get_measureCommand_Sd       ((ypaHandle)126727399)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize, int32_t measureIndex
#define YPA_get_measureCount_D          ((ypaHandle)-454959542)     // e.g. Sdi12Sensor: int32_t* resPtr
#define YPA_get_measureDescription_Sd   ((ypaHandle)2028800210)     // e.g. Sdi12Sensor: char* resPtr, size_t* resSize, int32_t measureIndex
#define YPA_get_measurePosition_Dd      ((ypaHandle)-86870606)      // e.g. Sdi12Sensor: int32_t* resPtr, int32_t measureIndex
#define YPA_get_measureQuality_D        ((ypaHandle)340932957)      // e.g. RefFrame: int32_t* resPtr
#define YPA_get_measureSymbol_Sd        ((ypaHandle)559403222)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize, int32_t measureIndex
#define YPA_get_measureType_D           ((ypaHandle)-694793543)     // e.g. LightSensor: int32_t* resPtr
#define YPA_get_measureUnit_Sd          ((ypaHandle)314879910)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize, int32_t measureIndex
#define YPA_get_measuredCurrent_F       ((ypaHandle)551755241)      // e.g. PowerSupply: double* resPtr
#define YPA_get_measuredVoltage_F       ((ypaHandle)1595610039)     // e.g. PowerSupply: double* resPtr
#define YPA_get_message_S               ((ypaHandle)739170692)      // e.g. Wireless: char* resPtr, size_t* resSize
#define YPA_get_messages_xH             ((ypaHandle)-1658398096)    // e.g. MessageBox: int32_t* resPtr, size_t* resSize
#define YPA_get_meterTimer_D            ((ypaHandle)-1711119238)    // e.g. Power: int32_t* resPtr
#define YPA_get_meter_F                 ((ypaHandle)1140090146)     // e.g. Power: double* resPtr
#define YPA_get_minFrequency_F          ((ypaHandle)-287691855)     // e.g. PwmInput: double* resPtr
#define YPA_get_minutesA_D              ((ypaHandle)-843790259)     // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_minutesB_D              ((ypaHandle)-806193644)     // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_minutes_Q               ((ypaHandle)1599978575)     // e.g. WakeUpSchedule: int64_t* resPtr
#define YPA_get_mobileCountryCode_D     ((ypaHandle)-1664440973)    // e.g. CellRecord: int32_t* resPtr
#define YPA_get_mobileNetworkCode_D     ((ypaHandle)-181401147)     // e.g. CellRecord: int32_t* resPtr
#define YPA_get_monthDays_D             ((ypaHandle)-1309158493)    // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_months_D                ((ypaHandle)-1193361821)    // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_motorState_D            ((ypaHandle)-1554976347)    // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_motorStatus_D           ((ypaHandle)-841724397)     // e.g. Motor: int32_t* resPtr
#define YPA_get_mountOrientation_D      ((ypaHandle)331967861)      // e.g. RefFrame: int32_t* resPtr
#define YPA_get_mountPosition_D         ((ypaHandle)-1970363789)    // e.g. RefFrame: int32_t* resPtr
#define YPA_get_mute_D                  ((ypaHandle)1481194633)     // e.g. BluetoothLink: int32_t* resPtr
#define YPA_get_nAxis_D                 ((ypaHandle)-1899273923)    // e.g. MultiAxisController: int32_t* resPtr
#define YPA_get_nSamples_D              ((ypaHandle)-728637219)     // e.g. InputCapture: int32_t* resPtr
#define YPA_get_nSensors_D              ((ypaHandle)1841927138)     // e.g. MultiSensController: int32_t* resPtr
#define YPA_get_nTags_D                 ((ypaHandle)1358917845)     // e.g. RfidReader: int32_t* resPtr
#define YPA_get_name_S                  ((ypaHandle)-444603721)     // e.g. FileRecord: char* resPtr, size_t* resSize
#define YPA_get_nearHTMLColor_S         ((ypaHandle)-1278596900)    // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_nearRAL1_S              ((ypaHandle)1190053623)     // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_nearRAL2_S              ((ypaHandle)1151891630)     // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_nearRAL3_S              ((ypaHandle)1164579481)     // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_nearSimpleColorIndex_D  ((ypaHandle)-1408172873)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_nearSimpleColor_D       ((ypaHandle)-614375066)     // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_nearSimpleColor_S       ((ypaHandle)1488118945)     // e.g. SpectralSensor: char* resPtr, size_t* resSize
#define YPA_get_networkTimeout_D        ((ypaHandle)1507646231)     // e.g. Hub: int32_t* resPtr
#define YPA_get_neutral_D               ((ypaHandle)-444601339)     // e.g. Servo: int32_t* resPtr
#define YPA_get_nextOccurence_Q         ((ypaHandle)1950222634)     // e.g. WakeUpSchedule: int64_t* resPtr
#define YPA_get_nextWakeUp_Q            ((ypaHandle)-467876833)     // e.g. WakeUpMonitor: int64_t* resPtr
#define YPA_get_noSignalFor_D           ((ypaHandle)1187454913)     // e.g. AudioOut: int32_t* resPtr
#define YPA_get_ntpServer_S             ((ypaHandle)-1727990748)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_obey_S                  ((ypaHandle)-1190446791)    // e.g. MessageBox: char* resPtr, size_t* resSize
#define YPA_get_orientation_D           ((ypaHandle)569319631)      // e.g. Display: int32_t* resPtr
#define YPA_get_outputVoltage_D         ((ypaHandle)723885981)      // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_output_D                ((ypaHandle)-911973276)     // e.g. Watchdog: int32_t* resPtr
#define YPA_get_overCurrentLimit_D      ((ypaHandle)702063410)      // e.g. Motor: int32_t* resPtr
#define YPA_get_overcurrent_D           ((ypaHandle)1022770595)     // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_ownAddress_S            ((ypaHandle)-746092875)     // e.g. BluetoothLink: char* resPtr, size_t* resSize
#define YPA_get_pairingPin_S            ((ypaHandle)819819591)      // e.g. BluetoothLink: char* resPtr, size_t* resSize
#define YPA_get_parentHub_S             ((ypaHandle)1327720150)     // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_pduReceived_D           ((ypaHandle)1086857769)     // e.g. MessageBox: int32_t* resPtr
#define YPA_get_pduSent_D               ((ypaHandle)-806819334)     // e.g. MessageBox: int32_t* resPtr
#define YPA_get_period_F                ((ypaHandle)2110044260)     // e.g. PwmOutput: double* resPtr
#define YPA_get_persistentSettings_D    ((ypaHandle)-1370941034)    // e.g. Module: int32_t* resPtr
#define YPA_get_pin_S                   ((ypaHandle)-1861490753)    // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_pingInterval_D          ((ypaHandle)1431397493)     // e.g. Cellular: int32_t* resPtr
#define YPA_get_pitch_F                 ((ypaHandle)115679533)      // e.g. Gyro: double* resPtr
#define YPA_get_playSeqMaxSize_D        ((ypaHandle)-1457883673)    // e.g. Buzzer: int32_t* resPtr
#define YPA_get_playSeqSignature_D      ((ypaHandle)-1137764101)    // e.g. Buzzer: int32_t* resPtr
#define YPA_get_playSeqSize_D           ((ypaHandle)-1452664099)    // e.g. Buzzer: int32_t* resPtr
#define YPA_get_poeCurrent_D            ((ypaHandle)-2587002)       // e.g. Network: int32_t* resPtr
#define YPA_get_portDiags_D             ((ypaHandle)-1651994970)    // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_portDirection_D         ((ypaHandle)1444506847)     // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_portOpenDrain_D         ((ypaHandle)-233799099)     // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_portPolarity_D          ((ypaHandle)-1007038570)    // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_portSize_D              ((ypaHandle)2089348470)     // e.g. DigitalIO: int32_t* resPtr
#define YPA_get_portState_D             ((ypaHandle)-625075696)     // e.g. HubPort: int32_t* resPtr
#define YPA_get_pos_D                   ((ypaHandle)592252295)      // e.g. I2cSnoopingRecord: int32_t* resPtr
#define YPA_get_positionAtPowerOn_D     ((ypaHandle)-915671155)     // e.g. Servo: int32_t* resPtr
#define YPA_get_position_D              ((ypaHandle)-955224796)     // e.g. Servo: int32_t* resPtr
#define YPA_get_powerControl_D          ((ypaHandle)1058308694)     // e.g. DualPower: int32_t* resPtr
#define YPA_get_powerDuration_D         ((ypaHandle)595014578)      // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_get_powerFactor_D           ((ypaHandle)-1037267298)    // e.g. Power: int32_t* resPtr
#define YPA_get_powerFactor_F           ((ypaHandle)740487090)      // e.g. Power: double* resPtr
#define YPA_get_powerMode_D             ((ypaHandle)-2052136103)    // e.g. PwmPowerSource: int32_t* resPtr
#define YPA_get_powerOutputAtStartUp_D  ((ypaHandle)1990658881)     // e.g. PowerSupply: int32_t* resPtr
#define YPA_get_powerOutput_D           ((ypaHandle)-1635224894)    // e.g. PowerSupply: int32_t* resPtr
#define YPA_get_powerState_D            ((ypaHandle)1342057514)     // e.g. DualPower: int32_t* resPtr
#define YPA_get_power_D                 ((ypaHandle)1304993974)     // e.g. Led: int32_t* resPtr
#define YPA_get_preAmplifier_D          ((ypaHandle)-1337737274)    // e.g. BluetoothLink: int32_t* resPtr
#define YPA_get_presenceMinTime_D       ((ypaHandle)-1203886537)    // e.g. Proximity: int32_t* resPtr
#define YPA_get_primaryDNS_S            ((ypaHandle)-1161755185)    // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_productId_D             ((ypaHandle)820504697)      // e.g. Module: int32_t* resPtr
#define YPA_get_productName_S           ((ypaHandle)1761372173)     // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_productRelease_D        ((ypaHandle)986891674)      // e.g. Module: int32_t* resPtr
#define YPA_get_progressMessage_S       ((ypaHandle)194914835)      // e.g. FirmwareUpdate: char* resPtr, size_t* resSize
#define YPA_get_progress_D              ((ypaHandle)-64208605)      // e.g. FirmwareUpdate: int32_t* resPtr
#define YPA_get_protocol_S              ((ypaHandle)343190072)      // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_get_proximityReportMode_D   ((ypaHandle)-895025918)     // e.g. Proximity: int32_t* resPtr
#define YPA_get_pullinSpeed_F           ((ypaHandle)803300095)      // e.g. StepperMotor: double* resPtr
#define YPA_get_pulseCounter_Q          ((ypaHandle)335219165)      // e.g. PwmInput: int64_t* resPtr
#define YPA_get_pulseDuration_F         ((ypaHandle)1322923076)     // e.g. PwmOutput: double* resPtr
#define YPA_get_pulseTimer_Q            ((ypaHandle)1447258781)     // e.g. Watchdog: int64_t* resPtr
#define YPA_get_pwmReportMode_D         ((ypaHandle)97078582)       // e.g. PwmInput: int32_t* resPtr
#define YPA_get_qnh_F                   ((ypaHandle)1491889903)     // e.g. Altitude: double* resPtr
#define YPA_get_quality_D               ((ypaHandle)-55375872)      // e.g. RangeFinder: int32_t* resPtr
#define YPA_get_quaternionW_F           ((ypaHandle)-1773423687)    // e.g. Gyro: double* resPtr
#define YPA_get_quaternionX_F           ((ypaHandle)-1659374460)    // e.g. Gyro: double* resPtr
#define YPA_get_quaternionY_F           ((ypaHandle)-1663721805)    // e.g. Gyro: double* resPtr
#define YPA_get_quaternionZ_F           ((ypaHandle)-1634524950)    // e.g. Gyro: double* resPtr
#define YPA_get_radioConfig_S           ((ypaHandle)970069548)      // e.g. Cellular: char* resPtr, size_t* resSize
#define YPA_get_rangeFinderMode_D       ((ypaHandle)157751572)      // e.g. RangeFinder: int32_t* resPtr
#define YPA_get_range_D                 ((ypaHandle)1053644898)     // e.g. Servo: int32_t* resPtr
#define YPA_get_rawCount_D              ((ypaHandle)-2119383109)    // e.g. SpectralChannel: int32_t* resPtr
#define YPA_get_rawValue_D              ((ypaHandle)2035087752)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_readiness_D             ((ypaHandle)-1566251299)    // e.g. Network: int32_t* resPtr
#define YPA_get_rebootCountdown_D       ((ypaHandle)152939681)      // e.g. Module: int32_t* resPtr
#define YPA_get_receivedEnergyMeter_F   ((ypaHandle)1842528545)     // e.g. Power: double* resPtr
#define YPA_get_recordCount_D           ((ypaHandle)1420315574)     // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_recordedData_Hff        ((ypaHandle)-86168835)      // e.g. Sensor: int32_t* resHdlPtr, double startTime, double endTime
#define YPA_get_recordsCount_D          ((ypaHandle)465733229)      // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_refreshRate_D           ((ypaHandle)-1961964339)    // e.g. InputChain: int32_t* resPtr
#define YPA_get_registeredUrl_S         ((ypaHandle)1545208206)     // e.g. Hub: char* resPtr, size_t* resSize
#define YPA_get_relHum_F                ((ypaHandle)-890677710)     // e.g. Humidity: double* resPtr
#define YPA_get_remoteAddress_S         ((ypaHandle)1895368578)     // e.g. BluetoothLink: char* resPtr, size_t* resSize
#define YPA_get_remoteName_S            ((ypaHandle)-499691144)     // e.g. BluetoothLink: char* resPtr, size_t* resSize
#define YPA_get_removalMinTime_D        ((ypaHandle)-2082171092)    // e.g. Proximity: int32_t* resPtr
#define YPA_get_reportFrequency_S       ((ypaHandle)-1459322260)    // e.g. Sensor: char* resPtr, size_t* resSize
#define YPA_get_requiredChildCount_D    ((ypaHandle)-273398591)     // e.g. DaisyChain: int32_t* resPtr
#define YPA_get_resolution_F            ((ypaHandle)1304492792)     // e.g. Sensor: double* resPtr
#define YPA_get_rgbColorArrayAtPowerOn_xDdd ((ypaHandle)2013897467)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t ledIndex, int32_t count
#define YPA_get_rgbColorArray_xDdd      ((ypaHandle)-581633643)     // e.g. ColorLedCluster: int32_t* resPtr, size_t* resSize, int32_t ledIndex, int32_t count
#define YPA_get_rgbColorAtPowerOn_D     ((ypaHandle)-825082946)     // e.g. ColorLed: int32_t* resPtr
#define YPA_get_rgbColorBuffer_Sdd      ((ypaHandle)110961959)      // e.g. ColorLedCluster: char* resPtr, size_t* resSize, int32_t ledIndex, int32_t count
#define YPA_get_rgbColor_D              ((ypaHandle)388788058)      // e.g. ColorLed: int32_t* resPtr
#define YPA_get_roll_F                  ((ypaHandle)-185915849)     // e.g. Gyro: double* resPtr
#define YPA_get_router_S                ((ypaHandle)70211729)       // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_running_D               ((ypaHandle)1470291110)     // e.g. Watchdog: int32_t* resPtr
#define YPA_get_rxCount_D               ((ypaHandle)316744996)      // e.g. SpiPort: int32_t* resPtr
#define YPA_get_rxMsgCount_D            ((ypaHandle)163009744)      // e.g. SpiPort: int32_t* resPtr
#define YPA_get_safeLevel_F             ((ypaHandle)-1643220296)    // e.g. Threshold: double* resPtr
#define YPA_get_samplingRate_D          ((ypaHandle)-1981031830)    // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_satCount_Q              ((ypaHandle)-1925427315)    // e.g. Gps: int64_t* resPtr
#define YPA_get_satPerConst_Q           ((ypaHandle)1055292319)     // e.g. Gps: int64_t* resPtr
#define YPA_get_saturation_D            ((ypaHandle)-1457460117)    // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_secondaryDNS_S          ((ypaHandle)-587688735)     // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_secondsBefore_D         ((ypaHandle)-119158058)     // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_securityMode_D          ((ypaHandle)794881339)      // e.g. Network: int32_t* resPtr
#define YPA_get_security_D              ((ypaHandle)769924446)      // e.g. Wireless: int32_t* resPtr
#define YPA_get_security_S              ((ypaHandle)-1372088167)    // e.g. WlanRecord: char* resPtr, size_t* resSize
#define YPA_get_sensitivity_D           ((ypaHandle)-261212033)     // e.g. AnButton: int32_t* resPtr
#define YPA_get_sensorAddress_D         ((ypaHandle)-1230222336)    // e.g. MultiSensController: int32_t* resPtr
#define YPA_get_sensorAddress_S         ((ypaHandle)897567175)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_sensorModel_S           ((ypaHandle)-751102279)     // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_sensorProtocol_S        ((ypaHandle)1567979358)     // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_sensorSerial_S          ((ypaHandle)935486261)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_sensorState_D           ((ypaHandle)562823856)      // e.g. Sensor: int32_t* resPtr
#define YPA_get_sensorType_D            ((ypaHandle)-2004586633)    // e.g. Temperature: int32_t* resPtr
#define YPA_get_sensorVendor_S          ((ypaHandle)96571977)       // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_sensorVersion_S         ((ypaHandle)904374709)      // e.g. Sdi12Sensor: char* resPtr, size_t* resSize
#define YPA_get_serialMode_S            ((ypaHandle)960644897)      // e.g. SerialPort: char* resPtr, size_t* resSize
#define YPA_get_serialNumber_S          ((ypaHandle)-1800874479)    // e.g. Function: char* resPtr, size_t* resSize
#define YPA_get_serie1Unit_S            ((ypaHandle)-1033799312)    // e.g. InputCaptureData: char* resPtr, size_t* resSize
#define YPA_get_serie1Values_xF         ((ypaHandle)1110147413)     // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie1_xF               ((ypaHandle)-919295400)     // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie1unit_D            ((ypaHandle)1176435073)     // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_serie2Unit_S            ((ypaHandle)-209099795)     // e.g. InputCaptureData: char* resPtr, size_t* resSize
#define YPA_get_serie2Values_xF         ((ypaHandle)-1457767850)    // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie2_xF               ((ypaHandle)-612301386)     // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie2unit_D            ((ypaHandle)2012668700)     // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_serie3Unit_S            ((ypaHandle)1442736217)     // e.g. InputCaptureData: char* resPtr, size_t* resSize
#define YPA_get_serie3Values_xF         ((ypaHandle)1188974952)     // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie3_xF               ((ypaHandle)1664967379)     // e.g. InputCaptureData: double* resPtr, size_t* resSize
#define YPA_get_serie3unit_D            ((ypaHandle)-780015448)     // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_serieCount_D            ((ypaHandle)356747092)      // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_shiftSampling_D         ((ypaHandle)-1903583009)    // e.g. SpiPort: int32_t* resPtr
#define YPA_get_shutdownCountdown_D     ((ypaHandle)1163616040)     // e.g. OsControl: int32_t* resPtr
#define YPA_get_signalBias_F            ((ypaHandle)-1442808083)    // e.g. GenericSensor: double* resPtr
#define YPA_get_signalRange_S           ((ypaHandle)-1708396132)    // e.g. GenericSensor: char* resPtr, size_t* resSize
#define YPA_get_signalSampling_D        ((ypaHandle)1665292824)     // e.g. GenericSensor: int32_t* resPtr
#define YPA_get_signalStrength_D        ((ypaHandle)-748150172)     // e.g. CellRecord: int32_t* resPtr
#define YPA_get_signalUnit_S            ((ypaHandle)-1412085153)    // e.g. Temperature: char* resPtr, size_t* resSize
#define YPA_get_signalValue_F           ((ypaHandle)-2090205936)    // e.g. Temperature: double* resPtr
#define YPA_get_signal_D                ((ypaHandle)-720183956)     // e.g. AudioOut: int32_t* resPtr
#define YPA_get_size_D                  ((ypaHandle)609899218)      // e.g. FileRecord: int32_t* resPtr
#define YPA_get_sleepCountdown_D        ((ypaHandle)1816871795)     // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_get_slotsCount_D            ((ypaHandle)1527066115)     // e.g. MessageBox: int32_t* resPtr
#define YPA_get_slotsInUse_D            ((ypaHandle)1249889257)     // e.g. MessageBox: int32_t* resPtr
#define YPA_get_specialBlocks_xBsddOP   ((ypaHandle)-330824310)     // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_get_speed_F                 ((ypaHandle)1646620777)     // e.g. StepperMotor: double* resPtr
#define YPA_get_spiMode_S               ((ypaHandle)739036154)      // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_get_ssPolarity_D            ((ypaHandle)33251147)       // e.g. SpiPort: int32_t* resPtr
#define YPA_get_ssid_S                  ((ypaHandle)-826815888)     // e.g. Wireless: char* resPtr, size_t* resSize
#define YPA_get_starterTime_D           ((ypaHandle)-504906609)     // e.g. Motor: int32_t* resPtr
#define YPA_get_startupJob_S            ((ypaHandle)295729596)      // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_get_startupScript_S         ((ypaHandle)-1124912800)    // e.g. MicroPython: char* resPtr, size_t* resSize
#define YPA_get_startupSeq_S            ((ypaHandle)227373314)      // e.g. Display: char* resPtr, size_t* resSize
#define YPA_get_stateAtPowerOn_D        ((ypaHandle)-678218502)     // e.g. Watchdog: int32_t* resPtr
#define YPA_get_state_D                 ((ypaHandle)190689118)      // e.g. Watchdog: int32_t* resPtr
#define YPA_get_stepPos_F               ((ypaHandle)1443113080)     // e.g. StepperMotor: double* resPtr
#define YPA_get_stepping_D              ((ypaHandle)1725756870)     // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_subDevices_xS           ((ypaHandle)-1229430516)    // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_subnetMask_S            ((ypaHandle)2086686677)     // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_tCurrRun_D              ((ypaHandle)914661419)      // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_tCurrStop_D             ((ypaHandle)-610385709)     // e.g. StepperMotor: int32_t* resPtr
#define YPA_get_tagBlockSize_D          ((ypaHandle)1113293678)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagFirstBlock_D         ((ypaHandle)922371706)      // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagIdList_xS            ((ypaHandle)-1557816636)    // e.g. RfidReader: char* resPtr, size_t* resSize
#define YPA_get_tagId_S                 ((ypaHandle)-1829685036)    // e.g. RfidTagInfo: char* resPtr, size_t* resSize
#define YPA_get_tagInfo_NsP             ((ypaHandle)-731119811)     // e.g. RfidReader: YRfidTagInfoStruct* resPtr, char* tagId, YRfidStatusStruct* statusPtr
#define YPA_get_tagLastBlock_D          ((ypaHandle)-559963385)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagLockState_xBsddOP    ((ypaHandle)-440398469)     // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_get_tagMemorySize_D         ((ypaHandle)-523528613)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagSpecialBlocks_xBsddOP ((ypaHandle)-1347286370)    // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_get_tagTize_D               ((ypaHandle)818933571)      // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagTypeName_Dd          ((ypaHandle)-488597011)     // e.g. RfidReader: int32_t* resPtr, int32_t tagType
#define YPA_get_tagTypeStr_S            ((ypaHandle)713317527)      // e.g. RfidTagInfo: char* resPtr, size_t* resSize
#define YPA_get_tagType_D               ((ypaHandle)1066571941)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_tagUsableSize_D         ((ypaHandle)-1902063189)    // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_targetSensor_S          ((ypaHandle)1234233758)     // e.g. Threshold: char* resPtr, size_t* resSize
#define YPA_get_technology_S            ((ypaHandle)-1317242013)    // e.g. Altitude: char* resPtr, size_t* resSize
#define YPA_get_tempAvgAdaptRatio_F     ((ypaHandle)-693964036)     // e.g. WeighScale: double* resPtr
#define YPA_get_tempChgAdaptRatio_F     ((ypaHandle)-754111871)     // e.g. WeighScale: double* resPtr
#define YPA_get_textData_S              ((ypaHandle)992737424)      // e.g. Sms: char* resPtr, size_t* resSize
#define YPA_get_thresholdState_D        ((ypaHandle)-215121489)     // e.g. Threshold: int32_t* resPtr
#define YPA_get_timeFrame_Q             ((ypaHandle)123865418)      // e.g. RangeFinder: int64_t* resPtr
#define YPA_get_timeSet_D               ((ypaHandle)1987268889)     // e.g. RealTimeClock: int32_t* resPtr
#define YPA_get_time_D                  ((ypaHandle)-191820468)     // e.g. SnoopingRecord: int32_t* resPtr
#define YPA_get_timingAdvance_D         ((ypaHandle)383085206)      // e.g. CellRecord: int32_t* resPtr
#define YPA_get_triggerDelay_Q          ((ypaHandle)1417459193)     // e.g. Watchdog: int64_t* resPtr
#define YPA_get_triggerDuration_Q       ((ypaHandle)-1582727134)    // e.g. Watchdog: int64_t* resPtr
#define YPA_get_triggerPosition_D       ((ypaHandle)614122317)      // e.g. InputCaptureData: int32_t* resPtr
#define YPA_get_triggerRealTimeUTC_F    ((ypaHandle)1486252230)     // e.g. InputCaptureData: double* resPtr
#define YPA_get_triggerValue_F          ((ypaHandle)1983407379)     // e.g. InputCaptureData: double* resPtr
#define YPA_get_txCount_D               ((ypaHandle)1643863214)     // e.g. SpiPort: int32_t* resPtr
#define YPA_get_txMsgCount_D            ((ypaHandle)-427101904)     // e.g. SpiPort: int32_t* resPtr
#define YPA_get_typeStr_D               ((ypaHandle)-521547404)     // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_typeStr_S               ((ypaHandle)1664767155)     // e.g. RfidTagInfo: char* resPtr, size_t* resSize
#define YPA_get_type_D                  ((ypaHandle)906106252)      // e.g. RfidTagInfo: int32_t* resPtr
#define YPA_get_unit_S                  ((ypaHandle)-1665607378)    // e.g. Sensor: char* resPtr, size_t* resSize
#define YPA_get_unixTime_Q              ((ypaHandle)-692204019)     // e.g. RealTimeClock: int64_t* resPtr
#define YPA_get_upTime_Q                ((ypaHandle)-114310087)     // e.g. Module: int64_t* resPtr
#define YPA_get_url_S                   ((ypaHandle)-579376065)     // e.g. Module: char* resPtr, size_t* resSize
#define YPA_get_usbCurrent_D            ((ypaHandle)558611683)      // e.g. Module: int32_t* resPtr
#define YPA_get_userPassword_S          ((ypaHandle)151096115)      // e.g. Network: char* resPtr, size_t* resSize
#define YPA_get_userVar_D               ((ypaHandle)-499093400)     // e.g. Module: int32_t* resPtr
#define YPA_get_utcOffset_D             ((ypaHandle)1285538158)     // e.g. RealTimeClock: int32_t* resPtr
#define YPA_get_vInt_F                  ((ypaHandle)-1714977594)    // e.g. PowerSupply: double* resPtr
#define YPA_get_valueRange_S            ((ypaHandle)1090965611)     // e.g. GenericSensor: char* resPtr, size_t* resSize
#define YPA_get_voltageAtStartUp_F      ((ypaHandle)-1457210740)    // e.g. VoltageOutput: double* resPtr
#define YPA_get_voltageLevel_D          ((ypaHandle)1576391098)     // e.g. SpiPort: int32_t* resPtr
#define YPA_get_voltageLimitAtStartUp_F ((ypaHandle)285391522)      // e.g. PowerSupply: double* resPtr
#define YPA_get_voltageLimit_F          ((ypaHandle)-1947559154)    // e.g. PowerSupply: double* resPtr
#define YPA_get_voltageSense_D          ((ypaHandle)-430910958)     // e.g. PowerSupply: int32_t* resPtr
#define YPA_get_voltageSetPoint_F       ((ypaHandle)-1699147063)    // e.g. PowerSupply: double* resPtr
#define YPA_get_voltage_D               ((ypaHandle)-1675935560)    // e.g. PowerOutput: int32_t* resPtr
#define YPA_get_volumeRange_S           ((ypaHandle)1831727627)     // e.g. AudioOut: char* resPtr, size_t* resSize
#define YPA_get_volume_D                ((ypaHandle)-959302571)     // e.g. Buzzer: int32_t* resPtr
#define YPA_get_wakeUpReason_D          ((ypaHandle)1646271557)     // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_get_wakeUpState_D           ((ypaHandle)1089356677)     // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_get_watchdogPeriod_D        ((ypaHandle)-1414386645)    // e.g. InputChain: int32_t* resPtr
#define YPA_get_weekDays_D              ((ypaHandle)-936402614)     // e.g. WakeUpSchedule: int32_t* resPtr
#define YPA_get_wlanState_D             ((ypaHandle)1619322823)     // e.g. Wireless: int32_t* resPtr
#define YPA_get_workingMode_D           ((ypaHandle)1407808611)     // e.g. SpectralSensor: int32_t* resPtr
#define YPA_get_wwwWatchdogDelay_D      ((ypaHandle)-644019196)     // e.g. Network: int32_t* resPtr
#define YPA_get_xValue_F                ((ypaHandle)1148075671)     // e.g. Magnetometer: double* resPtr
#define YPA_get_xheapUsage_D            ((ypaHandle)1612887296)     // e.g. MicroPython: int32_t* resPtr
#define YPA_get_yValue_F                ((ypaHandle)-2000404983)    // e.g. Magnetometer: double* resPtr
#define YPA_get_zValue_F                ((ypaHandle)105593322)      // e.g. Magnetometer: double* resPtr
#define YPA_get_zeroTracking_F          ((ypaHandle)494091006)      // e.g. WeighScale: double* resPtr
#define YPA_hasFunction_Bs              ((ypaHandle)-1858963821)    // e.g. Module: int32_t* resPtr, char* funcId
#define YPA_hide_D                      ((ypaHandle)2005767205)     // e.g. DisplayLayer: int32_t* resPtr
#define YPA_hslArrayOfs_move_Ddxdd      ((ypaHandle)488316825)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t* hslListPtr, size_t hslListSize, int32_t delay
#define YPA_hslArray_move_Dxdd          ((ypaHandle)773711785)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t* hslListPtr, size_t hslListSize, int32_t delay
#define YPA_hslMove_dd                  ((ypaHandle)-445989103)     // e.g. ColorLed: int32_t hsl_target, int32_t ms_duration
#define YPA_hsl_move_Ddddd              ((ypaHandle)1527940856)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t hslValue, int32_t delay
#define YPA_i2cSendAndReceiveArray_xDdxdd ((ypaHandle)-544170875)     // e.g. I2cPort: int32_t* resPtr, size_t* resSize, int32_t slaveAddr, int32_t* valuesPtr, size_t valuesSize, int32_t rcvCount
#define YPA_i2cSendAndReceiveBin_Sdsd   ((ypaHandle)112074765)      // e.g. I2cPort: char* resPtr, size_t* resSize, int32_t slaveAddr, char* buff, int32_t rcvCount
#define YPA_i2cSendArray_Ddxd           ((ypaHandle)-1678174056)    // e.g. I2cPort: int32_t* resPtr, int32_t slaveAddr, int32_t* valuesPtr, size_t valuesSize
#define YPA_i2cSendBin_Dds              ((ypaHandle)726018167)      // e.g. I2cPort: int32_t* resPtr, int32_t slaveAddr, char* buff
#define YPA_isInUse_B                   ((ypaHandle)-1242575737)    // e.g. Hub: int32_t* resPtr
#define YPA_isOnline_B                  ((ypaHandle)-144544284)     // e.g. Hub: int32_t* resPtr
#define YPA_isReadOnly_B                ((ypaHandle)913241503)      // e.g. Function: int32_t* resPtr
#define YPA_isSensorReady_B             ((ypaHandle)31962697)       // e.g. Sensor: int32_t* resPtr
#define YPA_isValid_B                   ((ypaHandle)1199084878)     // e.g. Sdi12SensorInfo: int32_t* resPtr
#define YPA_isValid_S                   ((ypaHandle)768128444)      // e.g. Sdi12SensorInfo: char* resPtr, size_t* resSize
#define YPA_joinNetwork_Dss             ((ypaHandle)613514785)      // e.g. Wireless: int32_t* resPtr, char* ssid, char* securityKey
#define YPA_keepALive_D                 ((ypaHandle)-687429216)     // e.g. Motor: int32_t* resPtr
#define YPA_lineTo_Ddd                  ((ypaHandle)-407834165)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y
#define YPA_linkLedToBlinkSeqAtPowerOn_Ddddd ((ypaHandle)-1402551910)    // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t seqIndex, int32_t offset
#define YPA_linkLedToBlinkSeq_Ddddd     ((ypaHandle)1140262926)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t seqIndex, int32_t offset
#define YPA_linkLedToPeriodicBlinkSeq_Ddddd ((ypaHandle)1703773461)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t seqIndex, int32_t periods
#define YPA_loadAttribute_Ss            ((ypaHandle)-930208480)     // e.g. Function: char* resPtr, size_t* resSize, char* attrName
#define YPA_loadExpression_S            ((ypaHandle)-845603074)     // e.g. ArithmeticSensor: char* resPtr, size_t* resSize
#define YPA_lockBlocks_DsddOP           ((ypaHandle)-441080766)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_lockBlocks_DsddP            ((ypaHandle)-495439282)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidStatusStruct* statusPtr
#define YPA_lock_blocks_Dsdd            ((ypaHandle)-1710123305)    // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t nBlocks
#define YPA_log_Ds                      ((ypaHandle)1235124910)     // e.g. Module: int32_t* resPtr, char* text
#define YPA_modbusReadBits_xDddd        ((ypaHandle)2063452108)     // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t pduAddr, int32_t nBits
#define YPA_modbusReadInputBits_xDddd   ((ypaHandle)1036353830)     // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t pduAddr, int32_t nBits
#define YPA_modbusReadInputRegisters_xDddd ((ypaHandle)232467359)      // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t pduAddr, int32_t nWords
#define YPA_modbusReadRegisters_xDddd   ((ypaHandle)1149279978)     // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t pduAddr, int32_t nWords
#define YPA_modbusWriteAndReadRegisters_xDddxddd ((ypaHandle)-1609629652)    // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t pduWriteAddr, int32_t* valuesPtr, size_t valuesSize, int32_t pduReadAddr, int32_t nReadWords
#define YPA_modbusWriteBit_Dddd         ((ypaHandle)-1157259743)    // e.g. SerialPort: int32_t* resPtr, int32_t slaveNo, int32_t pduAddr, int32_t value
#define YPA_modbusWriteBits_Dddxd       ((ypaHandle)-687482287)     // e.g. SerialPort: int32_t* resPtr, int32_t slaveNo, int32_t pduAddr, int32_t* bitsPtr, size_t bitsSize
#define YPA_modbusWriteRegister_Dddd    ((ypaHandle)1789190180)     // e.g. SerialPort: int32_t* resPtr, int32_t slaveNo, int32_t pduAddr, int32_t value
#define YPA_modbusWriteRegisters_Dddxd  ((ypaHandle)500147086)      // e.g. SerialPort: int32_t* resPtr, int32_t slaveNo, int32_t pduAddr, int32_t* valuesPtr, size_t valuesSize
#define YPA_more3DCalibration_D         ((ypaHandle)-35257492)      // e.g. RefFrame: int32_t* resPtr
#define YPA_moveRelSlow_Dff             ((ypaHandle)-496693321)     // e.g. StepperMotor: int32_t* resPtr, double relPos, double maxSpeed
#define YPA_moveRel_Df                  ((ypaHandle)-1044878323)    // e.g. StepperMotor: int32_t* resPtr, double relPos
#define YPA_moveRel_Dxf                 ((ypaHandle)-589115154)     // e.g. MultiAxisController: int32_t* resPtr, double* relPosPtr, size_t relPosSize
#define YPA_moveTo_Ddd                  ((ypaHandle)-734606879)     // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y
#define YPA_moveTo_Df                   ((ypaHandle)1822233101)     // e.g. StepperMotor: int32_t* resPtr, double absPos
#define YPA_moveTo_Dxf                  ((ypaHandle)-598739568)     // e.g. MultiAxisController: int32_t* resPtr, double* absPosPtr, size_t absPosSize
#define YPA_move_dd                     ((ypaHandle)-664059931)     // e.g. Servo: int32_t target, int32_t ms_duration
#define YPA_muteValueCallbacks_D        ((ypaHandle)-3312338)       // e.g. Function: int32_t* resPtr
#define YPA_newMessage_Hs               ((ypaHandle)1818764463)     // e.g. MessageBox: int32_t* resHdlPtr, char* recipient
#define YPA_newSequence_D               ((ypaHandle)1406310871)     // e.g. Display: int32_t* resPtr
#define YPA_nextHubInUse_H              ((ypaHandle)757590763)      // e.g. Hub: int32_t* resHdlPtr
#define YPA_oncePlaySeq_D               ((ypaHandle)-2021895561)    // e.g. Buzzer: int32_t* resPtr
#define YPA_pauseSequence_Dd            ((ypaHandle)1154600263)     // e.g. Display: int32_t* resPtr, int32_t delay_ms
#define YPA_pause_Dd                    ((ypaHandle)-1258533319)    // e.g. StepperMotor: int32_t* resPtr, int32_t waitMs
#define YPA_phaseMove_Dfd               ((ypaHandle)-549176031)     // e.g. PwmOutput: int32_t* resPtr, double target, int32_t ms_duration
#define YPA_ping_Ss                     ((ypaHandle)-512356147)     // e.g. Network: char* resPtr, size_t* resSize, char* host
#define YPA_playNotes_Ds                ((ypaHandle)-1534079259)    // e.g. Buzzer: int32_t* resPtr, char* notes
#define YPA_playSequence_Ds             ((ypaHandle)-885487796)     // e.g. Display: int32_t* resPtr, char* sequenceName
#define YPA_pulseDurationMove_Dfd       ((ypaHandle)-750559401)     // e.g. PwmOutput: int32_t* resPtr, double ms_target, int32_t ms_duration
#define YPA_pulse_Ddd                   ((ypaHandle)-841230266)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t ms_duration
#define YPA_pulse_d                     ((ypaHandle)910420744)      // e.g. Watchdog: int32_t ms_duration
#define YPA_queryHex_Ssd                ((ypaHandle)1156404489)     // e.g. SpiPort: char* resPtr, size_t* resSize, char* hexString, int32_t maxWait
#define YPA_queryLine_Ssd               ((ypaHandle)-341227556)     // e.g. SpiPort: char* resPtr, size_t* resSize, char* query, int32_t maxWait
#define YPA_queryMODBUS_xDdxd           ((ypaHandle)-1992142193)    // e.g. SerialPort: int32_t* resPtr, size_t* resSize, int32_t slaveNo, int32_t* pduBytesPtr, size_t pduBytesSize
#define YPA_querySdi12_Sssd             ((ypaHandle)-128632125)     // e.g. Sdi12Port: char* resPtr, size_t* resSize, char* sensorAddr, char* cmd, int32_t maxWait
#define YPA_quickCellSurvey_xV          ((ypaHandle)-938711712)     // e.g. Cellular: YCellRecordStruct* resPtr, size_t* resSize
#define YPA_readArray_SsddP             ((ypaHandle)152898774)      // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidStatusStruct* statusPtr
#define YPA_readArray_xDd               ((ypaHandle)1346137617)     // e.g. SpiPort: int32_t* resPtr, size_t* resSize, int32_t nChars
#define YPA_readArray_xDsddOP           ((ypaHandle)-1495241789)    // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_readArray_xDsddP            ((ypaHandle)-564209370)     // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidStatusStruct* statusPtr
#define YPA_readBin_Sd                  ((ypaHandle)-711406117)     // e.g. SpiPort: char* resPtr, size_t* resSize, int32_t nChars
#define YPA_readBin_SsddOP              ((ypaHandle)865568986)      // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_readBin_SsddP               ((ypaHandle)385303278)      // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidStatusStruct* statusPtr
#define YPA_readByte_D                  ((ypaHandle)888922656)      // e.g. SpiPort: int32_t* resPtr
#define YPA_readConcurrentMeasurements_xFs ((ypaHandle)-1973324862)    // e.g. Sdi12Port: double* resPtr, size_t* resSize, char* sensorAddr
#define YPA_readHex_Sd                  ((ypaHandle)-998175745)     // e.g. SpiPort: char* resPtr, size_t* resSize, int32_t nBytes
#define YPA_readHex_SsddOP              ((ypaHandle)2018890667)     // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_readHex_SsddP               ((ypaHandle)-797412149)     // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidStatusStruct* statusPtr
#define YPA_readLine_S                  ((ypaHandle)-765057298)     // e.g. SpiPort: char* resPtr, size_t* resSize
#define YPA_readMessages_xSsd           ((ypaHandle)-1781240167)    // e.g. SpiPort: char* resPtr, size_t* resSize, char* pattern, int32_t maxWait
#define YPA_readSensor_xFssd            ((ypaHandle)-1770406624)    // e.g. Sdi12Port: double* resPtr, size_t* resSize, char* sensorAddr, char* measCmd, int32_t maxWait
#define YPA_readStr_Sd                  ((ypaHandle)-1616009231)    // e.g. SpiPort: char* resPtr, size_t* resSize, int32_t nChars
#define YPA_readStr_SsddOP              ((ypaHandle)-1923030194)    // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nChars, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_readStr_SsddP               ((ypaHandle)-359872868)     // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nChars, YRfidStatusStruct* statusPtr
#define YPA_read_avail_D                ((ypaHandle)1041368157)     // e.g. SpiPort: int32_t* resPtr
#define YPA_read_seek_Dd                ((ypaHandle)-1595070625)    // e.g. SpiPort: int32_t* resPtr, int32_t absPos
#define YPA_read_tell_D                 ((ypaHandle)-1913831915)    // e.g. SpiPort: int32_t* resPtr
#define YPA_reboot_Dd                   ((ypaHandle)63512827)       // e.g. Module: int32_t* resPtr, int32_t secBeforeReboot
#define YPA_reloadPlaySeq_D             ((ypaHandle)1757310773)     // e.g. Buzzer: int32_t* resPtr
#define YPA_remove_Ds                   ((ypaHandle)-217640740)     // e.g. Files: int32_t* resPtr, char* pathname
#define YPA_requestConcurrentMeasurements_Ds ((ypaHandle)94668784)       // e.g. Sdi12Port: int32_t* resPtr, char* sensorAddr
#define YPA_resetAll_D                  ((ypaHandle)1964805322)     // e.g. Display: int32_t* resPtr
#define YPA_resetBlinkSeq_D             ((ypaHandle)-1263599234)    // e.g. ColorLed: int32_t* resPtr
#define YPA_resetBlinkSeq_Dd            ((ypaHandle)802470390)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_resetCounter_D              ((ypaHandle)1034161823)     // e.g. PwmInput: int32_t* resPtr
#define YPA_resetPeriodDetection_D      ((ypaHandle)1144754658)     // e.g. PwmInput: int32_t* resPtr
#define YPA_resetPlaySeq_D              ((ypaHandle)-628903813)     // e.g. Buzzer: int32_t* resPtr
#define YPA_resetSleepCountDown_D       ((ypaHandle)-527920630)     // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_resetStatus_D               ((ypaHandle)-757324526)     // e.g. Motor: int32_t* resPtr
#define YPA_resetWatchdog_              ((ypaHandle)1464029032)     // e.g. Watchdog: 
#define YPA_resetWatchdog_D             ((ypaHandle)-527581151)     // e.g. InputChain: int32_t* resPtr
#define YPA_reset_D                     ((ypaHandle)323098917)      // e.g. StepperMotor: int32_t* resPtr
#define YPA_restoreZeroCalibration_D    ((ypaHandle)-1506560007)    // e.g. Tilt: int32_t* resPtr
#define YPA_revertFromFlash_D           ((ypaHandle)1616223927)     // e.g. Module: int32_t* resPtr
#define YPA_rgbArrayOfs_move_Ddxdd      ((ypaHandle)1662707560)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t* rgbListPtr, size_t rgbListSize, int32_t delay
#define YPA_rgbArray_move_Dxdd          ((ypaHandle)1457534503)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t* rgbListPtr, size_t rgbListSize, int32_t delay
#define YPA_rgbMove_dd                  ((ypaHandle)826322815)      // e.g. ColorLed: int32_t rgb_target, int32_t ms_duration
#define YPA_rgb_move_Ddddd              ((ypaHandle)1914208093)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t rgbValue, int32_t delay
#define YPA_save3DCalibration_D         ((ypaHandle)284957622)      // e.g. RefFrame: int32_t* resPtr
#define YPA_saveBlinkSeq_Dd             ((ypaHandle)860798917)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_saveLedsConfigAtPowerOn_D   ((ypaHandle)1233425158)     // e.g. ColorLedCluster: int32_t* resPtr
#define YPA_savePlaySeq_D               ((ypaHandle)83147438)       // e.g. Buzzer: int32_t* resPtr
#define YPA_saveSequence_Ds             ((ypaHandle)-1378247279)    // e.g. Display: int32_t* resPtr, char* sequenceName
#define YPA_saveToFlash_D               ((ypaHandle)871498529)      // e.g. Module: int32_t* resPtr
#define YPA_selectColorPen_Dd           ((ypaHandle)-1095032318)    // e.g. DisplayLayer: int32_t* resPtr, int32_t color
#define YPA_selectEraser_D              ((ypaHandle)-1084062661)    // e.g. DisplayLayer: int32_t* resPtr
#define YPA_selectFont_Ds               ((ypaHandle)-1097833423)    // e.g. DisplayLayer: int32_t* resPtr, char* fontname
#define YPA_selectGrayPen_Dd            ((ypaHandle)929213302)      // e.g. DisplayLayer: int32_t* resPtr, int32_t graylevel
#define YPA_selectJob_Ds                ((ypaHandle)-1936070288)    // e.g. SpiPort: int32_t* resPtr, char* jobfile
#define YPA_sendBreak_Dd                ((ypaHandle)2114631987)     // e.g. SerialPort: int32_t* resPtr, int32_t duration
#define YPA_sendFlashMessage_Dss        ((ypaHandle)130508145)      // e.g. MessageBox: int32_t* resPtr, char* recipient, char* message
#define YPA_sendPUK_Dss                 ((ypaHandle)-2099275859)    // e.g. Cellular: int32_t* resPtr, char* puk, char* newPin
#define YPA_sendTextMessage_Dss         ((ypaHandle)-1747837246)    // e.g. MessageBox: int32_t* resPtr, char* recipient, char* message
#define YPA_send_D                      ((ypaHandle)-1257045713)    // e.g. Sms: int32_t* resPtr
#define YPA_setAntialiasingMode_Db      ((ypaHandle)224682164)      // e.g. DisplayLayer: int32_t* resPtr, int32_t mode
#define YPA_setConsoleBackground_Dd     ((ypaHandle)-1476542037)    // e.g. DisplayLayer: int32_t* resPtr, int32_t bgcol
#define YPA_setConsoleMargins_Ddddd     ((ypaHandle)647879025)      // e.g. DisplayLayer: int32_t* resPtr, int32_t x1, int32_t y1, int32_t x2, int32_t y2
#define YPA_setConsoleWordWrap_Db       ((ypaHandle)1453409307)     // e.g. DisplayLayer: int32_t* resPtr, int32_t wordwrap
#define YPA_setLayerPosition_Dddd       ((ypaHandle)861752922)      // e.g. DisplayLayer: int32_t* resPtr, int32_t x, int32_t y, int32_t scrollTime
#define YPA_set_RTS_Dd                  ((ypaHandle)-104811964)     // e.g. SerialPort: int32_t* resPtr, int32_t val
#define YPA_set_SS_Dd                   ((ypaHandle)1307728097)     // e.g. SpiPort: int32_t* resPtr, int32_t val
#define YPA_set_abcPeriod_d             ((ypaHandle)-661657396)     // e.g. CarbonDioxide: int32_t newval
#define YPA_set_activeLedCount_d        ((ypaHandle)-1534377001)    // e.g. ColorLedCluster: int32_t newval
#define YPA_set_adminPassword_s         ((ypaHandle)-1186122142)    // e.g. Network: char* newval
#define YPA_set_advMode_d               ((ypaHandle)190716856)      // e.g. Sensor: int32_t newval
#define YPA_set_airplaneMode_d          ((ypaHandle)87278108)       // e.g. Cellular: int32_t newval
#define YPA_set_alertLevel_f            ((ypaHandle)-404041135)     // e.g. Threshold: double newval
#define YPA_set_allSettingsAndFiles_Ds  ((ypaHandle)1548877370)     // e.g. Module: int32_t* resPtr, char* settings
#define YPA_set_allSettings_Ds          ((ypaHandle)-1387417540)    // e.g. Module: int32_t* resPtr, char* settings
#define YPA_set_analogCalibration_d     ((ypaHandle)1746361738)     // e.g. AnButton: int32_t newval
#define YPA_set_apnAuth_Dss             ((ypaHandle)1156147632)     // e.g. Cellular: int32_t* resPtr, char* username, char* password
#define YPA_set_apn_s                   ((ypaHandle)735605293)      // e.g. Cellular: char* newval
#define YPA_set_autoStart_d             ((ypaHandle)444467378)      // e.g. Watchdog: int32_t newval
#define YPA_set_auxSignal_d             ((ypaHandle)1974512341)     // e.g. StepperMotor: int32_t newval
#define YPA_set_bandwidth_d             ((ypaHandle)-1253040662)    // e.g. Tilt: int32_t newval
#define YPA_set_beacon_d                ((ypaHandle)1531048983)     // e.g. Module: int32_t newval
#define YPA_set_bearing_f               ((ypaHandle)-1537503139)    // e.g. RefFrame: double newval
#define YPA_set_bitDirection_Ddd        ((ypaHandle)1996830699)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t bitdirection
#define YPA_set_bitOpenDrain_Ddd        ((ypaHandle)-1155973619)    // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t opendrain
#define YPA_set_bitPolarity_Ddd         ((ypaHandle)-1512195585)    // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t bitpolarity
#define YPA_set_bitState_Ddd            ((ypaHandle)-2045692564)    // e.g. DigitalIO: int32_t* resPtr, int32_t bitno, int32_t bitstate
#define YPA_set_blinkSeqSpeed_Ddd       ((ypaHandle)-1863262182)    // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex, int32_t speed
#define YPA_set_blinkSeqStateAtPowerOn_Ddd ((ypaHandle)-660945542)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex, int32_t autostart
#define YPA_set_blinking_d              ((ypaHandle)-192451518)     // e.g. Led: int32_t newval
#define YPA_set_brakingForce_f          ((ypaHandle)-1517678567)    // e.g. Motor: double newval
#define YPA_set_brightness_d            ((ypaHandle)-511289538)     // e.g. Display: int32_t newval
#define YPA_set_calibrationMax_d        ((ypaHandle)-807296241)     // e.g. AnButton: int32_t newval
#define YPA_set_calibrationMin_d        ((ypaHandle)318657570)      // e.g. AnButton: int32_t newval
#define YPA_set_callbackCredentials_s   ((ypaHandle)646098276)      // e.g. Network: char* newval
#define YPA_set_callbackEncoding_d      ((ypaHandle)-742602447)     // e.g. Network: int32_t newval
#define YPA_set_callbackInitialDelay_d  ((ypaHandle)630452403)      // e.g. Network: int32_t newval
#define YPA_set_callbackMaxDelay_d      ((ypaHandle)-1092696842)    // e.g. Network: int32_t newval
#define YPA_set_callbackMethod_d        ((ypaHandle)362115079)      // e.g. Network: int32_t newval
#define YPA_set_callbackMinDelay_d      ((ypaHandle)-1076732350)    // e.g. Network: int32_t newval
#define YPA_set_callbackSchedule_s      ((ypaHandle)2115469168)     // e.g. Network: char* newval
#define YPA_set_callbackTemplate_d      ((ypaHandle)-40179434)      // e.g. Network: int32_t newval
#define YPA_set_callbackUrl_s           ((ypaHandle)-484222566)     // e.g. Network: char* newval
#define YPA_set_captureTypeAtStartup_d  ((ypaHandle)-1948430256)    // e.g. InputCapture: int32_t newval
#define YPA_set_captureType_d           ((ypaHandle)-35265666)      // e.g. InputCapture: int32_t newval
#define YPA_set_cellCount_d             ((ypaHandle)2102092002)     // e.g. MultiCellWeighScale: int32_t newval
#define YPA_set_condAlign_d             ((ypaHandle)1339601712)     // e.g. InputCapture: int32_t newval
#define YPA_set_condValueAtStartup_f    ((ypaHandle)2125005270)     // e.g. InputCapture: double newval
#define YPA_set_condValue_f             ((ypaHandle)-2120967161)    // e.g. InputCapture: double newval
#define YPA_set_constellation_d         ((ypaHandle)1189298452)     // e.g. Gps: int32_t newval
#define YPA_set_coordSystem_d           ((ypaHandle)-2127514304)    // e.g. Gps: int32_t newval
#define YPA_set_currentAtStartUp_f      ((ypaHandle)1709375609)     // e.g. PowerSupply: double newval
#define YPA_set_currentJob_s            ((ypaHandle)1468962861)     // e.g. SpiPort: char* newval
#define YPA_set_currentLimitAtStartUp_f ((ypaHandle)745862664)      // e.g. PowerSupply: double newval
#define YPA_set_currentLimit_f          ((ypaHandle)-519868144)     // e.g. PowerSupply: double newval
#define YPA_set_currentScript_s         ((ypaHandle)1087218549)     // e.g. MicroPython: char* newval
#define YPA_set_currentValue_f          ((ypaHandle)-189450195)     // e.g. QuadratureDecoder: double newval
#define YPA_set_currentVoltage_f        ((ypaHandle)-863205235)     // e.g. VoltageOutput: double newval
#define YPA_set_current_f               ((ypaHandle)1111343950)     // e.g. CurrentLoopOutput: double newval
#define YPA_set_cutOffVoltage_f         ((ypaHandle)862460703)      // e.g. Motor: double newval
#define YPA_set_dataReceived_d          ((ypaHandle)-1548318688)    // e.g. Cellular: int32_t newval
#define YPA_set_dataSent_d              ((ypaHandle)714726057)      // e.g. Cellular: int32_t newval
#define YPA_set_debouncePeriod_d        ((ypaHandle)997986607)      // e.g. PwmInput: int32_t newval
#define YPA_set_debugMode_d             ((ypaHandle)-690382015)     // e.g. MicroPython: int32_t newval
#define YPA_set_decoding_d              ((ypaHandle)-1814360073)    // e.g. QuadratureDecoder: int32_t newval
#define YPA_set_defaultPage_s           ((ypaHandle)701520554)      // e.g. Network: char* newval
#define YPA_set_detectionHysteresis_d   ((ypaHandle)-1322314880)    // e.g. Proximity: int32_t newval
#define YPA_set_detectionThreshold_d    ((ypaHandle)-2079224851)    // e.g. Proximity: int32_t newval
#define YPA_set_disableHostSync_d       ((ypaHandle)-906108287)     // e.g. RealTimeClock: int32_t newval
#define YPA_set_discoverable_d          ((ypaHandle)-1125236374)    // e.g. Network: int32_t newval
#define YPA_set_displayedText_s         ((ypaHandle)-1969519654)    // e.g. SegmentedDisplay: char* newval
#define YPA_set_drivingForce_f          ((ypaHandle)1042719901)     // e.g. Motor: double newval
#define YPA_set_dutyCycleAtPowerOn_f    ((ypaHandle)-1106287305)    // e.g. PwmOutput: double newval
#define YPA_set_dutyCycle_f             ((ypaHandle)860997867)      // e.g. PwmOutput: double newval
#define YPA_set_edgePerCycle_d          ((ypaHandle)660358193)      // e.g. QuadratureDecoder: int32_t newval
#define YPA_set_edgesPerCycle_d         ((ypaHandle)-1660008825)    // e.g. QuadratureDecoder: int32_t newval
#define YPA_set_enableData_d            ((ypaHandle)-57427023)      // e.g. Cellular: int32_t newval
#define YPA_set_enabledAtPowerOn_d      ((ypaHandle)1302179525)     // e.g. Servo: int32_t newval
#define YPA_set_enabled_d               ((ypaHandle)1831810141)     // e.g. Voltage: int32_t newval
#define YPA_set_estimationModel_d       ((ypaHandle)1870629824)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_excitation_d            ((ypaHandle)-550556005)     // e.g. WeighScale: int32_t newval
#define YPA_set_expectedNodes_d         ((ypaHandle)695392407)      // e.g. InputChain: int32_t newval
#define YPA_set_externalSense_d         ((ypaHandle)-1194466342)    // e.g. MultiCellWeighScale: int32_t newval
#define YPA_set_failSafeTimeout_d       ((ypaHandle)-1913656026)    // e.g. Motor: int32_t newval
#define YPA_set_frequency_f             ((ypaHandle)-338166865)     // e.g. PwmOutput: double newval
#define YPA_set_fusionMode_d            ((ypaHandle)-462182859)     // e.g. RefFrame: int32_t newval
#define YPA_set_gainAtPowerOn_d         ((ypaHandle)1151193975)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_gain_d                  ((ypaHandle)-675328172)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_highestValue_f          ((ypaHandle)274579300)      // e.g. Sensor: double newval
#define YPA_set_hours_d                 ((ypaHandle)-1972063249)    // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_hslColorArray_Ddxd      ((ypaHandle)876129790)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t* hslListPtr, size_t hslListSize
#define YPA_set_hslColorAtPowerOn_Dddd  ((ypaHandle)-1632040113)    // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t hslValue
#define YPA_set_hslColorBuffer_Dds      ((ypaHandle)294395354)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, char* buff
#define YPA_set_hslColor_Dddd           ((ypaHandle)-47283651)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t hslValue
#define YPA_set_hslColor_d              ((ypaHandle)-2022249333)    // e.g. ColorLed: int32_t newval
#define YPA_set_httpPort_d              ((ypaHandle)-1045419957)    // e.g. Network: int32_t newval
#define YPA_set_httpsPort_d             ((ypaHandle)-941965741)     // e.g. Network: int32_t newval
#define YPA_set_i2cMode_s               ((ypaHandle)-1778748081)    // e.g. I2cPort: char* newval
#define YPA_set_i2cVoltageLevel_d       ((ypaHandle)1309295298)     // e.g. I2cPort: int32_t newval
#define YPA_set_inputType_d             ((ypaHandle)632238252)      // e.g. AnButton: int32_t newval
#define YPA_set_integrationTimeAtPowerOn_d ((ypaHandle)-551798367)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_integrationTime_d       ((ypaHandle)1853509418)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_invertedOutput_d        ((ypaHandle)-783709135)     // e.g. PwmOutput: int32_t newval
#define YPA_set_key_Dds                 ((ypaHandle)334137628)      // e.g. RfidOptions: int32_t* resPtr, int32_t keyType, char* key
#define YPA_set_ledCalibration_d        ((ypaHandle)696943209)      // e.g. SpectralSensor: int32_t newval
#define YPA_set_ledCurrentAtPowerOn_d   ((ypaHandle)-1367063834)    // e.g. SpectralSensor: int32_t newval
#define YPA_set_ledCurrent_d            ((ypaHandle)-220248176)     // e.g. SpectralSensor: int32_t newval
#define YPA_set_ledType_d               ((ypaHandle)-755466193)     // e.g. ColorLedCluster: int32_t newval
#define YPA_set_lockedOperator_s        ((ypaHandle)-968249388)     // e.g. Cellular: char* newval
#define YPA_set_logFrequency_s          ((ypaHandle)1025597622)     // e.g. Sensor: char* newval
#define YPA_set_logicalName_s           ((ypaHandle)221413790)      // e.g. Function: char* newval
#define YPA_set_loopbackTest_d          ((ypaHandle)-349490652)     // e.g. InputChain: int32_t newval
#define YPA_set_lowestValue_f           ((ypaHandle)-613758416)     // e.g. Sensor: double newval
#define YPA_set_luminosity_d            ((ypaHandle)-1444189485)    // e.g. Led: int32_t newval
#define YPA_set_maintenanceMode_d       ((ypaHandle)-1599705991)    // e.g. MultiSensController: int32_t newval
#define YPA_set_maxAccel_f              ((ypaHandle)-291620008)     // e.g. StepperMotor: double newval
#define YPA_set_maxSpeed_f              ((ypaHandle)449733266)      // e.g. StepperMotor: double newval
#define YPA_set_maxTimeOnStateA_q       ((ypaHandle)1783855335)     // e.g. Watchdog: int64_t newval
#define YPA_set_maxTimeOnStateB_q       ((ypaHandle)1746257598)     // e.g. Watchdog: int64_t newval
#define YPA_set_measureType_d           ((ypaHandle)-1985882941)    // e.g. LightSensor: int32_t newval
#define YPA_set_minFrequency_f          ((ypaHandle)-255885209)     // e.g. PwmInput: double newval
#define YPA_set_minutesA_d              ((ypaHandle)-1983620110)    // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_minutesB_d              ((ypaHandle)-1954355797)    // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_minutes_Dq              ((ypaHandle)1536686841)     // e.g. WakeUpSchedule: int32_t* resPtr, int64_t bitmap
#define YPA_set_monthDays_d             ((ypaHandle)1149700423)     // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_months_d                ((ypaHandle)-1934735320)    // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_mountPosition_Ddd       ((ypaHandle)1866493237)     // e.g. RefFrame: int32_t* resPtr, int32_t position, int32_t orientation
#define YPA_set_mute_d                  ((ypaHandle)1298283987)     // e.g. BluetoothLink: int32_t newval
#define YPA_set_nAxis_d                 ((ypaHandle)-1416956228)    // e.g. MultiAxisController: int32_t newval
#define YPA_set_nSamples_d              ((ypaHandle)-1864273054)    // e.g. InputCapture: int32_t newval
#define YPA_set_nSensors_d              ((ypaHandle)699990109)      // e.g. MultiSensController: int32_t newval
#define YPA_set_networkTimeout_Dd       ((ypaHandle)1112147335)     // e.g. Hub: int32_t* resPtr, int32_t networkMsTimeout
#define YPA_set_neutral_d               ((ypaHandle)-1431371647)    // e.g. Servo: int32_t newval
#define YPA_set_nextWakeUp_q            ((ypaHandle)-312174898)     // e.g. WakeUpMonitor: int64_t newval
#define YPA_set_ntcParameters_Dff       ((ypaHandle)1783917392)     // e.g. Temperature: int32_t* resPtr, double res25, double beta
#define YPA_set_ntpServer_s             ((ypaHandle)1819291328)     // e.g. Network: char* newval
#define YPA_set_obey_s                  ((ypaHandle)-1407174557)    // e.g. MessageBox: char* newval
#define YPA_set_offsetAvgCompensationTable_Dxfxf ((ypaHandle)-1100997934)    // e.g. WeighScale: int32_t* resPtr, double* tempValuesPtr, size_t tempValuesSize, double* compValuesPtr, size_t compValuesSize
#define YPA_set_offsetChgCompensationTable_Dxfxf ((ypaHandle)-1259501118)    // e.g. WeighScale: int32_t* resPtr, double* tempValuesPtr, size_t tempValuesSize, double* compValuesPtr, size_t compValuesSize
#define YPA_set_orientation_d           ((ypaHandle)2128133813)     // e.g. Display: int32_t newval
#define YPA_set_outputVoltage_d         ((ypaHandle)-362706499)     // e.g. DigitalIO: int32_t newval
#define YPA_set_output_d                ((ypaHandle)-36400593)      // e.g. Watchdog: int32_t newval
#define YPA_set_overCurrentLimit_d      ((ypaHandle)-404727109)     // e.g. Motor: int32_t newval
#define YPA_set_overcurrent_d           ((ypaHandle)1673634777)     // e.g. StepperMotor: int32_t newval
#define YPA_set_pairingPin_s            ((ypaHandle)967124630)      // e.g. BluetoothLink: char* newval
#define YPA_set_pduReceived_d           ((ypaHandle)536853587)      // e.g. MessageBox: int32_t newval
#define YPA_set_pduSent_d               ((ypaHandle)-2143812226)    // e.g. MessageBox: int32_t newval
#define YPA_set_period_f                ((ypaHandle)1236553263)     // e.g. PwmOutput: double newval
#define YPA_set_periodicCallbackSchedule_Dsd ((ypaHandle)-607134974)     // e.g. Network: int32_t* resPtr, char* interval, int32_t offset
#define YPA_set_pin_s                   ((ypaHandle)1531565066)     // e.g. Cellular: char* newval
#define YPA_set_pingInterval_d          ((ypaHandle)1261752227)     // e.g. Cellular: int32_t newval
#define YPA_set_portDirection_d         ((ypaHandle)-1755481345)    // e.g. DigitalIO: int32_t newval
#define YPA_set_portOpenDrain_d         ((ypaHandle)861181029)      // e.g. DigitalIO: int32_t newval
#define YPA_set_portPolarity_d          ((ypaHandle)-576953280)     // e.g. DigitalIO: int32_t newval
#define YPA_set_portState_d             ((ypaHandle)802078964)      // e.g. DigitalIO: int32_t newval
#define YPA_set_positionAtPowerOn_d     ((ypaHandle)-215224166)     // e.g. Servo: int32_t newval
#define YPA_set_position_d              ((ypaHandle)-2090795365)    // e.g. Servo: int32_t newval
#define YPA_set_powerControl_d          ((ypaHandle)561064320)      // e.g. DualPower: int32_t newval
#define YPA_set_powerDuration_d         ((ypaHandle)-499964526)     // e.g. WakeUpMonitor: int32_t newval
#define YPA_set_powerMode_d             ((ypaHandle)1893611965)     // e.g. PwmPowerSource: int32_t newval
#define YPA_set_powerOutputAtStartUp_d  ((ypaHandle)-854596049)     // e.g. PowerSupply: int32_t newval
#define YPA_set_powerOutput_d           ((ypaHandle)-1044386632)    // e.g. PowerSupply: int32_t newval
#define YPA_set_power_d                 ((ypaHandle)1753823031)     // e.g. Led: int32_t newval
#define YPA_set_preAmplifier_d          ((ypaHandle)-1373236208)    // e.g. BluetoothLink: int32_t newval
#define YPA_set_presenceMinTime_d       ((ypaHandle)-632483672)     // e.g. Proximity: int32_t newval
#define YPA_set_primaryDNS_s            ((ypaHandle)-1279699170)    // e.g. Network: char* newval
#define YPA_set_protocol_s              ((ypaHandle)1342454151)     // e.g. SpiPort: char* newval
#define YPA_set_proximityReportMode_d   ((ypaHandle)1382199391)     // e.g. Proximity: int32_t newval
#define YPA_set_pullinSpeed_f           ((ypaHandle)1893137541)     // e.g. StepperMotor: double newval
#define YPA_set_pulseDuration_f         ((ypaHandle)-1885461916)    // e.g. PwmOutput: double newval
#define YPA_set_pwmReportMode_d         ((ypaHandle)-997369066)     // e.g. PwmInput: int32_t newval
#define YPA_set_qnh_f                   ((ypaHandle)-1834066598)    // e.g. Altitude: double newval
#define YPA_set_radioConfig_s           ((ypaHandle)1726318678)     // e.g. Cellular: char* newval
#define YPA_set_rangeFinderMode_d       ((ypaHandle)1796485003)     // e.g. RangeFinder: int32_t newval
#define YPA_set_range_d                 ((ypaHandle)462213091)      // e.g. Servo: int32_t newval
#define YPA_set_refreshRate_d           ((ypaHandle)-734440777)     // e.g. InputChain: int32_t newval
#define YPA_set_remoteAddress_s         ((ypaHandle)-1313009246)    // e.g. BluetoothLink: char* newval
#define YPA_set_removalMinTime_d        ((ypaHandle)379713432)      // e.g. Proximity: int32_t newval
#define YPA_set_reportFrequency_s       ((ypaHandle)-881347341)     // e.g. Sensor: char* newval
#define YPA_set_requiredChildCount_d    ((ypaHandle)-1028160149)    // e.g. DaisyChain: int32_t newval
#define YPA_set_resolution_f            ((ypaHandle)1152952361)     // e.g. Sensor: double newval
#define YPA_set_rgbColorArray_Ddxd      ((ypaHandle)1288010864)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t* rgbListPtr, size_t rgbListSize
#define YPA_set_rgbColorAtPowerOn_Dddd  ((ypaHandle)-524749890)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t rgbValue
#define YPA_set_rgbColorAtPowerOn_d     ((ypaHandle)-191742807)     // e.g. ColorLed: int32_t newval
#define YPA_set_rgbColorBuffer_Dds      ((ypaHandle)1769065556)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, char* buff
#define YPA_set_rgbColor_Dddd           ((ypaHandle)773766980)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count, int32_t rgbValue
#define YPA_set_rgbColor_d              ((ypaHandle)1398602981)     // e.g. ColorLed: int32_t newval
#define YPA_set_running_d               ((ypaHandle)410136610)      // e.g. Watchdog: int32_t newval
#define YPA_set_safeLevel_f             ((ypaHandle)1803462748)     // e.g. Threshold: double newval
#define YPA_set_secondaryDNS_s          ((ypaHandle)-1029882057)    // e.g. Network: char* newval
#define YPA_set_secondsBefore_d         ((ypaHandle)966909174)      // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_securityMode_d          ((ypaHandle)822429421)      // e.g. Network: int32_t newval
#define YPA_set_sensitivity_d           ((ypaHandle)-1353079291)    // e.g. AnButton: int32_t newval
#define YPA_set_sensorType_d            ((ypaHandle)-2114175578)    // e.g. Temperature: int32_t newval
#define YPA_set_serialMode_s            ((ypaHandle)809113072)      // e.g. SerialPort: char* newval
#define YPA_set_shiftSampling_d         ((ypaHandle)1338881791)     // e.g. SpiPort: int32_t newval
#define YPA_set_signalBias_f            ((ypaHandle)-1552405444)    // e.g. GenericSensor: double newval
#define YPA_set_signalRange_s           ((ypaHandle)-987992090)     // e.g. GenericSensor: char* newval
#define YPA_set_signalSampling_d        ((ypaHandle)-167298388)     // e.g. GenericSensor: int32_t newval
#define YPA_set_sleepCountdown_d        ((ypaHandle)-116513849)     // e.g. WakeUpMonitor: int32_t newval
#define YPA_set_spanAvgCompensationTable_Dxfxf ((ypaHandle)-1314931078)    // e.g. WeighScale: int32_t* resPtr, double* tempValuesPtr, size_t tempValuesSize, double* compValuesPtr, size_t compValuesSize
#define YPA_set_spanChgCompensationTable_Dxfxf ((ypaHandle)-1156436630)    // e.g. WeighScale: int32_t* resPtr, double* tempValuesPtr, size_t tempValuesSize, double* compValuesPtr, size_t compValuesSize
#define YPA_set_spiMode_s               ((ypaHandle)1675372414)     // e.g. SpiPort: char* newval
#define YPA_set_ssPolarity_d            ((ypaHandle)142806426)      // e.g. SpiPort: int32_t newval
#define YPA_set_starterTime_d           ((ypaHandle)-1093655819)    // e.g. Motor: int32_t newval
#define YPA_set_startupJob_s            ((ypaHandle)416820077)      // e.g. SpiPort: char* newval
#define YPA_set_startupScript_s         ((ypaHandle)2109155136)     // e.g. MicroPython: char* newval
#define YPA_set_startupSeq_s            ((ypaHandle)83174355)       // e.g. Display: char* newval
#define YPA_set_stateAtPowerOn_d        ((ypaHandle)1121342542)     // e.g. Watchdog: int32_t newval
#define YPA_set_state_d                 ((ypaHandle)773601503)      // e.g. Watchdog: int32_t newval
#define YPA_set_stepPos_f               ((ypaHandle)433374460)      // e.g. StepperMotor: double newval
#define YPA_set_stepping_d              ((ypaHandle)581723769)      // e.g. StepperMotor: int32_t newval
#define YPA_set_tCurrRun_d              ((ypaHandle)1928606612)     // e.g. StepperMotor: int32_t newval
#define YPA_set_tCurrStop_d             ((ypaHandle)787388983)      // e.g. StepperMotor: int32_t newval
#define YPA_set_tempAvgAdaptRatio_f     ((ypaHandle)-320670229)     // e.g. WeighScale: double newval
#define YPA_set_tempChgAdaptRatio_f     ((ypaHandle)-380818026)     // e.g. WeighScale: double newval
#define YPA_set_thermistorResponseTable_Dxfxf ((ypaHandle)1743863036)     // e.g. Temperature: int32_t* resPtr, double* tempValuesPtr, size_t tempValuesSize, double* resValuesPtr, size_t resValuesSize
#define YPA_set_timeFrame_q             ((ypaHandle)-233647186)     // e.g. RangeFinder: int64_t newval
#define YPA_set_triggerDelay_q          ((ypaHandle)1243160111)     // e.g. Watchdog: int64_t newval
#define YPA_set_triggerDuration_q       ((ypaHandle)-1009076547)    // e.g. Watchdog: int64_t newval
#define YPA_set_unit_s                  ((ypaHandle)-1986799500)    // e.g. WeighScale: char* newval
#define YPA_set_unixTime_q              ((ypaHandle)-1832034894)    // e.g. RealTimeClock: int64_t newval
#define YPA_set_userPassword_s          ((ypaHandle)392437989)      // e.g. Network: char* newval
#define YPA_set_userVar_d               ((ypaHandle)-1383031572)    // e.g. Module: int32_t newval
#define YPA_set_utcOffset_d             ((ypaHandle)-1175512182)    // e.g. RealTimeClock: int32_t newval
#define YPA_set_valueRange_s            ((ypaHandle)1216250554)     // e.g. GenericSensor: char* newval
#define YPA_set_voltageAtStartUp_f      ((ypaHandle)1729905413)     // e.g. VoltageOutput: double newval
#define YPA_set_voltageLevel_d          ((ypaHandle)1133541996)     // e.g. SpiPort: int32_t newval
#define YPA_set_voltageLimitAtStartUp_f ((ypaHandle)358177402)      // e.g. PowerSupply: double newval
#define YPA_set_voltageLimit_f          ((ypaHandle)-1785777960)    // e.g. PowerSupply: double newval
#define YPA_set_voltageSense_d          ((ypaHandle)-130713148)     // e.g. PowerSupply: int32_t newval
#define YPA_set_voltageSetPoint_f       ((ypaHandle)-120970154)     // e.g. PowerSupply: double newval
#define YPA_set_voltage_d               ((ypaHandle)-741626820)     // e.g. PowerOutput: int32_t newval
#define YPA_set_volume_d                ((ypaHandle)-224214498)     // e.g. Buzzer: int32_t newval
#define YPA_set_watchdogPeriod_d        ((ypaHandle)1056394399)     // e.g. InputChain: int32_t newval
#define YPA_set_weekDays_d              ((ypaHandle)-1939918091)    // e.g. WakeUpSchedule: int32_t newval
#define YPA_set_workingMode_d           ((ypaHandle)215935513)      // e.g. SpectralSensor: int32_t newval
#define YPA_set_wwwWatchdogDelay_d      ((ypaHandle)396752269)      // e.g. Network: int32_t newval
#define YPA_set_zeroTracking_f          ((ypaHandle)51810600)       // e.g. WeighScale: double newval
#define YPA_setupAddress_Dd             ((ypaHandle)-1992262065)    // e.g. MultiSensController: int32_t* resPtr, int32_t addr
#define YPA_setupSpan_Dff               ((ypaHandle)-1218190639)    // e.g. WeighScale: int32_t* resPtr, double currWeight, double maxWeight
#define YPA_shutdown_Dd                 ((ypaHandle)-215746767)     // e.g. OsControl: int32_t* resPtr, int32_t secBeforeShutDown
#define YPA_sleepFor_Ddd                ((ypaHandle)226325682)      // e.g. WakeUpMonitor: int32_t* resPtr, int32_t secUntilWakeUp, int32_t secBeforeSleep
#define YPA_sleepUntil_Ddd              ((ypaHandle)-1915838630)    // e.g. WakeUpMonitor: int32_t* resPtr, int32_t wakeUpTime, int32_t secBeforeSleep
#define YPA_sleep_Dd                    ((ypaHandle)-803868914)     // e.g. WakeUpMonitor: int32_t* resPtr, int32_t secBeforeSleep
#define YPA_snoopMessagesEx_xTdd        ((ypaHandle)-761225816)     // e.g. SerialPort: YSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait, int32_t maxMsg
#define YPA_snoopMessagesEx_xXdd        ((ypaHandle)-608541492)     // e.g. Sdi12Port: YSdi12SnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait, int32_t maxMsg
#define YPA_snoopMessagesEx_xYdd        ((ypaHandle)-629666053)     // e.g. I2cPort: YI2cSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait, int32_t maxMsg
#define YPA_snoopMessagesEx_xZdd        ((ypaHandle)-666980190)     // e.g. SpiPort: YSpiSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait, int32_t maxMsg
#define YPA_snoopMessages_xTd           ((ypaHandle)596205081)      // e.g. SerialPort: YSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait
#define YPA_snoopMessages_xXd           ((ypaHandle)-1891888875)    // e.g. Sdi12Port: YSdi12SnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait
#define YPA_snoopMessages_xYd           ((ypaHandle)-1775820716)    // e.g. I2cPort: YI2cSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait
#define YPA_snoopMessages_xZd           ((ypaHandle)-1123388521)    // e.g. SpiPort: YSpiSnoopingRecordStruct* resPtr, size_t* resSize, int32_t maxWait
#define YPA_softAPNetwork_Dss           ((ypaHandle)-1036902186)    // e.g. Wireless: int32_t* resPtr, char* ssid, char* securityKey
#define YPA_start3DCalibration_D        ((ypaHandle)-734831571)     // e.g. RefFrame: int32_t* resPtr
#define YPA_startBlinkSeq_D             ((ypaHandle)1513230446)     // e.g. ColorLed: int32_t* resPtr
#define YPA_startBlinkSeq_Dd            ((ypaHandle)848114819)      // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_startDataLogger_D           ((ypaHandle)1135219035)     // e.g. Sensor: int32_t* resPtr
#define YPA_startPlaySeq_D              ((ypaHandle)1240697977)     // e.g. Buzzer: int32_t* resPtr
#define YPA_startUpdate_D               ((ypaHandle)-1041914131)    // e.g. FirmwareUpdate: int32_t* resPtr
#define YPA_startWlanScan_D             ((ypaHandle)-1723855061)    // e.g. Wireless: int32_t* resPtr
#define YPA_stopBlinkSeq_D              ((ypaHandle)-1510934014)    // e.g. ColorLed: int32_t* resPtr
#define YPA_stopBlinkSeq_Dd             ((ypaHandle)1987500826)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t seqIndex
#define YPA_stopDataLogger_D            ((ypaHandle)-901922476)     // e.g. Sensor: int32_t* resPtr
#define YPA_stopPlaySeq_D               ((ypaHandle)-2072801120)    // e.g. Buzzer: int32_t* resPtr
#define YPA_stopSequence_D              ((ypaHandle)1447496978)     // e.g. Display: int32_t* resPtr
#define YPA_swapLayerContent_Ddd        ((ypaHandle)1191315960)     // e.g. Display: int32_t* resPtr, int32_t layerIdA, int32_t layerIdB
#define YPA_tagGetAFI_DsOP              ((ypaHandle)-963245929)     // e.g. RfidReader: int32_t* resPtr, char* tagId, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagGetDSFID_DsOP            ((ypaHandle)1508083751)     // e.g. RfidReader: int32_t* resPtr, char* tagId, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagLockAFI_DsOP             ((ypaHandle)632400935)      // e.g. RfidReader: int32_t* resPtr, char* tagId, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagLockBlocks_DsddOP        ((ypaHandle)914920633)      // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t nBlocks, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagLockDSFID_DsOP           ((ypaHandle)1822270025)     // e.g. RfidReader: int32_t* resPtr, char* tagId, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagReadArray_xDsddOP        ((ypaHandle)1977441080)     // e.g. RfidReader: int32_t* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagReadBin_SsddOP           ((ypaHandle)-1089616085)    // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagReadHex_SsddOP           ((ypaHandle)-187720614)     // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nBytes, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagReadStr_SsddOP           ((ypaHandle)33205439)       // e.g. RfidReader: char* resPtr, size_t* resSize, char* tagId, int32_t firstBlock, int32_t nChars, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagSetAFI_DsdOP             ((ypaHandle)563634058)      // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t afi, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagSetDSFID_DsdOP           ((ypaHandle)-1704526734)    // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t dsfid, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagWriteArray_DsdxdOP       ((ypaHandle)-107637433)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t* byteListPtr, size_t byteListSize, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagWriteBin_DsdsOP          ((ypaHandle)-1432288120)    // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* buff, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagWriteHex_DsdsOP          ((ypaHandle)-513581063)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* hexString, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tagWriteStr_DsdsOP          ((ypaHandle)341208860)      // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* text, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_tare_D                      ((ypaHandle)1184568647)     // e.g. WeighScale: int32_t* resPtr
#define YPA_toggle_D                    ((ypaHandle)2103143890)     // e.g. Watchdog: int32_t* resPtr
#define YPA_toggle_bitState_Dd          ((ypaHandle)-947704724)     // e.g. DigitalIO: int32_t* resPtr, int32_t bitno
#define YPA_triggerBaselineCalibration_D ((ypaHandle)-324279273)     // e.g. CarbonDioxide: int32_t* resPtr
#define YPA_triggerCallback_D           ((ypaHandle)198977409)      // e.g. Network: int32_t* resPtr
#define YPA_triggerConfigChangeCallback_D ((ypaHandle)1909607213)     // e.g. Module: int32_t* resPtr
#define YPA_triggerFirmwareUpdate_Dd    ((ypaHandle)-924691982)     // e.g. Module: int32_t* resPtr, int32_t secBeforeReboot
#define YPA_triggerForcedCalibration_Df ((ypaHandle)-1324587585)    // e.g. CarbonDioxide: int32_t* resPtr, double refVal
#define YPA_triggerOffsetCalibration_Df ((ypaHandle)-506750790)     // e.g. RangeFinder: int32_t* resPtr, double targetDist
#define YPA_triggerPulsesByDuration_Dfd ((ypaHandle)-150447958)     // e.g. PwmOutput: int32_t* resPtr, double ms_target, int32_t n_pulses
#define YPA_triggerPulsesByDutyCycle_Dfd ((ypaHandle)-1424960313)    // e.g. PwmOutput: int32_t* resPtr, double target, int32_t n_pulses
#define YPA_triggerPulsesByFrequency_Dfd ((ypaHandle)-2133465258)    // e.g. PwmOutput: int32_t* resPtr, double target, int32_t n_pulses
#define YPA_triggerSpadCalibration_D    ((ypaHandle)-2095163516)    // e.g. RangeFinder: int32_t* resPtr
#define YPA_triggerTemperatureCalibration_D ((ypaHandle)-1024472675)    // e.g. RangeFinder: int32_t* resPtr
#define YPA_triggerXTalkCalibration_Df  ((ypaHandle)-260843677)     // e.g. RangeFinder: int32_t* resPtr, double targetDist
#define YPA_triggerZeroCalibration_D    ((ypaHandle)1693580810)     // e.g. CarbonDioxide: int32_t* resPtr
#define YPA_turnLedOff_D                ((ypaHandle)1158570157)     // e.g. ColorSensor: int32_t* resPtr
#define YPA_turnLedOn_D                 ((ypaHandle)1420082593)     // e.g. ColorSensor: int32_t* resPtr
#define YPA_unhide_D                    ((ypaHandle)-1672199517)    // e.g. DisplayLayer: int32_t* resPtr
#define YPA_unlinkLedFromBlinkSeq_Ddd   ((ypaHandle)1707632279)     // e.g. ColorLedCluster: int32_t* resPtr, int32_t ledIndex, int32_t count
#define YPA_unmuteValueCallbacks_D      ((ypaHandle)1215838047)     // e.g. Function: int32_t* resPtr
#define YPA_updateFirmwareEx_Hsb        ((ypaHandle)649705825)      // e.g. Module: int32_t* resHdlPtr, char* path, int32_t force
#define YPA_updateFirmware_Hs           ((ypaHandle)-523596957)     // e.g. Module: int32_t* resHdlPtr, char* path
#define YPA_uploadJob_Dss               ((ypaHandle)985066379)      // e.g. SpiPort: int32_t* resPtr, char* jobfile, char* jsonDef
#define YPA_upload_Dss                  ((ypaHandle)2131382702)     // e.g. Files: int32_t* resPtr, char* pathname, char* content
#define YPA_useDHCP_Dsds                ((ypaHandle)-1488525231)    // e.g. Network: int32_t* resPtr, char* fallbackIpAddr, int32_t fallbackSubnetMaskLen, char* fallbackRouter
#define YPA_useDHCPauto_D               ((ypaHandle)-1241905517)    // e.g. Network: int32_t* resPtr
#define YPA_useStaticIP_Dsds            ((ypaHandle)-393634237)     // e.g. Network: int32_t* resPtr, char* ipAddress, int32_t subnetMaskLen, char* router
#define YPA_voltageMove_Dfd             ((ypaHandle)-253308149)     // e.g. VoltageOutput: int32_t* resPtr, double V_target, int32_t ms_duration
#define YPA_volumeMove_Ddd              ((ypaHandle)-1775642985)    // e.g. Buzzer: int32_t* resPtr, int32_t volume, int32_t duration
#define YPA_wakeUp_D                    ((ypaHandle)958878919)      // e.g. WakeUpMonitor: int32_t* resPtr
#define YPA_writeArray_DsdxdOP          ((ypaHandle)-752253981)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, int32_t* byteListPtr, size_t byteListSize, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_writeArray_Dxd              ((ypaHandle)1790600172)     // e.g. SpiPort: int32_t* resPtr, int32_t* byteListPtr, size_t byteListSize
#define YPA_writeBin_Ds                 ((ypaHandle)2026149263)     // e.g. SpiPort: int32_t* resPtr, char* buff
#define YPA_writeBin_DsdsOP             ((ypaHandle)1620532301)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* buff, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_writeByte_Dd                ((ypaHandle)-741971664)     // e.g. SpiPort: int32_t* resPtr, int32_t code
#define YPA_writeHex_Ds                 ((ypaHandle)1776112555)     // e.g. SpiPort: int32_t* resPtr, char* hexString
#define YPA_writeHex_DsdsOP             ((ypaHandle)726992700)      // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* hexString, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_writeLine_Ds                ((ypaHandle)699144722)      // e.g. Sdi12Port: int32_t* resPtr, char* text
#define YPA_writeMODBUS_Ds              ((ypaHandle)1987706032)     // e.g. SerialPort: int32_t* resPtr, char* hexString
#define YPA_writeStr_Ds                 ((ypaHandle)854720421)      // e.g. Sdi12Port: int32_t* resPtr, char* text
#define YPA_writeStr_DsdsOP             ((ypaHandle)-564119591)     // e.g. RfidReader: int32_t* resPtr, char* tagId, int32_t firstBlock, char* text, YRfidOptionsStruct* optionsPtr, YRfidStatusStruct* statusPtr
#define YPA_writeStxEtx_Ds              ((ypaHandle)864615277)      // e.g. SerialPort: int32_t* resPtr, char* text
#define YPA_zeroAdjust_D                ((ypaHandle)-2126615366)    // e.g. GenericSensor: int32_t* resPtr
//--- (end of generated code: Method Handles)


/************************************************************************
 *                                                                      *
 *                      Functions to setup API                          *
 *                                                                      *
 ************************************************************************/

/**
* <summary>
*   Returns the version identifier for the Yoctopuce library in use.
* <para>
*   The version is a string in the form <c>"Major.Minor.Build"</c>,
*   for instance <c>"1.01.5535"</c>. For languages using an external
*   DLL (for instance C#, VisualBasic or Delphi), the character string
*   includes as well the DLL version, for instance
*   <c>"1.01.5535 (1.01.5439)"</c>.
* </para>
* <para>
*   If you want to verify in your code that the library version is
*   compatible with the version that you have used during development,
*   verify that the major number is strictly equal and that the minor
*   number is greater or equal. The build number is not relevant
*   with respect to the library compatibility.
* </para>
* <para>
* </para>
* </summary>
* <returns>
*   a character string describing the library version.
* </returns>
*/
int YPA_FUNCTION_EXPORT ypaGetAPIVersion(char *result, size_t *resultBuffSize);

/**
* <summary>
*   Returns the system architecture for the Yoctopuce communication library in use.
* <para>
*   On Windows, the architecture can be <c>"Win32"</c> or <c>"Win64"</c>.
*   On ARM machines, the architecture is <c>"Armhf32"</c> or <c>"Aarch64"</c>.
*   On other Linux machines, the architecture is <c>"Linux32"</c> or <c>"Linux64"</c>.
*   On MacOS, the architecture is <c>"MacOs32"</c> or <c>"MacOs64"</c>.
* </para>
* <para>
* </para>
* </summary>
* <returns>
*   a character string describing the system architecture of the
*   low-level communication library.
* </returns>
*/
int YPA_FUNCTION_EXPORT ypaGetAPIArchitecture(char *result, size_t *resultBuffSize);

/**
* <summary>
*   Test if the hub is reachable.
* <para>
*   This method do not register the hub, it only test if the
*   hub is usable. The url parameter follow the same convention as the <c>yRegisterHub</c>
*   method. This method is useful to verify the authentication parameters for a hub. It
*   is possible to force this method to return after mstimeout milliseconds.
* </para>
* <para>
* </para>
* </summary>
* <param name="url">
*   a string containing either <c>"usb"</c>,<c>"callback"</c> or the
*   root URL of the hub to monitor
* </param>
* <param name="mstimeout">
*   the number of millisecond available to test the connection.
* </param>
* <param name="errmsg">
*   a string passed by reference to receive any error message.
* </param>
* <returns>
*   <c>YAPI::SUCCESS</c> when the call succeeds.
* </returns>
* <para>
*   On failure returns a negative error code.
* </para>
*/
int YPA_FUNCTION_EXPORT ypaTestHub(const char *url, int mstimeout, char *result, size_t *resultBuffSize);

/**
* <summary>
*   Fault-tolerant alternative to <c>yRegisterHub()</c>.
* <para>
*   This function has the same
*   purpose and same arguments as <c>yRegisterHub()</c>, but does not trigger
*   an error when the selected hub is not available at the time of the function call.
*   This makes it possible to register a network hub independently of the current
*   connectivity, and to try to contact it only when a device is actively needed.
* </para>
* <para>
* </para>
* </summary>
* <param name="url">
*   a string containing either <c>"usb"</c>,<c>"callback"</c> or the
*   root URL of the hub to monitor
* </param>
* <param name="errmsg">
*   a string passed by reference to receive any error message.
* </param>
* <returns>
*   <c>YAPI::SUCCESS</c> when the call succeeds.
* </returns>
* <para>
*   On failure, throws an exception or returns a negative error code.
* </para>
*/
int YPA_FUNCTION_EXPORT ypaPreregisterHub(const char *url, char *result, size_t *resultBuffSize);

/**
* <summary>
*   Setup the Yoctopuce library to use modules connected on a given machine.
* <para>
*   The
*   parameter will determine how the API will work. Use the following values:
* </para>
* <para>
*   <b>usb</b>: When the <c>usb</c> keyword is used, the API will work with
*   devices connected directly to the USB bus. Some programming languages such a JavaScript,
*   PHP, and Java don't provide direct access to USB hardware, so <c>usb</c> will
*   not work with these. In this case, use a VirtualHub or a networked YoctoHub (see below).
* </para>
* <para>
*   <b><i>x.x.x.x</i></b> or <b><i>hostname</i></b>: The API will use the devices connected to the
*   host with the given IP address or hostname. That host can be a regular computer
*   running a VirtualHub, or a networked YoctoHub such as YoctoHub-Ethernet or
*   YoctoHub-Wireless. If you want to use the VirtualHub running on you local
*   computer, use the IP address 127.0.0.1.
* </para>
* <para>
*   <b>callback</b>: that keyword make the API run in "<i>HTTP Callback</i>" mode.
*   This a special mode allowing to take control of Yoctopuce devices
*   through a NAT filter when using a VirtualHub or a networked YoctoHub. You only
*   need to configure your hub to call your server script on a regular basis.
*   This mode is currently available for PHP and Node.JS only.
* </para>
* <para>
*   Be aware that only one application can use direct USB access at a
*   given time on a machine. Multiple access would cause conflicts
*   while trying to access the USB modules. In particular, this means
*   that you must stop the VirtualHub software before starting
*   an application that uses direct USB access. The workaround
*   for this limitation is to setup the library to use the VirtualHub
*   rather than direct USB access.
* </para>
* <para>
*   If access control has been activated on the hub, virtual or not, you want to
*   reach, the URL parameter should look like:
* </para>
* <para>
*   <c>http://username:password@address:port</c>
* </para>
* <para>
*   You can call <i>RegisterHub</i> several times to connect to several machines.
* </para>
* <para>
* </para>
* </summary>
* <param name="url">
*   a string containing either <c>"usb"</c>,<c>"callback"</c> or the
*   root URL of the hub to monitor
* </param>
* <param name="errmsg">
*   a string passed by reference to receive any error message.
* </param>
* <returns>
*   <c>YAPI::SUCCESS</c> when the call succeeds.
* </returns>
* <para>
*   On failure, throws an exception or returns a negative error code.
* </para>
*/
int YPA_FUNCTION_EXPORT ypaRegisterHub(const char *url, char *result, size_t *resultBuffSize);

/**
* <summary>
*   Retrieves Yoctopuce low-level library diagnostic logs.
* <para>
*   This method allows to progessively retrieve API logs. The interface is line-based:
*   it must called it within a loop until the returned value is an empty string.
*   Make sure to exit the loop when an empty string is returned, as feeding an empty
*   string into the <c>lastLogLine</c> parameter for the next call would restart
*   enumerating logs from the oldest message available.
* </para>
* </summary>
* <param name="lastLogLine">
*   On first call, provide an empty string.
*   On subsequent calls, provide the last log line returned by <c>GetLog()</c>.
* </param>
* <returns>
*   a string with the log line immediately following the one given in argument,
*   if such line exist. Returns an empty string otherwise, when completed.
* </returns>
*/
int YPA_FUNCTION_EXPORT ypaGetLog(const char *lastLogLine, char *result, size_t *resultBuffSize);

/**
* <summary>
*   Modifies the network connection delay for <c>yRegisterHub()</c> and <c>yUpdateDeviceList()</c>.
* <para>
*   This delay impacts only the YoctoHubs and VirtualHub
*   which are accessible through the network. By default, this delay is of 20000 milliseconds,
*   but depending or you network you may want to change this delay,
*   gor example if your network infrastructure is based on a GSM connection.
* </para>
* <para>
* </para>
* </summary>
* <param name="networkMsTimeout">
*   the network connection delay in milliseconds.
* @noreturn
* </param>
*/
int YPA_FUNCTION_EXPORT ypaSetNetworkTimeout(int mstimeout);

/**
* <summary>
*   Returns the network connection delay for <c>yRegisterHub()</c> and <c>yUpdateDeviceList()</c>.
* <para>
*   This delay impacts only the YoctoHubs and VirtualHub
*   which are accessible through the network. By default, this delay is of 20000 milliseconds,
*   but depending or you network you may want to change this delay,
*   for example if your network infrastructure is based on a GSM connection.
* </para>
* </summary>
* <returns>
*   the network connection delay in milliseconds.
* </returns>
*/
int YPA_FUNCTION_EXPORT ypaGetNetworkTimeout(int *result);

/**
* <summary>
*   Frees dynamically allocated memory blocks used by the Yoctopuce library.
* <para>
*   It is generally not required to call this function, unless you
*   want to free all dynamically allocated memory blocks in order to
*   track a memory leak for instance.
*   You should not call any other library function after calling
*   <c>yFreeAPI()</c>, or your program will crash.
* </para>
* </summary>
*/
int YPA_FUNCTION_EXPORT ypaFreeAPI(void);

/************************************************************************
 *                                                                      *
 *                  Functions to work with devices                      *
 *                                                                      *
 ************************************************************************/

typedef struct {
    char Name[64];          // a string with the name of the file.
    int Size;               // the size of the file.
    int Crc;                // the 32-bit CRC of the file content.
} YFileRecordStruct;

typedef struct {
    char Ssid[32];          // a string with the name of the wireless network (SSID).
    int Channel;            // an integer corresponding to the channel.
    char Security[8];       // a string with the security algorithm.
    int LinkQuality;        // an integer between 0 and 100 corresponding to the signal quality.
} YWlanRecordStruct;

typedef struct {
    char CellOperator[32];  // a string with the name of the the cell operator.
    int MobileCountryCode;  // an integer corresponding to the Mobile Country Code (MCC).
    int MobileNetworkCode;  // an integer corresponding to the Mobile Network Code (MNC).
    int LocationAreaCode;   // an integer corresponding to the Location Area Code (LAC).
    int CellId;             // an integer corresponding to the Cell Id.
    int SignalStrength;     // an integer corresponding to the signal strength.
    int TimingAdvance;      // an integer corresponding to the Timing Advance (TA).
} YCellRecordStruct;

typedef struct {
    int Time;               // the elapsed time, in ms, since the beginning of the preceding message.
    int Pos;				// the absolute position of the message end.
    int Direction;          // the message direction (RX=0, TX=1).
    char Message[516];      // the message content.
} YSnoopingRecordStruct;

typedef struct {
    int Time;               // the elapsed time, in ms, since the beginning of the preceding message.
    int Pos;				// the absolute position of the message end.
    int Direction;          // the message direction (RX=0, TX=1).
    char Message[516];      // the message content.
} YSpiSnoopingRecordStruct;

typedef struct {
    int Time;               // the elapsed time, in ms, since the beginning of the preceding message.
    int Pos;				// the absolute position of the message end.
    int Direction;          // the message direction (RX=0, TX=1).
    char Message[516];      // the message content.
} YI2cSnoopingRecordStruct;

typedef struct {
    int Time;               // the elapsed time, in ms, since the beginning of the preceding message.
    int Pos;				// the absolute position of the message end.
    int Direction;          // the message direction (RX=0, TX=1).
    char Message[516];      // the message content.
} YSdi12SnoopingRecordStruct;

typedef struct {
	bool IsValid;
    char SensorAddress[2];
    char SensorProtocol[6];
    char SensorVendor[32];
    char SensorModel[32];
    char SensorVersion[8];
    char SensorSerial[32];
    int MeasureCount;
} YSdi12SensorInfoStruct;

typedef struct {
    int SerieCount;         // the number of series in the capture data
    int RecordCount;        // the number of records per serie
    int SamplingRate;       // the effective sampling rate of the device
    int CaptureType; 		// the type of automatic conditional capture
    double TriggerValue;	// the threshold value that triggered this capture
    int TriggerPosition;	// the index in the serie of the trigger event
    double TriggerRealTimeUTC; // the absolute time when the capture was triggered
    char Serie1Unit[10];	// the unit of measurement for serie 1
    char Serie2Unit[10];	// the unit of measurement for serie 2
    char Serie3Unit[10];	// the unit of measurement for serie 3
    double Serie1Values[8192]; // the sampled data corresponding to serie 1
    double Serie2Values[8192]; // the sampled data corresponding to serie 1
    double Serie3Values[8192]; // the sampled data corresponding to serie 1
} YInputCaptureDataStruct;

typedef struct {
    int KeyType;                // Type of RFID access key provided, or 0 if none
    char HexKey[65];            // RFID access key, as an hexadecimal string
    int ForceSingleBlockAccess; // Use only single-block commands to access RFID tag memory
    int ForceMultiBlockAccess;  // Use multi-block commands to access RFID tag memory whenever possible
    int EnableRawAccess;        // Enable direct access to RFID tag control blocks
    int DisableBoundaryChecks;  // Allow access to blocks beyond expected tag memory size
    int EnableDryRun;           // Enable simulation mode to check affected block range and access rights
} YRfidOptionsStruct;

typedef struct {
    char TagId[65];			// RFID tag identifier related to the status
    int ErrorCode;			// Detailled error code, or 0 if no error happened
    int ErrorBlock;			// RFID tag memory block number where the error was encountered, or -1
    char ErrorMessage[128];	// string describing precisely the RFID commande result
    int FirstAffectedBlock; // Block number of the first memory block affected by the operation
    int LastAffectedBlock;  // Block number of the last memory block affected by the operation
} YRfidStatusStruct;

typedef struct {
    char TagId[65];			// RFID tag identifier related to the status
    int TagType;		    // RFID tag type, as a numeric constant
    char TagTypeStr[36];	// RFID tag type, as a string
    int TagMemorySize;		// RFID tag total memory size of the RFID tag, in bytes.
    int TagUsableSize;		// RFID tag usable memory size of the RFID tag, in bytes.
    int TagBlockSize;		// RFID tag block size of the RFID tag, in bytes.
    int TagFirstBlock;		// Index of the first usable storage block on the RFID tag.
    int TagLastBlock;		// Index of the last usable storage block on the RFID tag.
} YRfidTagInfoStruct;

int YPA_FUNCTION_EXPORT ypaFind(ypaHandle classHandle, const char *deviceName, char *errmsg, size_t *errmsgSize, ypaHandle *result);
int YPA_FUNCTION_EXPORT ypaGetSimilarFunctions(ypaHandle classHandle, char *errmsg, size_t *errmsgSize, char *resPtr, size_t *resSize);

int YPA_FUNCTION_EXPORT ypaGetPropInt32(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, int32_t *result);
int YPA_FUNCTION_EXPORT ypaGetPropInt64(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, int64_t *result);
int YPA_FUNCTION_EXPORT ypaGetPropDouble(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, double *result);
int YPA_FUNCTION_EXPORT ypaGetPropStr(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, char *result, size_t *resultBuffSize);

int YPA_FUNCTION_EXPORT ypaSetPropInt32(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, int32_t newVal);
int YPA_FUNCTION_EXPORT ypaSetPropInt64(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, int64_t newVal);
int YPA_FUNCTION_EXPORT ypaSetPropDouble(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, double newVal);
int YPA_FUNCTION_EXPORT ypaSetPropStr(ypaHandle funcHandle, ypaHandle propHandle, char *errmsg, size_t *errmsgSize, const char *newVal);

int YPA_FUNCTION_EXPORT ypaInvokeMethod_(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize);
//--- (generated code: Invoke Helpers)
int YPA_FUNCTION_EXPORT ypaInvokeMethod_S(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_D(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_d(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Q(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int64_t* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ssb(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Hsb(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Hs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ds(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Bs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xSs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ss(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xS(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_s(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dss(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Db(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddddd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, int32_t arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dddd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dddds(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, int32_t arg4, char* arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddds(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, char* arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddddsd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, int32_t arg4, char* arg5, int32_t arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_H(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_F(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_f(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Fss(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double* arg1, char* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dsxfxf(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, double* arg3, size_t arg4, double* arg5, size_t arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_dd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t arg1, int32_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dds(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddxd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t* arg3, size_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ddxdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t* arg3, size_t arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dxdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t* arg2, size_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Sdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dfd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xSsd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Ssd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Sdsd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, int32_t arg3, char* arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDdxdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3, int32_t* arg4, size_t arg5, int32_t arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dxd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t* arg2, size_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dxf(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double* arg2, size_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dff(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double arg2, double arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_q(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int64_t arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Df(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Sd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDdxd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3, int32_t* arg4, size_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDddd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3, int32_t arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dddxd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2, int32_t arg3, int32_t* arg4, size_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDddxddd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, int32_t arg3, int32_t arg4, int32_t* arg5, size_t arg6, int32_t arg7, int32_t arg8);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dxfxf(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double* arg2, size_t arg3, double* arg4, size_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_B(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Hff(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, double arg2, double arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xH(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_ss(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, char* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dsds(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, char* arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dsd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dq(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int64_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xV(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YCellRecordStruct* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xUs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YFileRecordStruct* arg1, size_t* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xTd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xW(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YWlanRecordStruct* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xZd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSpiSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xYd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YI2cSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Hd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, int32_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dxs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char** arg2, size_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xF(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_C(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YInputCaptureDataStruct* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Cd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YInputCaptureDataStruct* arg1, int32_t arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Dsdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Sssd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, char* arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_NsP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YRfidTagInfoStruct* arg1, char* arg2, YRfidStatusStruct* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsddP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, int32_t arg4, YRfidStatusStruct* arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_SsddP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, int32_t arg4, int32_t arg5, YRfidStatusStruct* arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xXd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDsddP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, char* arg3, int32_t arg4, int32_t arg5, YRfidStatusStruct* arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_R(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SensorInfoStruct* arg1);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xR(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SensorInfoStruct* arg1, size_t* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Rss(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SensorInfoStruct* arg1, char* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_Rs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SensorInfoStruct* arg1, char* arg2);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xFssd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double* arg1, size_t* arg2, char* arg3, char* arg4, int32_t arg5);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xFs(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, double* arg1, size_t* arg2, char* arg3);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsddOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, int32_t arg4, YRfidOptionsStruct* arg5, YRfidStatusStruct* arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_SsddOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, char* arg1, size_t* arg2, char* arg3, int32_t arg4, int32_t arg5, YRfidOptionsStruct* arg6, YRfidStatusStruct* arg7);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xDsddOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, char* arg3, int32_t arg4, int32_t arg5, YRfidOptionsStruct* arg6, YRfidStatusStruct* arg7);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsdsOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, char* arg4, YRfidOptionsStruct* arg5, YRfidStatusStruct* arg6);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsdxdOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, int32_t* arg4, size_t arg5, YRfidOptionsStruct* arg6, YRfidStatusStruct* arg7);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xBsddOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, size_t* arg2, char* arg3, int32_t arg4, int32_t arg5, YRfidOptionsStruct* arg6, YRfidStatusStruct* arg7);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xYdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YI2cSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xXdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSdi12SnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xTdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_xZdd(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, YSpiSnoopingRecordStruct* arg1, size_t* arg2, int32_t arg3, int32_t arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, YRfidOptionsStruct* arg3, YRfidStatusStruct* arg4);
int YPA_FUNCTION_EXPORT ypaInvokeMethod_DsdOP(ypaHandle funcHandle, ypaHandle methodHandle, char *errmsg, size_t *errmsgSize, int32_t* arg1, char* arg2, int32_t arg3, YRfidOptionsStruct* arg4, YRfidStatusStruct* arg5);
//--- (end of generated code: Invoke Helpers)


#ifdef  __cplusplus
}
#endif

#endif
