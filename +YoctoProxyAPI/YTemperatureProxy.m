% YTemperatureProxy: temperature sensor control interface, available for instance in the
% Yocto-Meteo-V2, the Yocto-PT100, the Yocto-Temperature or the Yocto-Thermocouple
% 
% The YTemperatureProxy class allows you to read and configure Yoctopuce temperature sensors. It
% inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger. This class adds the ability to configure some
% specific parameters for some sensors (connection type, temperature mapping table).

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


% //--- (YTemperature declaration)
classdef YTemperatureProxy < YoctoProxyAPI.YSensorProxy
    % YTemperatureProxy: temperature sensor control interface, available for instance in the
    % Yocto-Meteo-V2, the Yocto-PT100, the Yocto-Temperature or the Yocto-Thermocouple
    % 
    % The YTemperatureProxy class allows you to read and configure Yoctopuce temperature sensors. It
    % inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger. This class adds the ability to configure some
    % specific parameters for some sensors (connection type, temperature mapping table).

    properties (Transient, Nontunable)
        % SensorType Temperature sensor type
        SensorType (1,1) YoctoProxyAPI.EnumSensorType
    end

    properties (Transient, Nontunable, SetAccess = private)
        % SignalUnit Measuring unit of the electrical signal used by the sensor
        SignalUnit (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of YTemperature declaration)

    % //--- (YTemperature implementation)
    methods (Hidden)
        function obj = YTemperatureProxy()
            % YTemperatureProxy For internal use as System Object.
            % Use FindTemperature() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 953329083;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindTemperature(func)
            % FindTemperature Retrieve instances of YTemperatureProxy
            obj = YoctoProxyAPI.YTemperatureProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindTemperature to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(953329083);
        end
    end
    % //--- (end of YTemperature implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YTemperatureProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Temperature');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Temperature', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Temperature settings', ...
                'PropertyList', {'SensorType','SignalUnit'});
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
        % //--- (YTemperature accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the measured temperature. That unit is a string.
            % If that strings end with the letter F all temperatures values will returned in
            % Fahrenheit degrees. If that String ends with the letter K all values will be
            % returned in Kelvin degrees. If that string ends with the letter C all values will be
            % returned in Celsius degrees.  If the string ends with any other character the
            % change will be ignored. Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            % WARNING: if a specific calibration is defined for the temperature function, a
            % unit system change will probably break it.
            %
            % @param newval : a string corresponding to the measuring unit for the measured temperature
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_sensorType(obj)
            % Returns the temperature sensor type.
            %
            % @return a value among YTemperature.SENSORTYPE_DIGITAL, YTemperature.SENSORTYPE_TYPE_K,
            % YTemperature.SENSORTYPE_TYPE_E, YTemperature.SENSORTYPE_TYPE_J,
            % YTemperature.SENSORTYPE_TYPE_N, YTemperature.SENSORTYPE_TYPE_R,
            % YTemperature.SENSORTYPE_TYPE_S, YTemperature.SENSORTYPE_TYPE_T,
            % YTemperature.SENSORTYPE_PT100_4WIRES, YTemperature.SENSORTYPE_PT100_3WIRES,
            % YTemperature.SENSORTYPE_PT100_2WIRES, YTemperature.SENSORTYPE_RES_OHM,
            % YTemperature.SENSORTYPE_RES_NTC, YTemperature.SENSORTYPE_RES_LINEAR,
            % YTemperature.SENSORTYPE_RES_INTERNAL, YTemperature.SENSORTYPE_IR,
            % YTemperature.SENSORTYPE_RES_PT1000 and YTemperature.SENSORTYPE_CHANNEL_OFF
            % corresponding to the temperature sensor type
            %
            % On failure, throws an exception or returns YTemperature.SENSORTYPE_INVALID.
            result = YoctoProxyAPI.EnumSensorType(obj.InvokeMethod_D(-2004586633));
        end

        function set_sensorType(obj, newVal)
            % Changes the temperature sensor type.  This function is used
            % to define the type of thermocouple (K,E...) used with the device.
            % It has no effect if module is using a digital sensor or a thermistor.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YTemperature.SENSORTYPE_DIGITAL,
            % YTemperature.SENSORTYPE_TYPE_K, YTemperature.SENSORTYPE_TYPE_E,
            % YTemperature.SENSORTYPE_TYPE_J, YTemperature.SENSORTYPE_TYPE_N,
            % YTemperature.SENSORTYPE_TYPE_R, YTemperature.SENSORTYPE_TYPE_S,
            % YTemperature.SENSORTYPE_TYPE_T, YTemperature.SENSORTYPE_PT100_4WIRES,
            % YTemperature.SENSORTYPE_PT100_3WIRES, YTemperature.SENSORTYPE_PT100_2WIRES,
            % YTemperature.SENSORTYPE_RES_OHM, YTemperature.SENSORTYPE_RES_NTC,
            % YTemperature.SENSORTYPE_RES_LINEAR, YTemperature.SENSORTYPE_RES_INTERNAL,
            % YTemperature.SENSORTYPE_IR, YTemperature.SENSORTYPE_RES_PT1000 and
            % YTemperature.SENSORTYPE_CHANNEL_OFF corresponding to the temperature sensor type
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2114175578, newVal);
        end

        function result = get.SensorType(obj)
            result = YoctoProxyAPI.EnumSensorType(obj.GetPropInt32(-928726846));
        end

        function set.SensorType(obj, newVal)
            obj.SensorType = newVal;
            obj.SetPropInt32(-928726846, newVal);
        end

        function result = get_signalValue(obj)
            % Returns the current value of the electrical signal measured by the sensor.
            %
            % @return a floating point number corresponding to the current value of the electrical
            % signal measured by the sensor
            %
            % On failure, throws an exception or returns YTemperature.SIGNALVALUE_INVALID.
            result = obj.InvokeMethod_F(-2090205936);
        end

        function result = get_signalUnit(obj)
            % Returns the measuring unit of the electrical signal used by the sensor.
            %
            % @return a string corresponding to the measuring unit of the electrical signal used by the sensor
            %
            % On failure, throws an exception or returns YTemperature.SIGNALUNIT_INVALID.
            result = obj.InvokeMethod_S(-1412085153);
        end

        function result = get.SignalUnit(obj)
            result = obj.GetPropString(-2106997222);
        end

        function result = set_ntcParameters(obj, res25, beta)
            % Configures NTC thermistor parameters in order to properly compute the temperature from
            % the measured resistance. For increased precision, you can enter a complete mapping
            % table using set_thermistorResponseTable. This function can only be used with a
            % temperature sensor based on thermistors.
            %
            % @param res25 : thermistor resistance at 25 degrees Celsius
            % @param beta : Beta value
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dff(1783917392, res25, beta);
        end

        function result = set_thermistorResponseTable(obj, tempValues, resValues)
            % Records a thermistor response table, in order to interpolate the temperature from
            % the measured resistance. This function can only be used with a temperature
            % sensor based on thermistors.
            %
            % @param tempValues : array of floating point numbers, corresponding to all
            %         temperatures (in degrees Celsius) for which the resistance of the
            %         thermistor is specified.
            % @param resValues : array of floating point numbers, corresponding to the resistance
            %         values (in Ohms) for each of the temperature included in the first
            %         argument, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(1743863036, tempValues, resValues);
        end

        % //--- (end of YTemperature accessors declaration)
    end
end
