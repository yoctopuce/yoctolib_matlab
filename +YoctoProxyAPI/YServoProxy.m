% YServoProxy: RC servo motor control interface, available for instance in the Yocto-Servo
% 
% The YServoProxy class is designed to drive remote-control servo motors outputs. This class allows
% you not only to move a servo to a given position, but also to specify the time interval in which
% the move should be performed. This makes it possible to synchronize two servos involved in a same
% move.

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


% //--- (YServo declaration)
classdef YServoProxy < YoctoProxyAPI.YFunctionProxy
    % YServoProxy: RC servo motor control interface, available for instance in the Yocto-Servo
    % 
    % The YServoProxy class is designed to drive remote-control servo motors outputs. This class allows
    % you not only to move a servo to a given position, but also to specify the time interval in which
    % the move should be performed. This makes it possible to synchronize two servos involved in a same
    % move.

    properties (Transient, Nontunable)
        % Position Current servo position
        Position (1,1) int32
        % Enabled True if the port output is enabled
        Enabled (1,1) YoctoProxyAPI.EnumEnabled
        % Range Current range of use of the servo
        Range (1,1) int32
        % Neutral Duration in microseconds of a neutral pulse for the servo
        Neutral (1,1) int32
        % PositionAtPowerOn Servo position at device power up
        PositionAtPowerOn (1,1) int32
        % EnabledAtPowerOn Servo signal generator state at power up
        EnabledAtPowerOn (1,1) YoctoProxyAPI.EnumEnabledAtPowerOn
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YServo declaration)

    % //--- (YServo implementation)
    methods (Hidden)
        function obj = YServoProxy()
            % YServoProxy For internal use as System Object.
            % Use FindServo() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1182030768;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindServo(func)
            % FindServo Retrieve instances of YServoProxy
            obj = YoctoProxyAPI.YServoProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindServo to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1182030768);
        end
    end
    % //--- (end of YServo implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YServoProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Servo');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Servo', ...
                'PropertyList', {'Position'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Servo settings', ...
                'PropertyList', {'Enabled','Range','Neutral','PositionAtPowerOn','EnabledAtPowerOn'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(-1084586333, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'Position';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YServo accessors declaration)

        function result = get_position(obj)
            % Returns the current servo position.
            %
            % @return an integer corresponding to the current servo position
            %
            % On failure, throws an exception or returns YServo.POSITION_INVALID.
            result = obj.InvokeMethod_D(-955224796);
        end

        function set_position(obj, newVal)
            % Changes immediately the servo driving position.
            %
            % @param newval : an integer corresponding to immediately the servo driving position
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2090795365, newVal);
        end

        function result = get.Position(obj)
            result = obj.GetPropInt32(-1084586333);
        end

        function set.Position(obj, newVal)
            obj.Position = newVal;
            obj.SetPropInt32(-1084586333, newVal);
        end

        function result = get.Enabled(obj)
            result = YoctoProxyAPI.EnumEnabled(obj.GetPropInt32(-1622900200));
        end

        function set.Enabled(obj, newVal)
            obj.Enabled = newVal;
            obj.SetPropInt32(-1622900200, newVal);
        end

        function result = get_enabled(obj)
            % Returns the state of the RC servo motors.
            %
            % @return either YServo.ENABLED_FALSE or YServo.ENABLED_TRUE, according to the state of
            % the RC servo motors
            %
            % On failure, throws an exception or returns YServo.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Stops or starts the RC servo motor.
            %
            % @param newval : either YServo.ENABLED_FALSE or YServo.ENABLED_TRUE
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function result = get_range(obj)
            % Returns the current range of use of the servo.
            %
            % @return an integer corresponding to the current range of use of the servo
            %
            % On failure, throws an exception or returns YServo.RANGE_INVALID.
            result = obj.InvokeMethod_D(1053644898);
        end

        function set_range(obj, newVal)
            % Changes the range of use of the servo, specified in per cents.
            % A range of 100% corresponds to a standard control signal, that varies
            % from 1 [ms] to 2 [ms], When using a servo that supports a double range,
            % from 0.5 [ms] to 2.5 [ms], you can select a range of 200%.
            % Be aware that using a range higher than what is supported by the servo
            % is likely to damage the servo. Remember to call the matching module
            % saveToFlash() method, otherwise this call will have no effect.
            %
            % @param newval : an integer corresponding to the range of use of the servo, specified in per cents
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(462213091, newVal);
        end

        function result = get.Range(obj)
            result = obj.GetPropInt32(1380349261);
        end

        function set.Range(obj, newVal)
            obj.Range = newVal;
            obj.SetPropInt32(1380349261, newVal);
        end

        function result = get_neutral(obj)
            % Returns the duration in microseconds of a neutral pulse for the servo.
            %
            % @return an integer corresponding to the duration in microseconds of a neutral pulse for the servo
            %
            % On failure, throws an exception or returns YServo.NEUTRAL_INVALID.
            result = obj.InvokeMethod_D(-444601339);
        end

        function set_neutral(obj, newVal)
            % Changes the duration of the pulse corresponding to the neutral position of the servo.
            % The duration is specified in microseconds, and the standard value is 1500 [us].
            % This setting makes it possible to shift the range of use of the servo.
            % Be aware that using a range higher than what is supported by the servo is
            % likely to damage the servo. Remember to call the matching module
            % saveToFlash() method, otherwise this call will have no effect.
            %
            % @param newval : an integer corresponding to the duration of the pulse corresponding to
            % the neutral position of the servo
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1431371647, newVal);
        end

        function result = get.Neutral(obj)
            result = obj.GetPropInt32(1805245548);
        end

        function set.Neutral(obj, newVal)
            obj.Neutral = newVal;
            obj.SetPropInt32(1805245548, newVal);
        end

        function move(obj, target, ms_duration)
            % Performs a smooth move at constant speed toward a given position.
            %
            % @param target      : new position at the end of the move
            % @param ms_duration : total duration of the move, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_dd(-664059931, target, ms_duration);
        end

        function result = get_positionAtPowerOn(obj)
            % Returns the servo position at device power up.
            %
            % @return an integer corresponding to the servo position at device power up
            %
            % On failure, throws an exception or returns YServo.POSITIONATPOWERON_INVALID.
            result = obj.InvokeMethod_D(-915671155);
        end

        function set_positionAtPowerOn(obj, newVal)
            % Configure the servo position at device power up. Remember to call the matching
            % module saveToFlash() method, otherwise this call will have no effect.
            %
            % @param newval : an integer
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-215224166, newVal);
        end

        function result = get.PositionAtPowerOn(obj)
            result = obj.GetPropInt32(878540240);
        end

        function set.PositionAtPowerOn(obj, newVal)
            obj.PositionAtPowerOn = newVal;
            obj.SetPropInt32(878540240, newVal);
        end

        function result = get_enabledAtPowerOn(obj)
            % Returns the servo signal generator state at power up.
            %
            % @return either YServo.ENABLEDATPOWERON_FALSE or YServo.ENABLEDATPOWERON_TRUE, according
            % to the servo signal generator state at power up
            %
            % On failure, throws an exception or returns YServo.ENABLEDATPOWERON_INVALID.
            result = YoctoProxyAPI.EnumEnabledAtPowerOn(obj.InvokeMethod_D(-2086316212));
        end

        function set_enabledAtPowerOn(obj, newVal)
            % Configure the servo signal generator state at power up. Remember to call the matching
            % module saveToFlash()
            % method, otherwise this call will have no effect.
            %
            % @param newval : either YServo.ENABLEDATPOWERON_FALSE or YServo.ENABLEDATPOWERON_TRUE
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

        % //--- (end of YServo accessors declaration)
    end
end
