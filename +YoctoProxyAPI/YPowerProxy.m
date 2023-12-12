% YPowerProxy: electrical power sensor control interface, available for instance in the Yocto-Watt
% 
% The YPowerProxy class allows you to read and configure Yoctopuce electrical power sensors. It
% inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger. This class adds the ability to access the
% energy counter and the power factor.

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


% //--- (YPower declaration)
classdef YPowerProxy < YoctoProxyAPI.YSensorProxy
    % YPowerProxy: electrical power sensor control interface, available for instance in the Yocto-Watt
    % 
    % The YPowerProxy class allows you to read and configure Yoctopuce electrical power sensors. It
    % inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger. This class adds the ability to access the
    % energy counter and the power factor.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPower declaration)

    % //--- (YPower implementation)
    methods (Hidden)
        function obj = YPowerProxy()
            % YPowerProxy For internal use as System Object.
            % Use FindPower() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 1783312036;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindPower(func)
            % FindPower Retrieve instances of YPowerProxy
            obj = YoctoProxyAPI.YPowerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPower to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1783312036);
        end
    end
    % //--- (end of YPower implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPowerProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Power');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Power', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Power settings', ...
                'PropertyList', {});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropDouble(1444001205);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'double';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'CurrentValue';
        end
    end

    methods
        % //--- (YPower accessors declaration)

        function result = get_powerFactor(obj)
            % Returns the power factor (PF), i.e. ratio between the active power consumed (in W)
            % and the apparent power provided (VA).
            %
            % @return a floating point number corresponding to the power factor (PF), i.e
            %
            % On failure, throws an exception or returns YPower.POWERFACTOR_INVALID.
            result = obj.InvokeMethod_F(740487090);
        end

        function result = get_cosPhi(obj)
            % Returns the Displacement Power factor (DPF), i.e. cosine of the phase shift between
            % the voltage and current fundamentals.
            % On the Yocto-Watt (V1), the value returned by this method correponds to the
            % power factor as this device is cannot estimate the true DPF.
            %
            % @return a floating point number corresponding to the Displacement Power factor (DPF), i.e
            %
            % On failure, throws an exception or returns YPower.COSPHI_INVALID.
            result = obj.InvokeMethod_F(-639470758);
        end

        function result = get_meter(obj)
            % Returns the energy counter, maintained by the wattmeter by integrating the
            % power consumption over time. This is the sum of forward and backwad energy transfers,
            % if you are insterested in only one direction, use  get_receivedEnergyMeter() or
            % get_deliveredEnergyMeter(). Note that this counter is reset at each start of the device.
            %
            % @return a floating point number corresponding to the energy counter, maintained by the
            % wattmeter by integrating the
            %         power consumption over time
            %
            % On failure, throws an exception or returns YPower.METER_INVALID.
            result = obj.InvokeMethod_F(1140090146);
        end

        function result = get_deliveredEnergyMeter(obj)
            % Returns the energy counter, maintained by the wattmeter by integrating the power
            % consumption over time,
            % but only when positive. Note that this counter is reset at each start of the device.
            %
            % @return a floating point number corresponding to the energy counter, maintained by the
            % wattmeter by integrating the power consumption over time,
            %         but only when positive
            %
            % On failure, throws an exception or returns YPower.DELIVEREDENERGYMETER_INVALID.
            result = obj.InvokeMethod_F(559481782);
        end

        function result = get_receivedEnergyMeter(obj)
            % Returns the energy counter, maintained by the wattmeter by integrating the power
            % consumption over time,
            % but only when negative. Note that this counter is reset at each start of the device.
            %
            % @return a floating point number corresponding to the energy counter, maintained by the
            % wattmeter by integrating the power consumption over time,
            %         but only when negative
            %
            % On failure, throws an exception or returns YPower.RECEIVEDENERGYMETER_INVALID.
            result = obj.InvokeMethod_F(1842528545);
        end

        function result = get_meterTimer(obj)
            % Returns the elapsed time since last energy counter reset, in seconds.
            %
            % @return an integer corresponding to the elapsed time since last energy counter reset, in seconds
            %
            % On failure, throws an exception or returns YPower.METERTIMER_INVALID.
            result = obj.InvokeMethod_D(-1711119238);
        end

        function result = reset(obj)
            % Resets the energy counters.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        % //--- (end of YPower accessors declaration)
    end
end
