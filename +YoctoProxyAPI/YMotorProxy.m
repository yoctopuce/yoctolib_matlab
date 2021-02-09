% YMotorProxy: motor control interface, available for instance in the Yocto-Motor-DC
% 
% The YMotorProxy class allows you to drive a DC motor. It can be used to configure the power sent to
% the motor to make it turn both ways, but also to drive accelerations and decelerations. The motor
% will then accelerate automatically: you will not have to monitor it. The API also allows to slow
% down the motor by shortening its terminals: the motor will then act as an electromagnetic brake.

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


% //--- (YMotor declaration)
classdef YMotorProxy < YoctoProxyAPI.YFunctionProxy
    % YMotorProxy: motor control interface, available for instance in the Yocto-Motor-DC
    % 
    % The YMotorProxy class allows you to drive a DC motor. It can be used to configure the power sent to
    % the motor to make it turn both ways, but also to drive accelerations and decelerations. The motor
    % will then accelerate automatically: you will not have to monitor it. The API also allows to slow
    % down the motor by shortening its terminals: the motor will then act as an electromagnetic brake.

    properties (Transient, Nontunable)
        % MotorStatus Return the controller state
        MotorStatus (1,1) YoctoProxyAPI.EnumMotorStatus
        % CutOffVoltage Threshold voltage under which the controller automatically switches to error state
        CutOffVoltage (1,1) double
        % OverCurrentLimit Current threshold (in mA) above which the controller automatically
        OverCurrentLimit (1,1) int32
        % Frequency PWM frequency used to control the motor
        Frequency (1,1) double
        % StarterTime Duration (in ms) during which the motor is driven at low frequency to help
        StarterTime (1,1) int32
        % FailSafeTimeout Delay in milliseconds allowed for the controller to run autonomously without
        FailSafeTimeout (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YMotor declaration)

    % //--- (YMotor implementation)
    methods (Hidden)
        function obj = YMotorProxy()
            % YMotorProxy For internal use as System Object.
            % Use FindMotor() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 177351492;
        end
    end

    methods (Static)
        function obj = FindMotor(func)
            % FindMotor Retrieve instances of YMotorProxy
            obj = YoctoProxyAPI.YMotorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindMotor to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(177351492);
        end
    end
    % //--- (end of YMotor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YMotorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Motor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Motor', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Motor settings', ...
                'PropertyList', {'MotorStatus','CutOffVoltage','OverCurrentLimit','Frequency','StarterTime','FailSafeTimeout'});
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
        % //--- (YMotor accessors declaration)

        function result = get_motorStatus(obj)
            % Return the controller state. Possible states are:
            % IDLE   when the motor is stopped/in free wheel, ready to start;
            % FORWD  when the controller is driving the motor forward;
            % BACKWD when the controller is driving the motor backward;
            % BRAKE  when the controller is braking;
            % LOVOLT when the controller has detected a low voltage condition;
            % HICURR when the controller has detected an over current condition;
            % HIHEAT when the controller has detected an overheat condition;
            % FAILSF when the controller switched on the failsafe security.
            %
            % When an error condition occurred (LOVOLT, HICURR, HIHEAT, FAILSF), the controller
            % status must be explicitly reset using the resetStatus function.
            %
            % @return a value among YMotor.MOTORSTATUS_IDLE, YMotor.MOTORSTATUS_BRAKE,
            % YMotor.MOTORSTATUS_FORWD, YMotor.MOTORSTATUS_BACKWD, YMotor.MOTORSTATUS_LOVOLT,
            % YMotor.MOTORSTATUS_HICURR, YMotor.MOTORSTATUS_HIHEAT and YMotor.MOTORSTATUS_FAILSF
            %
            % On failure, throws an exception or returns YMotor.MOTORSTATUS_INVALID.
            result = YoctoProxyAPI.EnumMotorStatus(obj.InvokeMethod_D(-841724397));
        end

        function result = get.MotorStatus(obj)
            result = YoctoProxyAPI.EnumMotorStatus(obj.GetPropInt32(1152031420));
        end

        function set.MotorStatus(obj, newVal)
            obj.MotorStatus = newVal;
            obj.SetPropInt32(1152031420, newVal);
        end

        function set_drivingForce(obj, newVal)
            % Changes immediately the power sent to the motor. The value is a percentage between -100%
            % to 100%. If you want go easy on your mechanics and avoid excessive current consumption,
            % try to avoid brutal power changes. For example, immediate transition from forward full power
            % to reverse full power is a very bad idea. Each time the driving power is modified, the
            % braking power is set to zero.
            %
            % @param newval : a floating point number corresponding to immediately the power sent to the motor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1042719901, newVal);
        end

        function result = get_drivingForce(obj)
            % Returns the power sent to the motor, as a percentage between -100% and +100%.
            %
            % @return a floating point number corresponding to the power sent to the motor, as a
            % percentage between -100% and +100%
            %
            % On failure, throws an exception or returns YMotor.DRIVINGFORCE_INVALID.
            result = obj.InvokeMethod_F(541265739);
        end

        function set_brakingForce(obj, newVal)
            % Changes immediately the braking force applied to the motor (in percents).
            % The value 0 corresponds to no braking (free wheel). When the braking force
            % is changed, the driving power is set to zero. The value is a percentage.
            %
            % @param newval : a floating point number corresponding to immediately the braking force
            % applied to the motor (in percents)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1517678567, newVal);
        end

        function result = get_brakingForce(obj)
            % Returns the braking force applied to the motor, as a percentage.
            % The value 0 corresponds to no braking (free wheel).
            %
            % @return a floating point number corresponding to the braking force applied to the
            % motor, as a percentage
            %
            % On failure, throws an exception or returns YMotor.BRAKINGFORCE_INVALID.
            result = obj.InvokeMethod_F(-1141916721);
        end

        function set_cutOffVoltage(obj, newVal)
            % Changes the threshold voltage under which the controller automatically switches to error state
            % and prevents further current draw. This setting prevent damage to a battery that can
            % occur when drawing current from an "empty" battery.
            % Note that whatever the cutoff threshold, the controller switches to undervoltage
            % error state if the power supply goes under 3V, even for a very brief time.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the threshold voltage under
            % which the controller automatically switches to error state
            %         and prevents further current draw
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(862460703, newVal);
        end

        function result = get_cutOffVoltage(obj)
            % Returns the threshold voltage under which the controller automatically switches to error state
            % and prevents further current draw. This setting prevents damage to a battery that can
            % occur when drawing current from an "empty" battery.
            %
            % @return a floating point number corresponding to the threshold voltage under which the
            % controller automatically switches to error state
            %         and prevents further current draw
            %
            % On failure, throws an exception or returns YMotor.CUTOFFVOLTAGE_INVALID.
            result = obj.InvokeMethod_F(-231994049);
        end

        function result = get.CutOffVoltage(obj)
            result = obj.GetPropDouble(-198941592);
        end

        function set.CutOffVoltage(obj, newVal)
            obj.CutOffVoltage = newVal;
            obj.SetPropDouble(-198941592, newVal);
        end

        function result = get_overCurrentLimit(obj)
            % Returns the current threshold (in mA) above which the controller automatically
            % switches to error state. A zero value means that there is no limit.
            %
            % @return an integer corresponding to the current threshold (in mA) above which the
            % controller automatically
            %         switches to error state
            %
            % On failure, throws an exception or returns YMotor.OVERCURRENTLIMIT_INVALID.
            result = obj.InvokeMethod_D(702063410);
        end

        function set_overCurrentLimit(obj, newVal)
            % Changes the current threshold (in mA) above which the controller automatically
            % switches to error state. A zero value means that there is no limit. Note that whatever the
            % current limit is, the controller switches to OVERCURRENT status if the current
            % goes above 32A, even for a very brief time. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the current threshold (in mA) above which
            % the controller automatically
            %         switches to error state
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-404727109, newVal);
        end

        function result = get.OverCurrentLimit(obj)
            result = obj.GetPropInt32(-176537650);
        end

        function set.OverCurrentLimit(obj, newVal)
            obj.OverCurrentLimit = newVal;
            obj.SetPropInt32(-176537650, newVal);
        end

        function set_frequency(obj, newVal)
            % Changes the PWM frequency used to control the motor. Low frequency is usually
            % more efficient and may help the motor to start, but an audible noise might be
            % generated. A higher frequency reduces the noise, but more energy is converted
            % into heat. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the PWM frequency used to control the motor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-338166865, newVal);
        end

        function result = get_frequency(obj)
            % Returns the PWM frequency used to control the motor.
            %
            % @return a floating point number corresponding to the PWM frequency used to control the motor
            %
            % On failure, throws an exception or returns YMotor.FREQUENCY_INVALID.
            result = obj.InvokeMethod_F(514269515);
        end

        function result = get.Frequency(obj)
            result = obj.GetPropDouble(-1534182736);
        end

        function set.Frequency(obj, newVal)
            obj.Frequency = newVal;
            obj.SetPropDouble(-1534182736, newVal);
        end

        function result = get_starterTime(obj)
            % Returns the duration (in ms) during which the motor is driven at low frequency to help
            % it start up.
            %
            % @return an integer corresponding to the duration (in ms) during which the motor is
            % driven at low frequency to help
            %         it start up
            %
            % On failure, throws an exception or returns YMotor.STARTERTIME_INVALID.
            result = obj.InvokeMethod_D(-504906609);
        end

        function set_starterTime(obj, newVal)
            % Changes the duration (in ms) during which the motor is driven at low frequency to help
            % it start up. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the duration (in ms) during which the motor
            % is driven at low frequency to help
            %         it start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1093655819, newVal);
        end

        function result = get.StarterTime(obj)
            result = obj.GetPropInt32(-33940168);
        end

        function set.StarterTime(obj, newVal)
            obj.StarterTime = newVal;
            obj.SetPropInt32(-33940168, newVal);
        end

        function result = get_failSafeTimeout(obj)
            % Returns the delay in milliseconds allowed for the controller to run autonomously without
            % receiving any instruction from the control process. When this delay has elapsed,
            % the controller automatically stops the motor and switches to FAILSAFE error.
            % Failsafe security is disabled when the value is zero.
            %
            % @return an integer corresponding to the delay in milliseconds allowed for the
            % controller to run autonomously without
            %         receiving any instruction from the control process
            %
            % On failure, throws an exception or returns YMotor.FAILSAFETIMEOUT_INVALID.
            result = obj.InvokeMethod_D(-274932807);
        end

        function set_failSafeTimeout(obj, newVal)
            % Changes the delay in milliseconds allowed for the controller to run autonomously without
            % receiving any instruction from the control process. When this delay has elapsed,
            % the controller automatically stops the motor and switches to FAILSAFE error.
            % Failsafe security is disabled when the value is zero.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the delay in milliseconds allowed for the
            % controller to run autonomously without
            %         receiving any instruction from the control process
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1913656026, newVal);
        end

        function result = get.FailSafeTimeout(obj)
            result = obj.GetPropInt32(832905954);
        end

        function set.FailSafeTimeout(obj, newVal)
            obj.FailSafeTimeout = newVal;
            obj.SetPropInt32(832905954, newVal);
        end

        function result = keepALive(obj)
            % Rearms the controller failsafe timer. When the motor is running and the failsafe feature
            % is active, this function should be called periodically to prove that the control process
            % is running properly. Otherwise, the motor is automatically stopped after the specified
            % timeout. Calling a motor <i>set</i> function implicitly rearms the failsafe timer.
            result = obj.InvokeMethod_D(-687429216);
        end

        function result = resetStatus(obj)
            % Reset the controller state to IDLE. This function must be invoked explicitly
            % after any error condition is signaled.
            result = obj.InvokeMethod_D(-757324526);
        end

        function result = drivingForceMove(obj, targetPower, delay)
            % Changes progressively the power sent to the motor for a specific duration.
            %
            % @param targetPower : desired motor power, in percents (between -100% and +100%)
            % @param delay : duration (in ms) of the transition
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(266860050, targetPower, delay);
        end

        function result = brakingForceMove(obj, targetPower, delay)
            % Changes progressively the braking force applied to the motor for a specific duration.
            %
            % @param targetPower : desired braking force, in percents
            % @param delay : duration (in ms) of the transition
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dfd(-1719992412, targetPower, delay);
        end

        % //--- (end of YMotor accessors declaration)
    end
end
