% YPowerSupplyProxy: regulated power supply control interface
% 
% The YPowerSupplyProxy class allows you to drive a Yoctopuce power supply. It can be use to change
% the voltage and current limits, and to enable/disable the output.

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


% //--- (YPowerSupply declaration)
classdef YPowerSupplyProxy < YoctoProxyAPI.YFunctionProxy
    % YPowerSupplyProxy: regulated power supply control interface
    % 
    % The YPowerSupplyProxy class allows you to drive a Yoctopuce power supply. It can be use to change
    % the voltage and current limits, and to enable/disable the output.

    properties (Transient, Nontunable)
        % VoltageLimitAtStartUp Selected voltage limit at device startup, in V
        VoltageLimitAtStartUp (1,1) double
        % CurrentLimitAtStartUp Selected current limit at device startup, in mA
        CurrentLimitAtStartUp (1,1) double
        % PowerOutputAtStartUp Power supply output switch state
        PowerOutputAtStartUp (1,1) YoctoProxyAPI.EnumPowerOutputAtStartUp
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPowerSupply declaration)

    % //--- (YPowerSupply implementation)
    methods (Hidden)
        function obj = YPowerSupplyProxy()
            % YPowerSupplyProxy For internal use as System Object.
            % Use FindPowerSupply() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 547144429;
        end
    end

    methods (Static)
        function obj = FindPowerSupply(func)
            % FindPowerSupply Retrieve instances of YPowerSupplyProxy
            obj = YoctoProxyAPI.YPowerSupplyProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPowerSupply to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(547144429);
        end
    end
    % //--- (end of YPowerSupply implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPowerSupplyProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'PowerSupply');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'PowerSupply', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'PowerSupply settings', ...
                'PropertyList', {'VoltageLimitAtStartUp','CurrentLimitAtStartUp','PowerOutputAtStartUp'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(~)
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [] = getInputNamesImpl(~)
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YPowerSupply accessors declaration)

        function set_voltageLimit(obj, newVal)
            % Changes the voltage limit, in V.
            %
            % @param newval : a floating point number corresponding to the voltage limit, in V
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1785777960, newVal);
        end

        function result = get_voltageLimit(obj)
            % Returns the voltage limit, in V.
            %
            % @return a floating point number corresponding to the voltage limit, in V
            %
            % On failure, throws an exception or returns YPowerSupply.VOLTAGELIMIT_INVALID.
            result = obj.InvokeMethod_F(-1947559154);
        end

        function set_currentLimit(obj, newVal)
            % Changes the current limit, in mA.
            %
            % @param newval : a floating point number corresponding to the current limit, in mA
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-519868144, newVal);
        end

        function result = get_currentLimit(obj)
            % Returns the current limit, in mA.
            %
            % @return a floating point number corresponding to the current limit, in mA
            %
            % On failure, throws an exception or returns YPowerSupply.CURRENTLIMIT_INVALID.
            result = obj.InvokeMethod_F(-10036538);
        end

        function result = get_powerOutput(obj)
            % Returns the power supply output switch state.
            %
            % @return either YPowerSupply.POWEROUTPUT_OFF or YPowerSupply.POWEROUTPUT_ON, according
            % to the power supply output switch state
            %
            % On failure, throws an exception or returns YPowerSupply.POWEROUTPUT_INVALID.
            result = YoctoProxyAPI.EnumPowerOutput(obj.InvokeMethod_D(-1635224894));
        end

        function set_powerOutput(obj, newVal)
            % Changes the power supply output switch state.
            %
            % @param newval : either YPowerSupply.POWEROUTPUT_OFF or YPowerSupply.POWEROUTPUT_ON,
            % according to the power supply output switch state
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1044386632, newVal);
        end

        function result = get_measuredVoltage(obj)
            % Returns the measured output voltage, in V.
            %
            % @return a floating point number corresponding to the measured output voltage, in V
            %
            % On failure, throws an exception or returns YPowerSupply.MEASUREDVOLTAGE_INVALID.
            result = obj.InvokeMethod_F(1595610039);
        end

        function result = get_measuredCurrent(obj)
            % Returns the measured output current, in mA.
            %
            % @return a floating point number corresponding to the measured output current, in mA
            %
            % On failure, throws an exception or returns YPowerSupply.MEASUREDCURRENT_INVALID.
            result = obj.InvokeMethod_F(551755241);
        end

        function result = get_inputVoltage(obj)
            % Returns the measured input voltage, in V.
            %
            % @return a floating point number corresponding to the measured input voltage, in V
            %
            % On failure, throws an exception or returns YPowerSupply.INPUTVOLTAGE_INVALID.
            result = obj.InvokeMethod_F(-1879749387);
        end

        function set_voltageLimitAtStartUp(obj, newVal)
            % Changes the voltage set point at device start up. Remember to call the matching
            % module saveToFlash() method, otherwise this call has no effect.
            %
            % @param newval : a floating point number corresponding to the voltage set point at device start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(358177402, newVal);
        end

        function result = get_voltageLimitAtStartUp(obj)
            % Returns the selected voltage limit at device startup, in V.
            %
            % @return a floating point number corresponding to the selected voltage limit at device startup, in V
            %
            % On failure, throws an exception or returns YPowerSupply.VOLTAGELIMITATSTARTUP_INVALID.
            result = obj.InvokeMethod_F(285391522);
        end

        function result = get.VoltageLimitAtStartUp(obj)
            result = obj.GetPropDouble(295995621);
        end

        function set.VoltageLimitAtStartUp(obj, newVal)
            obj.VoltageLimitAtStartUp = newVal;
            obj.SetPropDouble(295995621, newVal);
        end

        function set_currentLimitAtStartUp(obj, newVal)
            % Changes the current limit at device start up. Remember to call the matching
            % module saveToFlash() method, otherwise this call has no effect.
            %
            % @param newval : a floating point number corresponding to the current limit at device start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(745862664, newVal);
        end

        function result = get_currentLimitAtStartUp(obj)
            % Returns the selected current limit at device startup, in mA.
            %
            % @return a floating point number corresponding to the selected current limit at device startup, in mA
            %
            % On failure, throws an exception or returns YPowerSupply.CURRENTLIMITATSTARTUP_INVALID.
            result = obj.InvokeMethod_F(674174672);
        end

        function result = get.CurrentLimitAtStartUp(obj)
            result = obj.GetPropDouble(-1172706664);
        end

        function set.CurrentLimitAtStartUp(obj, newVal)
            obj.CurrentLimitAtStartUp = newVal;
            obj.SetPropDouble(-1172706664, newVal);
        end

        function result = get_powerOutputAtStartUp(obj)
            % Returns the power supply output switch state.
            %
            % @return either YPowerSupply.POWEROUTPUTATSTARTUP_OFF or
            % YPowerSupply.POWEROUTPUTATSTARTUP_ON, according to the power supply output switch state
            %
            % On failure, throws an exception or returns YPowerSupply.POWEROUTPUTATSTARTUP_INVALID.
            result = YoctoProxyAPI.EnumPowerOutputAtStartUp(obj.InvokeMethod_D(1990658881));
        end

        function set_powerOutputAtStartUp(obj, newVal)
            % Changes the power supply output switch state at device start up. Remember to call the matching
            % module saveToFlash() method, otherwise this call has no effect.
            %
            % @param newval : either YPowerSupply.POWEROUTPUTATSTARTUP_OFF or
            % YPowerSupply.POWEROUTPUTATSTARTUP_ON, according to the power supply output switch state
            % at device start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-854596049, newVal);
        end

        function result = get.PowerOutputAtStartUp(obj)
            result = YoctoProxyAPI.EnumPowerOutputAtStartUp(obj.GetPropInt32(427039869));
        end

        function set.PowerOutputAtStartUp(obj, newVal)
            obj.PowerOutputAtStartUp = newVal;
            obj.SetPropInt32(427039869, newVal);
        end

        function result = voltageMove(obj, V_target, ms_duration)
            % Performs a smooth transition of output voltage. Any explicit voltage
            % change cancels any ongoing transition process.
            %
            % @param V_target   : new output voltage value at the end of the transition
            %         (floating-point number, representing the end voltage in V)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            result = obj.InvokeMethod_Dfd(-253308149, V_target, ms_duration);
        end

        % //--- (end of YPowerSupply accessors declaration)
    end
end
