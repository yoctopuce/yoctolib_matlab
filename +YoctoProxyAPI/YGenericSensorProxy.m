% YGenericSensorProxy: GenericSensor control interface, available for instance in the Yocto-0-10V-Rx,
% the Yocto-4-20mA-Rx, the Yocto-Bridge or the Yocto-milliVolt-Rx
% 
% The YGenericSensorProxy class allows you to read and configure Yoctopuce signal transducers. It
% inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, to access the autonomous datalogger. This class adds the ability to configure the
% automatic conversion between the measured signal and the corresponding engineering unit.

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


% //--- (YGenericSensor declaration)
classdef YGenericSensorProxy < YoctoProxyAPI.YSensorProxy
    % YGenericSensorProxy: GenericSensor control interface, available for instance in the Yocto-0-10V-Rx,
    % the Yocto-4-20mA-Rx, the Yocto-Bridge or the Yocto-milliVolt-Rx
    % 
    % The YGenericSensorProxy class allows you to read and configure Yoctopuce signal transducers. It
    % inherits from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, to access the autonomous datalogger. This class adds the ability to configure the
    % automatic conversion between the measured signal and the corresponding engineering unit.

    properties (Transient, Nontunable)
        % SignalRange Input signal range used by the sensor
        SignalRange (1,:) char
        % ValueRange Physical value range measured by the sensor
        ValueRange (1,:) char
        % SignalBias Electric signal bias for zero shift adjustment
        SignalBias (1,1) double
        % SignalSampling Electric signal sampling method to use
        SignalSampling (1,1) YoctoProxyAPI.EnumSignalSampling
        % Enabled Activation state of this input
        Enabled (1,1) YoctoProxyAPI.EnumEnabled
    end

    properties (Transient, Nontunable, SetAccess = private)
        % SignalUnit Measuring unit of the electrical signal used by the sensor
        SignalUnit (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of YGenericSensor declaration)

    % //--- (YGenericSensor implementation)
    methods (Hidden)
        function obj = YGenericSensorProxy()
            % YGenericSensorProxy For internal use as System Object.
            % Use FindGenericSensor() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -347075075;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindGenericSensor(func)
            % FindGenericSensor Retrieve instances of YGenericSensorProxy
            obj = YoctoProxyAPI.YGenericSensorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindGenericSensor to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-347075075);
        end
    end
    % //--- (end of YGenericSensor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YGenericSensorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'GenericSensor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'GenericSensor', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'GenericSensor settings', ...
                'PropertyList', {'SignalUnit','SignalRange','ValueRange','SignalBias','SignalSampling','Enabled'});
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
        % //--- (YGenericSensor accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the measured value.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the measuring unit for the measured value
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_signalValue(obj)
            % Returns the current value of the electrical signal measured by the sensor.
            %
            % @return a floating point number corresponding to the current value of the electrical
            % signal measured by the sensor
            %
            % On failure, throws an exception or returns YGenericSensor.SIGNALVALUE_INVALID.
            result = obj.InvokeMethod_F(-2090205936);
        end

        function result = get_signalUnit(obj)
            % Returns the measuring unit of the electrical signal used by the sensor.
            %
            % @return a string corresponding to the measuring unit of the electrical signal used by the sensor
            %
            % On failure, throws an exception or returns YGenericSensor.SIGNALUNIT_INVALID.
            result = obj.InvokeMethod_S(-1412085153);
        end

        function result = get.SignalUnit(obj)
            result = obj.GetPropString(-2106997222);
        end

        function result = get_signalRange(obj)
            % Returns the input signal range used by the sensor.
            %
            % @return a string corresponding to the input signal range used by the sensor
            %
            % On failure, throws an exception or returns YGenericSensor.SIGNALRANGE_INVALID.
            result = obj.InvokeMethod_S(-1708396132);
        end

        function set_signalRange(obj, newVal)
            % Changes the input signal range used by the sensor.
            % When the input signal gets out of the planned range, the output value
            % will be set to an arbitrary large value, whose sign indicates the direction
            % of the range overrun.
            %
            % For a 4-20mA sensor, the default input signal range is "4...20".
            % For a 0-10V sensor, the default input signal range is "0.1...10".
            % For numeric communication interfaces, the default input signal range is
            % "-999999.999...999999.999".
            %
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the input signal range used by the sensor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-987992090, newVal);
        end

        function result = get.SignalRange(obj)
            result = obj.GetPropString(-1663471177);
        end

        function set.SignalRange(obj, newVal)
            obj.SignalRange = newVal;
            obj.SetPropString(-1663471177, newVal);
        end

        function result = get_valueRange(obj)
            % Returns the physical value range measured by the sensor.
            %
            % @return a string corresponding to the physical value range measured by the sensor
            %
            % On failure, throws an exception or returns YGenericSensor.VALUERANGE_INVALID.
            result = obj.InvokeMethod_S(1090965611);
        end

        function set_valueRange(obj, newVal)
            % Changes the output value range, corresponding to the physical value measured
            % by the sensor. The default output value range is the same as the input signal
            % range (1:1 mapping), but you can change it so that the function automatically
            % computes the physical value encoded by the input signal. Be aware that, as a
            % side effect, the range modification may automatically modify the display resolution.
            %
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the output value range, corresponding to the
            % physical value measured
            %         by the sensor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1216250554, newVal);
        end

        function result = get.ValueRange(obj)
            result = obj.GetPropString(-372155041);
        end

        function set.ValueRange(obj, newVal)
            obj.ValueRange = newVal;
            obj.SetPropString(-372155041, newVal);
        end

        function set_signalBias(obj, newVal)
            % Changes the electric signal bias for zero shift adjustment.
            % If your electric signal reads positive when it should be zero, setup
            % a positive signalBias of the same value to fix the zero shift.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the electric signal bias for
            % zero shift adjustment
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1552405444, newVal);
        end

        function result = get_signalBias(obj)
            % Returns the electric signal bias for zero shift adjustment.
            % A positive bias means that the signal is over-reporting the measure,
            % while a negative bias means that the signal is under-reporting the measure.
            %
            % @return a floating point number corresponding to the electric signal bias for zero shift adjustment
            %
            % On failure, throws an exception or returns YGenericSensor.SIGNALBIAS_INVALID.
            result = obj.InvokeMethod_F(-1442808083);
        end

        function result = get.SignalBias(obj)
            result = obj.GetPropDouble(475373586);
        end

        function set.SignalBias(obj, newVal)
            obj.SignalBias = newVal;
            obj.SetPropDouble(475373586, newVal);
        end

        function result = get_signalSampling(obj)
            % Returns the electric signal sampling method to use.
            % The HIGH_RATE method uses the highest sampling frequency, without any filtering.
            % The HIGH_RATE_FILTERED method adds a windowed 7-sample median filter.
            % The LOW_NOISE method uses a reduced acquisition frequency to reduce noise.
            % The LOW_NOISE_FILTERED method combines a reduced frequency with the median filter
            % to get measures as stable as possible when working on a noisy signal.
            %
            % @return a value among YGenericSensor.SIGNALSAMPLING_HIGH_RATE,
            % YGenericSensor.SIGNALSAMPLING_HIGH_RATE_FILTERED, YGenericSensor.SIGNALSAMPLING_LOW_NOISE,
            % YGenericSensor.SIGNALSAMPLING_LOW_NOISE_FILTERED, YGenericSensor.SIGNALSAMPLING_HIGHEST_RATE
            % and YGenericSensor.SIGNALSAMPLING_AC corresponding to the electric signal sampling method to use
            %
            % On failure, throws an exception or returns YGenericSensor.SIGNALSAMPLING_INVALID.
            result = YoctoProxyAPI.EnumSignalSampling(obj.InvokeMethod_D(1665292824));
        end

        function set_signalSampling(obj, newVal)
            % Changes the electric signal sampling method to use.
            % The HIGH_RATE method uses the highest sampling frequency, without any filtering.
            % The HIGH_RATE_FILTERED method adds a windowed 7-sample median filter.
            % The LOW_NOISE method uses a reduced acquisition frequency to reduce noise.
            % The LOW_NOISE_FILTERED method combines a reduced frequency with the median filter
            % to get measures as stable as possible when working on a noisy signal.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a value among YGenericSensor.SIGNALSAMPLING_HIGH_RATE,
            % YGenericSensor.SIGNALSAMPLING_HIGH_RATE_FILTERED, YGenericSensor.SIGNALSAMPLING_LOW_NOISE,
            % YGenericSensor.SIGNALSAMPLING_LOW_NOISE_FILTERED, YGenericSensor.SIGNALSAMPLING_HIGHEST_RATE
            % and YGenericSensor.SIGNALSAMPLING_AC corresponding to the electric signal sampling method to use
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-167298388, newVal);
        end

        function result = get.SignalSampling(obj)
            result = YoctoProxyAPI.EnumSignalSampling(obj.GetPropInt32(2082678665));
        end

        function set.SignalSampling(obj, newVal)
            obj.SignalSampling = newVal;
            obj.SetPropInt32(2082678665, newVal);
        end

        function result = get_enabled(obj)
            % Returns the activation state of this input.
            %
            % @return either YGenericSensor.ENABLED_FALSE or YGenericSensor.ENABLED_TRUE, according
            % to the activation state of this input
            %
            % On failure, throws an exception or returns YGenericSensor.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Changes the activation state of this input. When an input is disabled,
            % its value is no more updated. On some devices, disabling an input can
            % improve the refresh rate of the other active inputs.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : either YGenericSensor.ENABLED_FALSE or YGenericSensor.ENABLED_TRUE,
            % according to the activation state of this input
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function result = get.Enabled(obj)
            result = YoctoProxyAPI.EnumEnabled(obj.GetPropInt32(-1622900200));
        end

        function set.Enabled(obj, newVal)
            obj.Enabled = newVal;
            obj.SetPropInt32(-1622900200, newVal);
        end

        function result = zeroAdjust(obj)
            % Adjusts the signal bias so that the current signal value is need
            % precisely as zero. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2126615366);
        end

        % //--- (end of YGenericSensor accessors declaration)
    end
end
