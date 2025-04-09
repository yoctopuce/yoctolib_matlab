% YPwmInputProxy: PWM input control interface, available for instance in the Yocto-PWM-Rx
% 
% The YPwmInputProxy class allows you to read and configure Yoctopuce PWM inputs. It inherits from
% <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
% to access the autonomous datalogger. This class adds the ability to configure the signal parameter
% used to transmit information: the duty cycle, the frequency or the pulse width.

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


% //--- (YPwmInput declaration)
classdef YPwmInputProxy < YoctoProxyAPI.YSensorProxy
    % YPwmInputProxy: PWM input control interface, available for instance in the Yocto-PWM-Rx
    % 
    % The YPwmInputProxy class allows you to read and configure Yoctopuce PWM inputs. It inherits from
    % <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
    % to access the autonomous datalogger. This class adds the ability to configure the signal parameter
    % used to transmit information: the duty cycle, the frequency or the pulse width.

    properties (Transient, Nontunable)
        % PwmReportMode Parameter (frequency/duty cycle, pulse width, edges count) returned by the get_currentValue function and callbacks
        PwmReportMode (1,1) YoctoProxyAPI.EnumPwmReportMode
        % DebouncePeriod Shortest expected pulse duration, in ms
        DebouncePeriod (1,1) int32
        % MinFrequency Minimum detected frequency, in Hz
        MinFrequency (1,1) double
        % Bandwidth Input signal sampling rate, in kHz
        Bandwidth (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPwmInput declaration)

    % //--- (YPwmInput implementation)
    methods (Hidden)
        function obj = YPwmInputProxy()
            % YPwmInputProxy For internal use as System Object.
            % Use FindPwmInput() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 1919562816;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindPwmInput(func)
            % FindPwmInput Retrieve instances of YPwmInputProxy
            obj = YoctoProxyAPI.YPwmInputProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPwmInput to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1919562816);
        end
    end
    % //--- (end of YPwmInput implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPwmInputProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'PwmInput');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'PwmInput', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'PwmInput settings', ...
                'PropertyList', {'PwmReportMode','DebouncePeriod','MinFrequency','Bandwidth'});
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
        % //--- (YPwmInput accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the measured quantity. That unit
            % is just a string which is automatically initialized each time
            % the measurement mode is changed. But is can be set to an
            % arbitrary value.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the measuring unit for the measured quantity
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_dutyCycle(obj)
            % Returns the PWM duty cycle, in per cents.
            %
            % @return a floating point number corresponding to the PWM duty cycle, in per cents
            %
            % On failure, throws an exception or returns YPwmInput.DUTYCYCLE_INVALID.
            result = obj.InvokeMethod_F(-970911217);
        end

        function result = get_pulseDuration(obj)
            % Returns the PWM pulse length in milliseconds, as a floating point number.
            %
            % @return a floating point number corresponding to the PWM pulse length in milliseconds,
            % as a floating point number
            %
            % On failure, throws an exception or returns YPwmInput.PULSEDURATION_INVALID.
            result = obj.InvokeMethod_F(1322923076);
        end

        function result = get_frequency(obj)
            % Returns the PWM frequency in Hz.
            %
            % @return a floating point number corresponding to the PWM frequency in Hz
            %
            % On failure, throws an exception or returns YPwmInput.FREQUENCY_INVALID.
            result = obj.InvokeMethod_F(514269515);
        end

        function result = get_period(obj)
            % Returns the PWM period in milliseconds.
            %
            % @return a floating point number corresponding to the PWM period in milliseconds
            %
            % On failure, throws an exception or returns YPwmInput.PERIOD_INVALID.
            result = obj.InvokeMethod_F(2110044260);
        end

        function result = get_pulseCounter(obj)
            % Returns the pulse counter value. Actually that
            % counter is incremented twice per period. That counter is
            % limited  to 1 billion.
            %
            % @return an integer corresponding to the pulse counter value
            %
            % On failure, throws an exception or returns YPwmInput.PULSECOUNTER_INVALID.
            result = obj.InvokeMethod_Q(335219165);
        end

        function result = get_pulseTimer(obj)
            % Returns the timer of the pulses counter (ms).
            %
            % @return an integer corresponding to the timer of the pulses counter (ms)
            %
            % On failure, throws an exception or returns YPwmInput.PULSETIMER_INVALID.
            result = obj.InvokeMethod_Q(1447258781);
        end

        function result = get_pwmReportMode(obj)
            % Returns the parameter (frequency/duty cycle, pulse width, edges count) returned by the
            % get_currentValue function and callbacks. Attention
            %
            % @return a value among YPwmInput.PWMREPORTMODE_PWM_DUTYCYCLE,
            % YPwmInput.PWMREPORTMODE_PWM_FREQUENCY, YPwmInput.PWMREPORTMODE_PWM_PULSEDURATION,
            % YPwmInput.PWMREPORTMODE_PWM_EDGECOUNT, YPwmInput.PWMREPORTMODE_PWM_PULSECOUNT,
            % YPwmInput.PWMREPORTMODE_PWM_CPS, YPwmInput.PWMREPORTMODE_PWM_CPM,
            % YPwmInput.PWMREPORTMODE_PWM_STATE, YPwmInput.PWMREPORTMODE_PWM_FREQ_CPS,
            % YPwmInput.PWMREPORTMODE_PWM_FREQ_CPM and YPwmInput.PWMREPORTMODE_PWM_PERIODCOUNT
            % corresponding to the parameter (frequency/duty cycle, pulse width, edges count)
            % returned by the get_currentValue function and callbacks
            %
            % On failure, throws an exception or returns YPwmInput.PWMREPORTMODE_INVALID.
            result = YoctoProxyAPI.EnumPwmReportMode(obj.InvokeMethod_D(97078582));
        end

        function set_pwmReportMode(obj, newVal)
            % Changes the  parameter  type (frequency/duty cycle, pulse width, or edge count)
            % returned by the get_currentValue function and callbacks.
            % The edge count value is limited to the 6 lowest digits. For values greater than one
            % million, use get_pulseCounter().
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among YPwmInput.PWMREPORTMODE_PWM_DUTYCYCLE,
            % YPwmInput.PWMREPORTMODE_PWM_FREQUENCY, YPwmInput.PWMREPORTMODE_PWM_PULSEDURATION,
            % YPwmInput.PWMREPORTMODE_PWM_EDGECOUNT, YPwmInput.PWMREPORTMODE_PWM_PULSECOUNT,
            % YPwmInput.PWMREPORTMODE_PWM_CPS, YPwmInput.PWMREPORTMODE_PWM_CPM,
            % YPwmInput.PWMREPORTMODE_PWM_STATE, YPwmInput.PWMREPORTMODE_PWM_FREQ_CPS,
            % YPwmInput.PWMREPORTMODE_PWM_FREQ_CPM and YPwmInput.PWMREPORTMODE_PWM_PERIODCOUNT
            % corresponding to the  parameter  type (frequency/duty cycle, pulse width, or edge
            % count) returned by the get_currentValue function and callbacks
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-997369066, newVal);
        end

        function result = get.PwmReportMode(obj)
            result = YoctoProxyAPI.EnumPwmReportMode(obj.GetPropInt32(-338484999));
        end

        function set.PwmReportMode(obj, newVal)
            obj.PwmReportMode = newVal;
            obj.SetPropInt32(-338484999, newVal);
        end

        function result = get_debouncePeriod(obj)
            % Returns the shortest expected pulse duration, in ms. Any shorter pulse will be
            % automatically ignored (debounce).
            %
            % @return an integer corresponding to the shortest expected pulse duration, in ms
            %
            % On failure, throws an exception or returns YPwmInput.DEBOUNCEPERIOD_INVALID.
            result = obj.InvokeMethod_D(-1371967077);
        end

        function set_debouncePeriod(obj, newVal)
            % Changes the shortest expected pulse duration, in ms. Any shorter pulse will be
            % automatically ignored (debounce).
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the shortest expected pulse duration, in ms
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(997986607, newVal);
        end

        function result = get.DebouncePeriod(obj)
            result = obj.GetPropInt32(-305491294);
        end

        function set.DebouncePeriod(obj, newVal)
            obj.DebouncePeriod = newVal;
            obj.SetPropInt32(-305491294, newVal);
        end

        function set_minFrequency(obj, newVal)
            % Changes the minimum detected frequency, in Hz. Slower signals will be consider as zero frequency.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the minimum detected frequency, in Hz
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-255885209, newVal);
        end

        function result = get_minFrequency(obj)
            % Returns the minimum detected frequency, in Hz. Slower signals will be consider as zero frequency.
            %
            % @return a floating point number corresponding to the minimum detected frequency, in Hz
            %
            % On failure, throws an exception or returns YPwmInput.MINFREQUENCY_INVALID.
            result = obj.InvokeMethod_F(-287691855);
        end

        function result = get.MinFrequency(obj)
            result = obj.GetPropDouble(1932116497);
        end

        function set.MinFrequency(obj, newVal)
            obj.MinFrequency = newVal;
            obj.SetPropDouble(1932116497, newVal);
        end

        function result = get_bandwidth(obj)
            % Returns the input signal sampling rate, in kHz.
            %
            % @return an integer corresponding to the input signal sampling rate, in kHz
            %
            % On failure, throws an exception or returns YPwmInput.BANDWIDTH_INVALID.
            result = obj.InvokeMethod_D(1075889934);
        end

        function set_bandwidth(obj, newVal)
            % Changes the input signal sampling rate, measured in kHz.
            % A lower sampling frequency can be used to hide hide-frequency bounce effects,
            % for instance on electromechanical contacts, but limits the measure resolution.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the input signal sampling rate, measured in kHz
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1253040662, newVal);
        end

        function result = get.Bandwidth(obj)
            result = obj.GetPropInt32(150493132);
        end

        function set.Bandwidth(obj, newVal)
            obj.Bandwidth = newVal;
            obj.SetPropInt32(150493132, newVal);
        end

        function result = get_edgesPerPeriod(obj)
            % Returns the number of edges detected per preiod. For a clean PWM signal, this should be exactly two,
            % but in cas the signal is created by a mechanical contact with bounces, it can get higher.
            %
            % @return an integer corresponding to the number of edges detected per preiod
            %
            % On failure, throws an exception or returns YPwmInput.EDGESPERPERIOD_INVALID.
            result = obj.InvokeMethod_D(1472768428);
        end

        function result = resetPeriodDetection(obj)
            % Resets the periodicity detection algorithm.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1144754658);
        end

        function result = resetCounter(obj)
            % Resets the pulse counter value as well as its timer.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1034161823);
        end

        % //--- (end of YPwmInput accessors declaration)
    end
end
