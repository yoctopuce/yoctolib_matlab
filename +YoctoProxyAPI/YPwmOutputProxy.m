% YPwmOutputProxy: PWM generator control interface, available for instance in the Yocto-PWM-Tx
% 
% The YPwmOutputProxy class allows you to drive a pulse-width modulated output (PWM). You can
% configure the frequency as well as the duty cycle, and set up progressive transitions.

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


% //--- (YPwmOutput declaration)
classdef YPwmOutputProxy < YoctoProxyAPI.YFunctionProxy
    % YPwmOutputProxy: PWM generator control interface, available for instance in the Yocto-PWM-Tx
    % 
    % The YPwmOutputProxy class allows you to drive a pulse-width modulated output (PWM). You can
    % configure the frequency as well as the duty cycle, and set up progressive transitions.

    properties (Transient, Nontunable)
        % Frequency PWM frequency in Hz
        Frequency (1,1) double
        % Period PWM period in milliseconds
        Period (1,1) double
        % DutyCycle PWM duty cycle, in per cents
        DutyCycle (1,1) double
        % Enabled True if the port output is enabled
        Enabled (1,1) YoctoProxyAPI.EnumEnabled
        % InvertedOutput True if the output signal is configured as inverted, and false otherwise
        InvertedOutput (1,1) YoctoProxyAPI.EnumInvertedOutput
        % EnabledAtPowerOn State of the PWM at device power on
        EnabledAtPowerOn (1,1) YoctoProxyAPI.EnumEnabledAtPowerOn
        % DutyCycleAtPowerOn PWM generators duty cycle at device power on as a floating point number between 0 and 100
        DutyCycleAtPowerOn (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPwmOutput declaration)

    % //--- (YPwmOutput implementation)
    methods (Hidden)
        function obj = YPwmOutputProxy()
            % YPwmOutputProxy For internal use as System Object.
            % Use FindPwmOutput() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1575006081;
            obj.numInputs = 2;
        end
    end

    methods (Static)
        function obj = FindPwmOutput(func)
            % FindPwmOutput Retrieve instances of YPwmOutputProxy
            obj = YoctoProxyAPI.YPwmOutputProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPwmOutput to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1575006081);
        end
    end
    % //--- (end of YPwmOutput implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPwmOutputProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'PwmOutput');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'PwmOutput', ...
                'PropertyList', {'Frequency','DutyCycle','Enabled'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'PwmOutput settings', ...
                'PropertyList', {'Period','InvertedOutput','EnabledAtPowerOn','DutyCycleAtPowerOn'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropDouble(-1534182736, varargin{1});
            end
            if nargin >= 2
                obj.SetPropDouble(44595434, varargin{2});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1,name2] = getInputNamesImpl(~)
            name1 = 'Frequency';
            name2 = 'DutyCycle';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YPwmOutput accessors declaration)

        function result = get_enabled(obj)
            % Returns the state of the PWM generators.
            %
            % @return either YPwmOutput.ENABLED_FALSE or YPwmOutput.ENABLED_TRUE, according to the
            % state of the PWM generators
            %
            % On failure, throws an exception or returns YPwmOutput.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Stops or starts the PWM.
            %
            % @param newval : either YPwmOutput.ENABLED_FALSE or YPwmOutput.ENABLED_TRUE
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function set_frequency(obj, newVal)
            % Changes the PWM frequency. The duty cycle is kept unchanged thanks to an
            % automatic pulse width change, in other words, the change will not be applied
            % before the end of the current period. This can significantly affect reaction
            % time at low frequencies. If you call the matching module saveToFlash()
            % method, the frequency will be kept after a device power cycle.
            % To stop the PWM signal, do not set the frequency to zero, use the set_enabled()
            % method instead.
            %
            % @param newval : a floating point number corresponding to the PWM frequency
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-338166865, newVal);
        end

        function result = get_frequency(obj)
            % Returns the PWM frequency in Hz.
            %
            % @return a floating point number corresponding to the PWM frequency in Hz
            %
            % On failure, throws an exception or returns YPwmOutput.FREQUENCY_INVALID.
            result = obj.InvokeMethod_F(514269515);
        end

        function result = get.Frequency(obj)
            result = obj.GetPropDouble(-1534182736);
        end

        function set.Frequency(obj, newVal)
            obj.Frequency = newVal;
            obj.SetPropDouble(-1534182736, newVal);
        end

        function set_period(obj, newVal)
            % Changes the PWM period in milliseconds. Caution: in order to avoid  random truncation of
            % the current pulse, the change will not be applied
            % before the end of the current period. This can significantly affect reaction
            % time at low frequencies. If you call the matching module saveToFlash()
            % method, the frequency will be kept after a device power cycle.
            %
            % @param newval : a floating point number corresponding to the PWM period in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1236553263, newVal);
        end

        function result = get_period(obj)
            % Returns the PWM period in milliseconds.
            %
            % @return a floating point number corresponding to the PWM period in milliseconds
            %
            % On failure, throws an exception or returns YPwmOutput.PERIOD_INVALID.
            result = obj.InvokeMethod_F(2110044260);
        end

        function result = get.Period(obj)
            result = obj.GetPropDouble(-1038869512);
        end

        function set.Period(obj, newVal)
            obj.Period = newVal;
            obj.SetPropDouble(-1038869512, newVal);
        end

        function set_dutyCycle(obj, newVal)
            % Changes the PWM duty cycle, in per cents.
            %
            % @param newval : a floating point number corresponding to the PWM duty cycle, in per cents
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(860997867, newVal);
        end

        function result = get_dutyCycle(obj)
            % Returns the PWM duty cycle, in per cents.
            %
            % @return a floating point number corresponding to the PWM duty cycle, in per cents
            %
            % On failure, throws an exception or returns YPwmOutput.DUTYCYCLE_INVALID.
            result = obj.InvokeMethod_F(-970911217);
        end

        function result = get.DutyCycle(obj)
            result = obj.GetPropDouble(44595434);
        end

        function set.DutyCycle(obj, newVal)
            obj.DutyCycle = newVal;
            obj.SetPropDouble(44595434, newVal);
        end

        function result = get.Enabled(obj)
            result = YoctoProxyAPI.EnumEnabled(obj.GetPropInt32(-1622900200));
        end

        function set.Enabled(obj, newVal)
            obj.Enabled = newVal;
            obj.SetPropInt32(-1622900200, newVal);
        end

        function set_pulseDuration(obj, newVal)
            % Changes the PWM pulse length, in milliseconds. A pulse length cannot be longer than
            % period, otherwise it is truncated.
            %
            % @param newval : a floating point number corresponding to the PWM pulse length, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1885461916, newVal);
        end

        function result = get_pulseDuration(obj)
            % Returns the PWM pulse length in milliseconds, as a floating point number.
            %
            % @return a floating point number corresponding to the PWM pulse length in milliseconds,
            % as a floating point number
            %
            % On failure, throws an exception or returns YPwmOutput.PULSEDURATION_INVALID.
            result = obj.InvokeMethod_F(1322923076);
        end

        function result = get_invertedOutput(obj)
            % Returns true if the output signal is configured as inverted, and false otherwise.
            %
            % @return either YPwmOutput.INVERTEDOUTPUT_FALSE or YPwmOutput.INVERTEDOUTPUT_TRUE,
            % according to true if the output signal is configured as inverted, and false otherwise
            %
            % On failure, throws an exception or returns YPwmOutput.INVERTEDOUTPUT_INVALID.
            result = YoctoProxyAPI.EnumInvertedOutput(obj.InvokeMethod_D(1141697669));
        end

        function set_invertedOutput(obj, newVal)
            % Changes the inversion mode of the output signal.
            % Remember to call the matching module saveToFlash() method if you want
            % the change to be kept after power cycle.
            %
            % @param newval : either YPwmOutput.INVERTEDOUTPUT_FALSE or
            % YPwmOutput.INVERTEDOUTPUT_TRUE, according to the inversion mode of the output signal
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-783709135, newVal);
        end

        function result = get.InvertedOutput(obj)
            result = YoctoProxyAPI.EnumInvertedOutput(obj.GetPropInt32(-503052120));
        end

        function set.InvertedOutput(obj, newVal)
            obj.InvertedOutput = newVal;
            obj.SetPropInt32(-503052120, newVal);
        end

        function result = get_enabledAtPowerOn(obj)
            % Returns the state of the PWM at device power on.
            %
            % @return either YPwmOutput.ENABLEDATPOWERON_FALSE or YPwmOutput.ENABLEDATPOWERON_TRUE,
            % according to the state of the PWM at device power on
            %
            % On failure, throws an exception or returns YPwmOutput.ENABLEDATPOWERON_INVALID.
            result = YoctoProxyAPI.EnumEnabledAtPowerOn(obj.InvokeMethod_D(-2086316212));
        end

        function set_enabledAtPowerOn(obj, newVal)
            % Changes the state of the PWM at device power on. Remember to call the matching module saveToFlash()
            % method, otherwise this call will have no effect.
            %
            % @param newval : either YPwmOutput.ENABLEDATPOWERON_FALSE or
            % YPwmOutput.ENABLEDATPOWERON_TRUE, according to the state of the PWM at device power on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1302179525, newVal);
        end

        function result = get.EnabledAtPowerOn(obj)
            result = YoctoProxyAPI.EnumEnabledAtPowerOn(obj.GetPropInt32(1248577487));
        end

        function set.EnabledAtPowerOn(obj, newVal)
            obj.EnabledAtPowerOn = newVal;
            obj.SetPropInt32(1248577487, newVal);
        end

        function set_dutyCycleAtPowerOn(obj, newVal)
            % Changes the PWM duty cycle at device power on. Remember to call the matching
            % module saveToFlash() method, otherwise this call will have no effect.
            %
            % @param newval : a floating point number corresponding to the PWM duty cycle at device power on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1106287305, newVal);
        end

        function result = get_dutyCycleAtPowerOn(obj)
            % Returns the PWM generators duty cycle at device power on as a floating point number
            % between 0 and 100.
            %
            % @return a floating point number corresponding to the PWM generators duty cycle at
            % device power on as a floating point number between 0 and 100
            %
            % On failure, throws an exception or returns YPwmOutput.DUTYCYCLEATPOWERON_INVALID.
            result = obj.InvokeMethod_F(-1827887971);
        end

        function result = get.DutyCycleAtPowerOn(obj)
            result = obj.GetPropDouble(-113709649);
        end

        function set.DutyCycleAtPowerOn(obj, newVal)
            obj.DutyCycleAtPowerOn = newVal;
            obj.SetPropDouble(-113709649, newVal);
        end

        function result = pulseDurationMove(obj, ms_target, ms_duration)
            % Performs a smooth transition of the pulse duration toward a given value.
            % Any period, frequency, duty cycle or pulse width change will cancel any ongoing transition process.
            %
            % @param ms_target   : new pulse duration at the end of the transition
            %         (floating-point number, representing the pulse duration in milliseconds)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-750559401, ms_target, ms_duration);
        end

        function result = dutyCycleMove(obj, target, ms_duration)
            % Performs a smooth change of the duty cycle toward a given value.
            % Any period, frequency, duty cycle or pulse width change will cancel any ongoing transition process.
            %
            % @param target      : new duty cycle at the end of the transition
            %         (percentage, floating-point number between 0 and 100)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-674028340, target, ms_duration);
        end

        function result = frequencyMove(obj, target, ms_duration)
            % Performs a smooth frequency change toward a given value.
            % Any period, frequency, duty cycle or pulse width change will cancel any ongoing transition process.
            %
            % @param target      : new frequency at the end of the transition (floating-point number)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-298638449, target, ms_duration);
        end

        function result = phaseMove(obj, target, ms_duration)
            % Performs a smooth transition toward a specified value of the phase shift between this channel
            % and the other channel. The phase shift is executed by slightly changing the frequency
            % temporarily during the specified duration. This function only makes sense when both channels
            % are running, either at the same frequency, or at a multiple of the channel frequency.
            % Any period, frequency, duty cycle or pulse width change will cancel any ongoing transition process.
            %
            % @param target      : phase shift at the end of the transition, in milliseconds
            % (floating-point number)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-549176031, target, ms_duration);
        end

        function result = triggerPulsesByDuration(obj, ms_target, n_pulses)
            % Trigger a given number of pulses of specified duration, at current frequency.
            % At the end of the pulse train, revert to the original state of the PWM generator.
            %
            % @param ms_target : desired pulse duration
            %         (floating-point number, representing the pulse duration in milliseconds)
            % @param n_pulses  : desired pulse count
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-150447958, ms_target, n_pulses);
        end

        function result = triggerPulsesByDutyCycle(obj, target, n_pulses)
            % Trigger a given number of pulses of specified duration, at current frequency.
            % At the end of the pulse train, revert to the original state of the PWM generator.
            %
            % @param target   : desired duty cycle for the generated pulses
            %         (percentage, floating-point number between 0 and 100)
            % @param n_pulses : desired pulse count
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-1424960313, target, n_pulses);
        end

        function result = triggerPulsesByFrequency(obj, target, n_pulses)
            % Trigger a given number of pulses at the specified frequency, using current duty cycle.
            % At the end of the pulse train, revert to the original state of the PWM generator.
            %
            % @param target   : desired frequency for the generated pulses (floating-point number)
            % @param n_pulses : desired pulse count
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-2133465258, target, n_pulses);
        end

        % //--- (end of YPwmOutput accessors declaration)
    end
end
