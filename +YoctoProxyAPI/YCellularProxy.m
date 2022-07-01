% YCellularProxy: cellular interface control interface, available for instance in the
% YoctoHub-GSM-2G, the YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA or the YoctoHub-GSM-4G
% 
% The YCellularProxy class provides control over cellular network parameters and status for devices
% that are GSM-enabled. Note that TCP/IP parameters are configured separately, using class
% <tt>YNetwork</tt>.

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


% //--- (YCellular declaration)
classdef YCellularProxy < YoctoProxyAPI.YFunctionProxy
    % YCellularProxy: cellular interface control interface, available for instance in the
    % YoctoHub-GSM-2G, the YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA or the YoctoHub-GSM-4G
    % 
    % The YCellularProxy class provides control over cellular network parameters and status for devices
    % that are GSM-enabled. Note that TCP/IP parameters are configured separately, using class
    % <tt>YNetwork</tt>.

    properties (Transient, Nontunable)
        % Pin N opaque string if a PIN code has been configured in the device to access
        Pin (1,:) char
        % RadioConfig Type of protocol used over the serial line, as a string
        RadioConfig (1,:) char
        % LockedOperator Name of the only cell operator to use if automatic choice is disabled,
        LockedOperator (1,:) char
        % EnableData Condition for enabling IP data services (GPRS)
        EnableData (1,1) YoctoProxyAPI.EnumEnableData
        % Apn Access Point Name (APN) to be used, if needed
        Apn (1,:) char
        % PingInterval Automated connectivity check interval, in seconds
        PingInterval (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % LinkQuality Link quality, expressed in percent
        LinkQuality (1,1) int32
        % CellOperator Cell operator currently in use
        CellOperator (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of YCellular declaration)

    % //--- (YCellular implementation)
    methods (Hidden)
        function obj = YCellularProxy()
            % YCellularProxy For internal use as System Object.
            % Use FindCellular() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -410319788;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindCellular(func)
            % FindCellular Retrieve instances of YCellularProxy
            obj = YoctoProxyAPI.YCellularProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindCellular to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-410319788);
        end
    end
    % //--- (end of YCellular implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YCellularProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Cellular');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Cellular', ...
                'PropertyList', {'LinkQuality','CellOperator'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Cellular settings', ...
                'PropertyList', {'Pin','RadioConfig','LockedOperator','EnableData','Apn','PingInterval'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropInt32(-1385947561);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int32';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'LinkQuality';
        end
    end

    methods
        % //--- (YCellular accessors declaration)

        function result = get_linkQuality(obj)
            % Returns the link quality, expressed in percent.
            %
            % @return an integer corresponding to the link quality, expressed in percent
            %
            % On failure, throws an exception or returns YCellular.LINKQUALITY_INVALID.
            result = obj.InvokeMethod_D(-1702114621);
        end

        function result = get.LinkQuality(obj)
            result = obj.GetPropInt32(-1385947561);
        end

        function result = get.CellOperator(obj)
            result = obj.GetPropString(668276197);
        end

        function result = get_cellOperator(obj)
            % Returns the name of the cell operator currently in use.
            %
            % @return a string corresponding to the name of the cell operator currently in use
            %
            % On failure, throws an exception or returns YCellular.CELLOPERATOR_INVALID.
            result = obj.InvokeMethod_S(-345966488);
        end

        function result = get_cellIdentifier(obj)
            % Returns the unique identifier of the cellular antenna in use: MCC, MNC, LAC and Cell ID.
            %
            % @return a string corresponding to the unique identifier of the cellular antenna in use:
            % MCC, MNC, LAC and Cell ID
            %
            % On failure, throws an exception or returns YCellular.CELLIDENTIFIER_INVALID.
            result = obj.InvokeMethod_S(-1891073777);
        end

        function result = get_cellType(obj)
            % Active cellular connection type.
            %
            % @return a value among YCellular.CELLTYPE_GPRS, YCellular.CELLTYPE_EGPRS,
            % YCellular.CELLTYPE_WCDMA, YCellular.CELLTYPE_HSDPA, YCellular.CELLTYPE_NONE,
            % YCellular.CELLTYPE_CDMA, YCellular.CELLTYPE_LTE_M, YCellular.CELLTYPE_NB_IOT and
            % YCellular.CELLTYPE_EC_GSM_IOT
            %
            % On failure, throws an exception or returns YCellular.CELLTYPE_INVALID.
            result = YoctoProxyAPI.EnumCellType(obj.InvokeMethod_D(174582765));
        end

        function result = get_imsi(obj)
            % Returns the International Mobile Subscriber Identity (MSI) that uniquely identifies
            % the SIM card. The first 3 digits represent the mobile country code (MCC), which
            % is followed by the mobile network code (MNC), either 2-digit (European standard)
            % or 3-digit (North American standard)
            %
            % @return a string corresponding to the International Mobile Subscriber Identity (MSI)
            % that uniquely identifies
            %         the SIM card
            %
            % On failure, throws an exception or returns YCellular.IMSI_INVALID.
            result = obj.InvokeMethod_S(-2074679610);
        end

        function result = get_message(obj)
            % Returns the latest status message from the wireless interface.
            %
            % @return a string corresponding to the latest status message from the wireless interface
            %
            % On failure, throws an exception or returns YCellular.MESSAGE_INVALID.
            result = obj.InvokeMethod_S(739170692);
        end

        function result = get_pin(obj)
            % Returns an opaque string if a PIN code has been configured in the device to access
            % the SIM card, or an empty string if none has been configured or if the code provided
            % was rejected by the SIM card.
            %
            % @return a string corresponding to an opaque string if a PIN code has been configured in
            % the device to access
            %         the SIM card, or an empty string if none has been configured or if the code provided
            %         was rejected by the SIM card
            %
            % On failure, throws an exception or returns YCellular.PIN_INVALID.
            result = obj.InvokeMethod_S(-1861490753);
        end

        function set_pin(obj, newVal)
            % Changes the PIN code used by the module to access the SIM card.
            % This function does not change the code on the SIM card itself, but only changes
            % the parameter used by the device to try to get access to it. If the SIM code
            % does not work immediately on first try, it will be automatically forgotten
            % and the message will be set to "Enter SIM PIN". The method should then be
            % invoked again with right correct PIN code. After three failed attempts in a row,
            % the message is changed to "Enter SIM PUK" and the SIM card PUK code must be
            % provided using method sendPUK.
            %
            % Remember to call the saveToFlash() method of the module to save the
            % new value in the device flash.
            %
            % @param newval : a string corresponding to the PIN code used by the module to access the SIM card
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1531565066, newVal);
        end

        function result = get.Pin(obj)
            result = obj.GetPropString(-1916245229);
        end

        function set.Pin(obj, newVal)
            obj.Pin = newVal;
            obj.SetPropString(-1916245229, newVal);
        end

        function result = get_radioConfig(obj)
            % Returns the type of protocol used over the serial line, as a string.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
            % "Char" for a continuous ASCII stream or
            % "Byte" for a continuous binary stream.
            %
            % @return a string corresponding to the type of protocol used over the serial line, as a string
            %
            % On failure, throws an exception or returns YCellular.RADIOCONFIG_INVALID.
            result = obj.InvokeMethod_S(970069548);
        end

        function set_radioConfig(obj, newVal)
            % Changes the type of protocol used over the serial line.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
            % "Char" for a continuous ASCII stream or
            % "Byte" for a continuous binary stream.
            % The suffix "/[wait]ms" can be added to reduce the transmit rate so that there
            % is always at lest the specified number of milliseconds between each bytes sent.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the type of protocol used over the serial line
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1726318678, newVal);
        end

        function result = get.RadioConfig(obj)
            result = obj.GetPropString(-1539217766);
        end

        function set.RadioConfig(obj, newVal)
            obj.RadioConfig = newVal;
            obj.SetPropString(-1539217766, newVal);
        end

        function result = get_lockedOperator(obj)
            % Returns the name of the only cell operator to use if automatic choice is disabled,
            % or an empty string if the SIM card will automatically choose among available
            % cell operators.
            %
            % @return a string corresponding to the name of the only cell operator to use if
            % automatic choice is disabled,
            %         or an empty string if the SIM card will automatically choose among available
            %         cell operators
            %
            % On failure, throws an exception or returns YCellular.LOCKEDOPERATOR_INVALID.
            result = obj.InvokeMethod_S(1393348448);
        end

        function set_lockedOperator(obj, newVal)
            % Changes the name of the cell operator to be used. If the name is an empty
            % string, the choice will be made automatically based on the SIM card. Otherwise,
            % the selected operator is the only one that will be used.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the name of the cell operator to be used
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-968249388, newVal);
        end

        function result = get.LockedOperator(obj)
            result = obj.GetPropString(-1023493418);
        end

        function set.LockedOperator(obj, newVal)
            obj.LockedOperator = newVal;
            obj.SetPropString(-1023493418, newVal);
        end

        function result = get_airplaneMode(obj)
            % Returns true if the airplane mode is active (radio turned off).
            %
            % @return either YCellular.AIRPLANEMODE_OFF or YCellular.AIRPLANEMODE_ON, according to
            % true if the airplane mode is active (radio turned off)
            %
            % On failure, throws an exception or returns YCellular.AIRPLANEMODE_INVALID.
            result = YoctoProxyAPI.EnumAirplaneMode(obj.InvokeMethod_D(458648010));
        end

        function set_airplaneMode(obj, newVal)
            % Changes the activation state of airplane mode (radio turned off).
            %
            % @param newval : either YCellular.AIRPLANEMODE_OFF or YCellular.AIRPLANEMODE_ON,
            % according to the activation state of airplane mode (radio turned off)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(87278108, newVal);
        end

        function result = get_enableData(obj)
            % Returns the condition for enabling IP data services (GPRS).
            % When data services are disabled, SMS are the only mean of communication.
            %
            % @return a value among YCellular.ENABLEDATA_HOMENETWORK, YCellular.ENABLEDATA_ROAMING,
            % YCellular.ENABLEDATA_NEVER and YCellular.ENABLEDATA_NEUTRALITY corresponding to the
            % condition for enabling IP data services (GPRS)
            %
            % On failure, throws an exception or returns YCellular.ENABLEDATA_INVALID.
            result = YoctoProxyAPI.EnumEnableData(obj.InvokeMethod_D(-169088672));
        end

        function set_enableData(obj, newVal)
            % Changes the condition for enabling IP data services (GPRS).
            % The service can be either fully deactivated, or limited to the SIM home network,
            % or enabled for all partner networks (roaming). Caution: enabling data services
            % on roaming networks may cause prohibitive communication costs !
            %
            % When data services are disabled, SMS are the only mean of communication.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a value among YCellular.ENABLEDATA_HOMENETWORK,
            % YCellular.ENABLEDATA_ROAMING, YCellular.ENABLEDATA_NEVER and
            % YCellular.ENABLEDATA_NEUTRALITY corresponding to the condition for enabling IP data services (GPRS)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-57427023, newVal);
        end

        function result = get.EnableData(obj)
            result = YoctoProxyAPI.EnumEnableData(obj.GetPropInt32(229750544));
        end

        function set.EnableData(obj, newVal)
            obj.EnableData = newVal;
            obj.SetPropInt32(229750544, newVal);
        end

        function result = get_apn(obj)
            % Returns the Access Point Name (APN) to be used, if needed.
            % When left blank, the APN suggested by the cell operator will be used.
            %
            % @return a string corresponding to the Access Point Name (APN) to be used, if needed
            %
            % On failure, throws an exception or returns YCellular.APN_INVALID.
            result = obj.InvokeMethod_S(-509984360);
        end

        function set_apn(obj, newVal)
            % Returns the Access Point Name (APN) to be used, if needed.
            % When left blank, the APN suggested by the cell operator will be used.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(735605293, newVal);
        end

        function result = get.Apn(obj)
            result = obj.GetPropString(187435852);
        end

        function set.Apn(obj, newVal)
            obj.Apn = newVal;
            obj.SetPropString(187435852, newVal);
        end

        function result = get_apnSecret(obj)
            % Returns an opaque string if APN authentication parameters have been configured
            % in the device, or an empty string otherwise.
            % To configure these parameters, use set_apnAuth().
            %
            % @return a string corresponding to an opaque string if APN authentication parameters
            % have been configured
            %         in the device, or an empty string otherwise
            %
            % On failure, throws an exception or returns YCellular.APNSECRET_INVALID.
            result = obj.InvokeMethod_S(1586901559);
        end

        function result = get_pingInterval(obj)
            % Returns the automated connectivity check interval, in seconds.
            %
            % @return an integer corresponding to the automated connectivity check interval, in seconds
            %
            % On failure, throws an exception or returns YCellular.PINGINTERVAL_INVALID.
            result = obj.InvokeMethod_D(1431397493);
        end

        function set_pingInterval(obj, newVal)
            % Changes the automated connectivity check interval, in seconds.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the automated connectivity check interval, in seconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1261752227, newVal);
        end

        function result = get.PingInterval(obj)
            result = obj.GetPropInt32(512343684);
        end

        function set.PingInterval(obj, newVal)
            obj.PingInterval = newVal;
            obj.SetPropInt32(512343684, newVal);
        end

        function result = get_dataSent(obj)
            % Returns the number of bytes sent so far.
            %
            % @return an integer corresponding to the number of bytes sent so far
            %
            % On failure, throws an exception or returns YCellular.DATASENT_INVALID.
            result = obj.InvokeMethod_D(1860782358);
        end

        function set_dataSent(obj, newVal)
            % Changes the value of the outgoing data counter.
            %
            % @param newval : an integer corresponding to the value of the outgoing data counter
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(714726057, newVal);
        end

        function result = get_dataReceived(obj)
            % Returns the number of bytes received so far.
            %
            % @return an integer corresponding to the number of bytes received so far
            %
            % On failure, throws an exception or returns YCellular.DATARECEIVED_INVALID.
            result = obj.InvokeMethod_D(-1110236170);
        end

        function set_dataReceived(obj, newVal)
            % Changes the value of the incoming data counter.
            %
            % @param newval : an integer corresponding to the value of the incoming data counter
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1548318688, newVal);
        end

        function result = sendPUK(obj, puk, newPin)
            % Sends a PUK code to unlock the SIM card after three failed PIN code attempts, and
            % setup a new PIN into the SIM card. Only ten consecutive tentatives are permitted:
            % after that, the SIM card will be blocked permanently without any mean of recovery
            % to use it again. Note that after calling this method, you have usually to invoke
            % method set_pin() to tell the YoctoHub which PIN to use in the future.
            %
            % @param puk : the SIM PUK code
            % @param newPin : new PIN code to configure into the SIM card
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(-2099275859, puk, newPin);
        end

        function result = set_apnAuth(obj, username, password)
            % Configure authentication parameters to connect to the APN. Both
            % PAP and CHAP authentication are supported.
            %
            % @param username : APN username
            % @param password : APN password
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(1156147632, username, password);
        end

        function result = clearDataCounters(obj)
            % Clear the transmitted data counters.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1188907209);
        end

        function result = _AT(obj, cmd)
            % Sends an AT command to the GSM module and returns the command output.
            % The command will only execute when the GSM module is in standard
            % command state, and should leave it in the exact same state.
            % Use this function with great care !
            %
            % @param cmd : the AT command to execute, like for instance: "+CCLK?".
            %
            % @return a string with the result of the commands. Empty lines are
            %         automatically removed from the output.
            result = obj.InvokeMethod_Ss(1386001681, cmd);
        end

        function result = get_availableOperators(obj)
            % Returns the list detected cell operators in the neighborhood.
            % This function will typically take between 30 seconds to 1 minute to
            % return. Note that any SIM card can usually only connect to specific
            % operators. All networks returned by this function might therefore
            % not be available for connection.
            %
            % @return a list of string (cell operator names).
            result = obj.InvokeMethod_xS(-1077064302);
        end

        function result = quickCellSurvey(obj)
            % Returns a list of nearby cellular antennas, as required for quick
            % geolocation of the device. The first cell listed is the serving
            % cell, and the next ones are the neighbor cells reported by the
            % serving cell.
            %
            % @return a list of YCellRecords.
            result = obj.InvokeMethod_xV(-938711712);
        end

        function result = decodePLMN(obj, mccmnc)
            % Returns the cell operator brand for a given MCC/MNC pair.
            %
            % @param mccmnc : a string starting with a MCC code followed by a MNC code,
            %
            % @return a string containing the corresponding cell operator brand name.
            result = obj.InvokeMethod_Ss(-1106449621, mccmnc);
        end

        function result = get_communicationProfiles(obj)
            % Returns the list available radio communication profiles, as a string array
            % (YoctoHub-GSM-4G only).
            % Each string is a made of a numerical ID, followed by a colon,
            % followed by the profile description.
            %
            % @return a list of string describing available radio communication profiles.
            result = obj.InvokeMethod_xS(1599782398);
        end

        % //--- (end of YCellular accessors declaration)
    end
end
