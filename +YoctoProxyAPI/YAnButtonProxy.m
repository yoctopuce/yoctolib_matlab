% YAnButtonProxy: analog input control interface, available for instance in the Yocto-Buzzer, the
% Yocto-Knob, the Yocto-MaxiBuzzer or the Yocto-MaxiDisplay
% 
% The YAnButtonProxy class provide access to basic resistive inputs. Such inputs can be used to
% measure the state of a simple button as well as to read an analog potentiometer (variable
% resistance). This can be use for instance with a continuous rotating knob, a throttle grip or a
% joystick. The module is capable to calibrate itself on min and max values, in order to compute a
% calibrated value that varies proportionally with the potentiometer position, regardless of its
% total resistance.

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


% //--- (YAnButton declaration)
classdef YAnButtonProxy < YoctoProxyAPI.YFunctionProxy
    % YAnButtonProxy: analog input control interface, available for instance in the Yocto-Buzzer, the
    % Yocto-Knob, the Yocto-MaxiBuzzer or the Yocto-MaxiDisplay
    % 
    % The YAnButtonProxy class provide access to basic resistive inputs. Such inputs can be used to
    % measure the state of a simple button as well as to read an analog potentiometer (variable
    % resistance). This can be use for instance with a continuous rotating knob, a throttle grip or a
    % joystick. The module is capable to calibrate itself on min and max values, in order to compute a
    % calibrated value that varies proportionally with the potentiometer position, regardless of its
    % total resistance.

    properties (Transient, Nontunable)
        % AnalogCalibration Tells if a calibration process is currently ongoing
        AnalogCalibration (1,1) YoctoProxyAPI.EnumAnalogCalibration
        % CalibrationMax Maximal value measured during the calibration (between 0 and 4095, included)
        CalibrationMax (1,1) int32
        % CalibrationMin Minimal value measured during the calibration (between 0 and 4095, included)
        CalibrationMin (1,1) int32
        % Sensitivity Sensibility for the input (between 1 and 1000) for triggering user callbacks
        Sensitivity (1,1) int32
        % InputType Decoding method applied to the input (analog or multiplexed binary switches)
        InputType (1,1) YoctoProxyAPI.EnumInputType
    end

    properties (Transient, Nontunable, SetAccess = private)
        % CalibratedValue Current calibrated input value (between 0 and 1000, included)
        CalibratedValue (1,1) int32
        % IsPressed True if the input (considered as binary) is active (closed contact), and false otherwise
        IsPressed (1,1) YoctoProxyAPI.EnumIsPressed
    end

    properties (Constant)
    end
    % //--- (end of YAnButton declaration)

    % //--- (YAnButton implementation)
    methods (Hidden)
        function obj = YAnButtonProxy()
            % YAnButtonProxy For internal use as System Object.
            % Use FindAnButton() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -671866358;
            obj.numOutputs = 2;
        end
    end

    methods (Static)
        function obj = FindAnButton(func)
            % FindAnButton Retrieve instances of YAnButtonProxy
            obj = YoctoProxyAPI.YAnButtonProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindAnButton to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-671866358);
        end
    end
    % //--- (end of YAnButton implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YAnButtonProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'AnButton');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'AnButton', ...
                'PropertyList', {'CalibratedValue','IsPressed'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'AnButton settings', ...
                'PropertyList', {'AnalogCalibration','CalibrationMax','CalibrationMin','Sensitivity','InputType'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropInt32(-179529870);
            end
            if nargout >= 2
                varargout{2} = YoctoProxyAPI.EnumIsPressed(obj.GetPropInt32(-10327783));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int32';
            varargout{2} = 'YoctoProxyAPI.EnumIsPressed';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1,name2] = getOutputNamesImpl(~)
            name1 = 'CalibratedValue';
            name2 = 'IsPressed';
        end
    end

    methods
        % //--- (YAnButton accessors declaration)

        function result = get_calibratedValue(obj)
            % Returns the current calibrated input value (between 0 and 1000, included).
            %
            % @return an integer corresponding to the current calibrated input value (between 0 and
            % 1000, included)
            %
            % On failure, throws an exception or returns YAnButton.CALIBRATEDVALUE_INVALID.
            result = obj.InvokeMethod_D(634835529);
        end

        function result = get.CalibratedValue(obj)
            result = obj.GetPropInt32(-179529870);
        end

        function result = get.IsPressed(obj)
            result = YoctoProxyAPI.EnumIsPressed(obj.GetPropInt32(-10327783));
        end

        function result = get_rawValue(obj)
            % Returns the current measured input value as-is (between 0 and 4095, included).
            %
            % @return an integer corresponding to the current measured input value as-is (between 0
            % and 4095, included)
            %
            % On failure, throws an exception or returns YAnButton.RAWVALUE_INVALID.
            result = obj.InvokeMethod_D(2035087752);
        end

        function result = get_analogCalibration(obj)
            % Tells if a calibration process is currently ongoing.
            %
            % @return either YAnButton.ANALOGCALIBRATION_OFF or YAnButton.ANALOGCALIBRATION_ON
            %
            % On failure, throws an exception or returns YAnButton.ANALOGCALIBRATION_INVALID.
            result = YoctoProxyAPI.EnumAnalogCalibration(obj.InvokeMethod_D(1381456541));
        end

        function set_analogCalibration(obj, newVal)
            % Starts or stops the calibration process. Remember to call the saveToFlash()
            % method of the module at the end of the calibration if the modification must be kept.
            %
            % @param newval : either YAnButton.ANALOGCALIBRATION_OFF or YAnButton.ANALOGCALIBRATION_ON
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1746361738, newVal);
        end

        function result = get.AnalogCalibration(obj)
            result = YoctoProxyAPI.EnumAnalogCalibration(obj.GetPropInt32(867280109));
        end

        function set.AnalogCalibration(obj, newVal)
            obj.AnalogCalibration = newVal;
            obj.SetPropInt32(867280109, newVal);
        end

        function result = get_calibrationMax(obj)
            % Returns the maximal value measured during the calibration (between 0 and 4095, included).
            %
            % @return an integer corresponding to the maximal value measured during the calibration
            % (between 0 and 4095, included)
            %
            % On failure, throws an exception or returns YAnButton.CALIBRATIONMAX_INVALID.
            result = obj.InvokeMethod_D(1520747451);
        end

        function set_calibrationMax(obj, newVal)
            % Changes the maximal calibration value for the input (between 0 and 4095, included), without actually
            % starting the automated calibration.  Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the maximal calibration value for the input
            % (between 0 and 4095, included), without actually
            %         starting the automated calibration
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-807296241, newVal);
        end

        function result = get.CalibrationMax(obj)
            result = obj.GetPropInt32(-2080585404);
        end

        function set.CalibrationMax(obj, newVal)
            obj.CalibrationMax = newVal;
            obj.SetPropInt32(-2080585404, newVal);
        end

        function result = get_calibrationMin(obj)
            % Returns the minimal value measured during the calibration (between 0 and 4095, included).
            %
            % @return an integer corresponding to the minimal value measured during the calibration
            % (between 0 and 4095, included)
            %
            % On failure, throws an exception or returns YAnButton.CALIBRATIONMIN_INVALID.
            result = obj.InvokeMethod_D(-2017774442);
        end

        function set_calibrationMin(obj, newVal)
            % Changes the minimal calibration value for the input (between 0 and 4095, included), without actually
            % starting the automated calibration.  Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the minimal calibration value for the input
            % (between 0 and 4095, included), without actually
            %         starting the automated calibration
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(318657570, newVal);
        end

        function result = get.CalibrationMin(obj)
            result = obj.GetPropInt32(-1074661859);
        end

        function set.CalibrationMin(obj, newVal)
            obj.CalibrationMin = newVal;
            obj.SetPropInt32(-1074661859, newVal);
        end

        function result = get_sensitivity(obj)
            % Returns the sensibility for the input (between 1 and 1000) for triggering user callbacks.
            %
            % @return an integer corresponding to the sensibility for the input (between 1 and 1000)
            % for triggering user callbacks
            %
            % On failure, throws an exception or returns YAnButton.SENSITIVITY_INVALID.
            result = obj.InvokeMethod_D(-261212033);
        end

        function set_sensitivity(obj, newVal)
            % Changes the sensibility for the input (between 1 and 1000) for triggering user callbacks.
            % The sensibility is used to filter variations around a fixed value, but does not preclude the
            % transmission of events when the input value evolves constantly in the same direction.
            % Special case: when the value 1000 is used, the callback will only be thrown when the logical state
            % of the input switches from pressed to released and back.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the sensibility for the input (between 1
            % and 1000) for triggering user callbacks
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1353079291, newVal);
        end

        function result = get.Sensitivity(obj)
            result = obj.GetPropInt32(2047615200);
        end

        function set.Sensitivity(obj, newVal)
            obj.Sensitivity = newVal;
            obj.SetPropInt32(2047615200, newVal);
        end

        function result = get_isPressed(obj)
            % Returns true if the input (considered as binary) is active (closed contact), and false otherwise.
            %
            % @return either YAnButton.ISPRESSED_FALSE or YAnButton.ISPRESSED_TRUE, according to true
            % if the input (considered as binary) is active (closed contact), and false otherwise
            %
            % On failure, throws an exception or returns YAnButton.ISPRESSED_INVALID.
            result = YoctoProxyAPI.EnumIsPressed(obj.InvokeMethod_D(2098076773));
        end

        function result = get_lastTimePressed(obj)
            % Returns the number of elapsed milliseconds between the module power on and the last time
            % the input button was pressed (the input contact transitioned from open to closed).
            %
            % @return an integer corresponding to the number of elapsed milliseconds between the
            % module power on and the last time
            %         the input button was pressed (the input contact transitioned from open to closed)
            %
            % On failure, throws an exception or returns YAnButton.LASTTIMEPRESSED_INVALID.
            result = obj.InvokeMethod_Q(-305690090);
        end

        function result = get_lastTimeReleased(obj)
            % Returns the number of elapsed milliseconds between the module power on and the last time
            % the input button was released (the input contact transitioned from closed to open).
            %
            % @return an integer corresponding to the number of elapsed milliseconds between the
            % module power on and the last time
            %         the input button was released (the input contact transitioned from closed to open)
            %
            % On failure, throws an exception or returns YAnButton.LASTTIMERELEASED_INVALID.
            result = obj.InvokeMethod_Q(1123889222);
        end

        function result = get_pulseCounter(obj)
            % Returns the pulse counter value. The value is a 32 bit integer. In case
            % of overflow (>=2^32), the counter will wrap. To reset the counter, just
            % call the resetCounter() method.
            %
            % @return an integer corresponding to the pulse counter value
            %
            % On failure, throws an exception or returns YAnButton.PULSECOUNTER_INVALID.
            result = obj.InvokeMethod_Q(335219165);
        end

        function result = get_pulseTimer(obj)
            % Returns the timer of the pulses counter (ms).
            %
            % @return an integer corresponding to the timer of the pulses counter (ms)
            %
            % On failure, throws an exception or returns YAnButton.PULSETIMER_INVALID.
            result = obj.InvokeMethod_Q(1447258781);
        end

        function result = get_inputType(obj)
            % Returns the decoding method applied to the input (analog or multiplexed binary switches).
            %
            % @return a value among YAnButton.INPUTTYPE_ANALOG_FAST, YAnButton.INPUTTYPE_DIGITAL4 and
            % YAnButton.INPUTTYPE_ANALOG_SMOOTH corresponding to the decoding method applied to the
            % input (analog or multiplexed binary switches)
            %
            % On failure, throws an exception or returns YAnButton.INPUTTYPE_INVALID.
            result = YoctoProxyAPI.EnumInputType(obj.InvokeMethod_D(-790631864));
        end

        function set_inputType(obj, newVal)
            % Changes the decoding method applied to the input (analog or multiplexed binary switches).
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among YAnButton.INPUTTYPE_ANALOG_FAST,
            % YAnButton.INPUTTYPE_DIGITAL4 and YAnButton.INPUTTYPE_ANALOG_SMOOTH corresponding to the
            % decoding method applied to the input (analog or multiplexed binary switches)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(632238252, newVal);
        end

        function result = get.InputType(obj)
            result = YoctoProxyAPI.EnumInputType(obj.GetPropInt32(-417055194));
        end

        function set.InputType(obj, newVal)
            obj.InputType = newVal;
            obj.SetPropInt32(-417055194, newVal);
        end

        function result = resetCounter(obj)
            % Returns the pulse counter value as well as its timer.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1034161823);
        end

        % //--- (end of YAnButton accessors declaration)
    end
end
