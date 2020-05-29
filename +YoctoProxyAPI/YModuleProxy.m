% YModuleProxy: Global parameters control interface for all Yoctopuce
% devices
% 
% The YModuleProxy class can be used with all Yoctopuce USB devices. It
% can be used to control the module global parameters, and to enumerate
% the functions provided by each module.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% $Id: svn_id $
%
% - - - - - - - - - License information: - - - - - - - - -
%
% Copyright (C) 2011 and beyond by Yoctopuce Sarl, Switzerland.
%
% Yoctopuce Sarl (hereafter Licensor) grants to you a perpetual
% non-exclusive license to use, modify, copy and integrate this
% file into your software for the sole purpose of interfacing
% with Yoctopuce products.
%
% You may reproduce and distribute copies of this file in
% source or object form, as long as the sole purpose of this
% code is to interface with Yoctopuce products. You must retain
% this notice in the distributed source file.
%
% You should refer to Yoctopuce General Terms and Conditions
% for additional information regarding your rights and
% obligations.
%
% THE SOFTWARE AND DOCUMENTATION ARE PROVIDED 'AS IS' WITHOUT
% WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING
% WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS
% FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO
% EVENT SHALL LICENSOR BE LIABLE FOR ANY INCIDENTAL, SPECIAL,
% INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA,
% COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR
% SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT
% LIMITED TO ANY DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR
% CONTRIBUTION, OR OTHER SIMILAR COSTS, WHETHER ASSERTED ON THE
% BASIS OF CONTRACT, TORT (INCLUDING NEGLIGENCE), BREACH OF
% WARRANTY, OR OTHERWISE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% //--- (generated code: YModule declaration)
classdef YModuleProxy < YoctoProxyAPI.YFunctionProxy
    % YModuleProxy: Global parameters control interface for all Yoctopuce devices
    % 
    % The YModuleProxy class can be used with all Yoctopuce USB devices. It can be used to control the
    % module global parameters, and to enumerate the functions provided by each module.

    properties (Transient, Nontunable)
        % Luminosity Luminosity of the  module informative LEDs (from 0 to 100)
        Luminosity (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % ProductName Commercial name of the module, as set by the factory
        ProductName (1,:) char
        % ProductId USB device identifier of the module
        ProductId (1,1) int32
        % ProductRelease Release number of the module hardware, preprogrammed at the factory
        ProductRelease (1,1) int32
        % FirmwareRelease Version of the firmware embedded in the module
        FirmwareRelease (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of generated code: YModule declaration)

    properties
        % Beacon State of Beacon LED.
        Beacon (1,1) YoctoProxyAPI.EnumBeacon
    end
    
    % //--- (generated code: YModule implementation)
    methods (Hidden)
        function obj = YModuleProxy()
            % YModuleProxy For internal use as System Object.
            % Use FindModule() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 193471262;
        end
    end

    methods (Static)
        function obj = FindModule(func)
            % FindModule Retrieve instances of YModuleProxy
            obj = YoctoProxyAPI.YModuleProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindModule to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(193471262);
        end
    end
    % //--- (end of generated code: YModule implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YModuleProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Module');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Module', ...
                'PropertyList', {'ProductName','FirmwareRelease','Beacon'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Module settings', ...
                'PropertyList', {'LogicalName','Luminosity'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    methods
        % //--- (generated code: YModule accessors declaration)

        function result = get_productName(obj)
            % Returns the commercial name of the module, as set by the factory.
            %
            % @return a string corresponding to the commercial name of the module, as set by the factory
            %
            % On failure, throws an exception or returns Y_PRODUCTNAME_INVALID.
            result = obj.InvokeMethod_S(1761372173);
        end

        function result = get.ProductName(obj)
            result = obj.GetPropString(-708242678);
        end

        function result = get_productId(obj)
            % Returns the USB device identifier of the module.
            %
            % @return an integer corresponding to the USB device identifier of the module
            %
            % On failure, throws an exception or returns Y_PRODUCTID_INVALID.
            result = obj.InvokeMethod_D(820504697);
        end

        function result = get.ProductId(obj)
            result = obj.GetPropInt32(-1266150234);
        end

        function result = get_productRelease(obj)
            % Returns the release number of the module hardware, preprogrammed at the factory.
            % The original hardware release returns value 1, revision B returns value 2, etc.
            %
            % @return an integer corresponding to the release number of the module hardware,
            % preprogrammed at the factory
            %
            % On failure, throws an exception or returns Y_PRODUCTRELEASE_INVALID.
            result = obj.InvokeMethod_D(986891674);
        end

        function result = get.ProductRelease(obj)
            result = obj.GetPropInt32(131196030);
        end

        function result = get_firmwareRelease(obj)
            % Returns the version of the firmware embedded in the module.
            %
            % @return a string corresponding to the version of the firmware embedded in the module
            %
            % On failure, throws an exception or returns Y_FIRMWARERELEASE_INVALID.
            result = obj.InvokeMethod_S(1884340311);
        end

        function result = get.FirmwareRelease(obj)
            result = obj.GetPropString(318304357);
        end

        function result = get_persistentSettings(obj)
            % Returns the current state of persistent module settings.
            %
            % @return a value among Y_PERSISTENTSETTINGS_LOADED, Y_PERSISTENTSETTINGS_SAVED and
            % Y_PERSISTENTSETTINGS_MODIFIED corresponding to the current state of persistent module settings
            %
            % On failure, throws an exception or returns Y_PERSISTENTSETTINGS_INVALID.
            result = YoctoProxyAPI.EnumPersistentSettings(obj.InvokeMethod_D(-1370941034));
        end

        function result = get_luminosity(obj)
            % Returns the luminosity of the  module informative LEDs (from 0 to 100).
            %
            % @return an integer corresponding to the luminosity of the  module informative LEDs (from 0 to 100)
            %
            % On failure, throws an exception or returns Y_LUMINOSITY_INVALID.
            result = obj.InvokeMethod_D(-1600964606);
        end

        function set_luminosity(obj, newVal)
            % Changes the luminosity of the module informative leds. The parameter is a
            % value between 0 and 100.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the luminosity of the module informative leds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1444189485, newVal);
        end

        function result = get.Luminosity(obj)
            result = obj.GetPropInt32(-43863649);
        end

        function set.Luminosity(obj, newVal)
            obj.Luminosity = newVal;
            obj.SetPropInt32(-43863649, newVal);
        end

        function result = get_beacon(obj)
            % Returns the state of the localization beacon.
            %
            % @return either Y_BEACON_OFF or Y_BEACON_ON, according to the state of the localization beacon
            %
            % On failure, throws an exception or returns Y_BEACON_INVALID.
            result = YoctoProxyAPI.EnumBeacon(obj.InvokeMethod_D(1865482844));
        end

        function set_beacon(obj, newVal)
            % Turns on or off the module localization beacon.
            %
            % @param newval : either Y_BEACON_OFF or Y_BEACON_ON
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1531048983, newVal);
        end

        function result = get_upTime(obj)
            % Returns the number of milliseconds spent since the module was powered on.
            %
            % @return an integer corresponding to the number of milliseconds spent since the module was powered on
            %
            % On failure, throws an exception or returns Y_UPTIME_INVALID.
            result = obj.InvokeMethod_Q(-114310087);
        end

        function result = get_usbCurrent(obj)
            % Returns the current consumed by the module on the USB bus, in milli-amps.
            %
            % @return an integer corresponding to the current consumed by the module on the USB bus, in milli-amps
            %
            % On failure, throws an exception or returns Y_USBCURRENT_INVALID.
            result = obj.InvokeMethod_D(558611683);
        end

        function result = get_rebootCountdown(obj)
            % Returns the remaining number of seconds before the module restarts, or zero when no
            % reboot has been scheduled.
            %
            % @return an integer corresponding to the remaining number of seconds before the module
            % restarts, or zero when no
            %         reboot has been scheduled
            %
            % On failure, throws an exception or returns Y_REBOOTCOUNTDOWN_INVALID.
            result = obj.InvokeMethod_D(152939681);
        end

        function result = get_userVar(obj)
            % Returns the value previously stored in this attribute.
            % On startup and after a device reboot, the value is always reset to zero.
            %
            % @return an integer corresponding to the value previously stored in this attribute
            %
            % On failure, throws an exception or returns Y_USERVAR_INVALID.
            result = obj.InvokeMethod_D(-499093400);
        end

        function set_userVar(obj, newVal)
            % Stores a 32 bit value in the device RAM. This attribute is at programmer disposal,
            % should he need to store a state variable.
            % On startup and after a device reboot, the value is always reset to zero.
            %
            % @param newval : an integer
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1383031572, newVal);
        end

        function result = saveToFlash(obj)
            % Saves current settings in the nonvolatile memory of the module.
            % Warning: the number of allowed save operations during a module life is
            % limited (about 100000 cycles). Do not call this function within a loop.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(871498529);
        end

        function result = revertFromFlash(obj)
            % Reloads the settings stored in the nonvolatile memory, as
            % when the module is powered on.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1616223927);
        end

        function result = reboot(obj, secBeforeReboot)
            % Schedules a simple module reboot after the given number of seconds.
            %
            % @param secBeforeReboot : number of seconds before rebooting
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(63512827, secBeforeReboot);
        end

        function result = triggerFirmwareUpdate(obj, secBeforeReboot)
            % Schedules a module reboot into special firmware update mode.
            %
            % @param secBeforeReboot : number of seconds before rebooting
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-924691982, secBeforeReboot);
        end

        function result = triggerConfigChangeCallback(obj)
            % Triggers a configuration change callback, to check if they are supported or not.
            result = obj.InvokeMethod_D(1909607213);
        end

        function result = checkFirmware(obj, path, onlynew)
            % Tests whether the byn file is valid for this module. This method is useful to test if
            % the module needs to be updated.
            % It is possible to pass a directory as argument instead of a file. In this case, this
            % method returns the path of the most recent
            % appropriate .byn file. If the parameter onlynew is true, the function discards
            % firmwares that are older or
            % equal to the installed firmware.
            %
            % @param path : the path of a byn file or a directory that contains byn files
            % @param onlynew : returns only files that are strictly newer
            %
            % @return the path of the byn file to use or a empty string if no byn files matches the requirement
            %
            % On failure, throws an exception or returns a string that start with "error:".
            result = obj.InvokeMethod_Ssb(-1493402608, path, onlynew);
        end

        function result = updateFirmwareEx(obj, path, force)
            % Prepares a firmware update of the module. This method returns a YFirmwareUpdate object which
            % handles the firmware update process.
            %
            % @param path : the path of the .byn file to use.
            % @param force : true to force the firmware update even if some prerequisites appear not to be met
            %
            % @return a YFirmwareUpdate object or NULL on error.
            result = obj.InvokeMethod_Hsb(649705825, path, force);
        end

        function result = updateFirmware(obj, path)
            % Prepares a firmware update of the module. This method returns a YFirmwareUpdate object which
            % handles the firmware update process.
            %
            % @param path : the path of the .byn file to use.
            %
            % @return a YFirmwareUpdate object or NULL on error.
            result = obj.InvokeMethod_Hs(-523596957, path);
        end

        function result = get_allSettings(obj)
            % Returns all the settings and uploaded files of the module. Useful to backup all the
            % logical names, calibrations parameters, and uploaded files of a device.
            %
            % @return a binary buffer with all the settings.
            %
            % On failure, throws an exception or returns an binary object of size 0.
            result = obj.InvokeMethod_S(-1026018998);
        end

        function result = set_allSettingsAndFiles(obj, settings)
            % Restores all the settings and uploaded files to the module.
            % This method is useful to restore all the logical names and calibrations parameters,
            % uploaded files etc. of a device from a backup.
            % Remember to call the saveToFlash() method of the module if the
            % modifications must be kept.
            %
            % @param settings : a binary buffer with all the settings.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(1548877370, settings);
        end

        function result = hasFunction(obj, funcId)
            % Tests if the device includes a specific function. This method takes a function identifier
            % and returns a boolean.
            %
            % @param funcId : the requested function identifier
            %
            % @return true if the device has the function identifier
            result = obj.InvokeMethod_Bs(-1858963821, funcId);
        end

        function result = get_functionIds(obj, funType)
            % Retrieve all hardware identifier that match the type passed in argument.
            %
            % @param funType : The type of function (Relay, LightSensor, Voltage,...)
            %
            % @return an array of strings.
            result = obj.InvokeMethod_xSs(1148522145, funType);
        end

        function result = set_allSettings(obj, settings)
            % Restores all the settings of the device. Useful to restore all the logical names and
            % calibrations parameters
            % of a module from a backup.Remember to call the saveToFlash() method of the module if the
            % modifications must be kept.
            %
            % @param settings : a binary buffer with all the settings.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1387417540, settings);
        end

        function result = get_hardwareId(obj)
            % Returns the unique hardware identifier of the module.
            % The unique hardware identifier is made of the device serial
            % number followed by string ".module".
            %
            % @return a string that uniquely identifies the module
            result = obj.InvokeMethod_S(844854119);
        end

        function result = download(obj, pathname)
            % Downloads the specified built-in file and returns a binary buffer with its content.
            %
            % @param pathname : name of the new file to load
            %
            % @return a binary buffer with the file content
            %
            % On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_Ss(1612576021, pathname);
        end

        function result = get_icon2d(obj)
            % Returns the icon of the module. The icon is a PNG image and does not
            % exceeds 1536 bytes.
            %
            % @return a binary buffer with module icon, in png format.
            %         On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_S(607279519);
        end

        function result = get_lastLogs(obj)
            % Returns a string with last logs of the module. This method return only
            % logs that are still in the module.
            %
            % @return a string with last logs of the module.
            %         On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_S(28952501);
        end

        function result = log(obj, text)
            % Adds a text message to the device logs. This function is useful in
            % particular to trace the execution of HTTP callbacks. If a newline
            % is desired after the message, it must be included in the string.
            %
            % @param text : the string to append to the logs.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(1235124910, text);
        end

        function result = get_subDevices(obj)
            % Returns a list of all the modules that are plugged into the current module.
            % This method only makes sense when called for a YoctoHub/VirtualHub.
            % Otherwise, an empty array will be returned.
            %
            % @return an array of strings containing the sub modules.
            result = obj.InvokeMethod_xS(-1229430516);
        end

        function result = get_parentHub(obj)
            % Returns the serial number of the YoctoHub on which this module is connected.
            % If the module is connected by USB, or if the module is the root YoctoHub, an
            % empty string is returned.
            %
            % @return a string with the serial number of the YoctoHub or an empty string
            result = obj.InvokeMethod_S(1327720150);
        end

        function result = get_url(obj)
            % Returns the URL used to access the module. If the module is connected by USB, the
            % string 'usb' is returned.
            %
            % @return a string with the URL of the module.
            result = obj.InvokeMethod_S(-579376065);
        end

        % //--- (end of generated code: YModule accessors declaration)

        function result = get.Beacon(obj)
            result = YoctoProxyAPI.EnumBeacon(obj.GetPropInt32(602156241));
        end

        function set.Beacon(obj, newVal)
            obj.Beacon = newVal;
            obj.SetPropInt32(602156241, newVal);
        end

    end
end
