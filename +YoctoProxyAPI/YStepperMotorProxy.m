% YStepperMotorProxy: stepper motor control interface
% 
% The YStepperMotorProxy class allows you to drive a stepper motor.

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


% //--- (YStepperMotor declaration)
classdef YStepperMotorProxy < YoctoProxyAPI.YFunctionProxy
    % YStepperMotorProxy: stepper motor control interface
    % 
    % The YStepperMotorProxy class allows you to drive a stepper motor.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YStepperMotor declaration)

    % //--- (YStepperMotor implementation)
    methods (Hidden)
        function obj = YStepperMotorProxy()
            % YStepperMotorProxy For internal use as System Object.
            % Use FindStepperMotor() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1176691010;
        end
    end

    methods (Static)
        function obj = FindStepperMotor(func)
            % FindStepperMotor Retrieve instances of YStepperMotorProxy
            obj = YoctoProxyAPI.YStepperMotorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindStepperMotor to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1176691010);
        end
    end
    % //--- (end of YStepperMotor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YStepperMotorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'StepperMotor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'StepperMotor', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'StepperMotor settings', ...
                'PropertyList', {});
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
        % //--- (YStepperMotor accessors declaration)

        function result = get_motorState(obj)
            % Returns the motor working state.
            %
            % @return a value among YStepperMotor.MOTORSTATE_ABSENT, YStepperMotor.MOTORSTATE_ALERT,
            % YStepperMotor.MOTORSTATE_HI_Z, YStepperMotor.MOTORSTATE_STOP,
            % YStepperMotor.MOTORSTATE_RUN and YStepperMotor.MOTORSTATE_BATCH corresponding to the
            % motor working state
            %
            % On failure, throws an exception or returns YStepperMotor.MOTORSTATE_INVALID.
            result = YoctoProxyAPI.EnumMotorState(obj.InvokeMethod_D(-1554976347));
        end

        function result = get_diags(obj)
            % Returns the stepper motor controller diagnostics, as a bitmap.
            %
            % @return an integer corresponding to the stepper motor controller diagnostics, as a bitmap
            %
            % On failure, throws an exception or returns YStepperMotor.DIAGS_INVALID.
            result = obj.InvokeMethod_D(1282096104);
        end

        function set_stepPos(obj, newVal)
            % Changes the current logical motor position, measured in steps.
            % This command does not cause any motor move, as its purpose is only to set up
            % the origin of the position counter. The fractional part of the position,
            % that corresponds to the physical position of the rotor, is not changed.
            % To trigger a motor move, use methods moveTo() or moveRel()
            % instead.
            %
            % @param newval : a floating point number corresponding to the current logical motor
            % position, measured in steps
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(433374460, newVal);
        end

        function result = get_stepPos(obj)
            % Returns the current logical motor position, measured in steps.
            % The value may include a fractional part when micro-stepping is in use.
            %
            % @return a floating point number corresponding to the current logical motor position,
            % measured in steps
            %
            % On failure, throws an exception or returns YStepperMotor.STEPPOS_INVALID.
            result = obj.InvokeMethod_F(1443113080);
        end

        function result = get_speed(obj)
            % Returns current motor speed, measured in steps per second.
            % To change speed, use method changeSpeed().
            %
            % @return a floating point number corresponding to current motor speed, measured in steps per second
            %
            % On failure, throws an exception or returns YStepperMotor.SPEED_INVALID.
            result = obj.InvokeMethod_F(1646620777);
        end

        function set_pullinSpeed(obj, newVal)
            % Changes the motor speed immediately reachable from stop state, measured in steps per second.
            %
            % @param newval : a floating point number corresponding to the motor speed immediately
            % reachable from stop state, measured in steps per second
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1893137541, newVal);
        end

        function result = get_pullinSpeed(obj)
            % Returns the motor speed immediately reachable from stop state, measured in steps per second.
            %
            % @return a floating point number corresponding to the motor speed immediately reachable
            % from stop state, measured in steps per second
            %
            % On failure, throws an exception or returns YStepperMotor.PULLINSPEED_INVALID.
            result = obj.InvokeMethod_F(803300095);
        end

        function set_maxAccel(obj, newVal)
            % Changes the maximal motor acceleration, measured in steps per second^2.
            %
            % @param newval : a floating point number corresponding to the maximal motor
            % acceleration, measured in steps per second^2
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-291620008, newVal);
        end

        function result = get_maxAccel(obj)
            % Returns the maximal motor acceleration, measured in steps per second^2.
            %
            % @return a floating point number corresponding to the maximal motor acceleration,
            % measured in steps per second^2
            %
            % On failure, throws an exception or returns YStepperMotor.MAXACCEL_INVALID.
            result = obj.InvokeMethod_F(-1427199769);
        end

        function set_maxSpeed(obj, newVal)
            % Changes the maximal motor speed, measured in steps per second.
            %
            % @param newval : a floating point number corresponding to the maximal motor speed,
            % measured in steps per second
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(449733266, newVal);
        end

        function result = get_maxSpeed(obj)
            % Returns the maximal motor speed, measured in steps per second.
            %
            % @return a floating point number corresponding to the maximal motor speed, measured in
            % steps per second
            %
            % On failure, throws an exception or returns YStepperMotor.MAXSPEED_INVALID.
            result = obj.InvokeMethod_F(1589571885);
        end

        function result = get_stepping(obj)
            % Returns the stepping mode used to drive the motor.
            %
            % @return a value among YStepperMotor.STEPPING_MICROSTEP16,
            % YStepperMotor.STEPPING_MICROSTEP8, YStepperMotor.STEPPING_MICROSTEP4,
            % YStepperMotor.STEPPING_HALFSTEP and YStepperMotor.STEPPING_FULLSTEP corresponding to
            % the stepping mode used to drive the motor
            %
            % On failure, throws an exception or returns YStepperMotor.STEPPING_INVALID.
            result = YoctoProxyAPI.EnumStepping(obj.InvokeMethod_D(1725756870));
        end

        function set_stepping(obj, newVal)
            % Changes the stepping mode used to drive the motor.
            %
            % @param newval : a value among YStepperMotor.STEPPING_MICROSTEP16,
            % YStepperMotor.STEPPING_MICROSTEP8, YStepperMotor.STEPPING_MICROSTEP4,
            % YStepperMotor.STEPPING_HALFSTEP and YStepperMotor.STEPPING_FULLSTEP corresponding to
            % the stepping mode used to drive the motor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(581723769, newVal);
        end

        function result = get_overcurrent(obj)
            % Returns the overcurrent alert and emergency stop threshold, measured in mA.
            %
            % @return an integer corresponding to the overcurrent alert and emergency stop threshold,
            % measured in mA
            %
            % On failure, throws an exception or returns YStepperMotor.OVERCURRENT_INVALID.
            result = obj.InvokeMethod_D(1022770595);
        end

        function set_overcurrent(obj, newVal)
            % Changes the overcurrent alert and emergency stop threshold, measured in mA.
            %
            % @param newval : an integer corresponding to the overcurrent alert and emergency stop
            % threshold, measured in mA
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1673634777, newVal);
        end

        function result = get_tCurrStop(obj)
            % Returns the torque regulation current when the motor is stopped, measured in mA.
            %
            % @return an integer corresponding to the torque regulation current when the motor is
            % stopped, measured in mA
            %
            % On failure, throws an exception or returns YStepperMotor.TCURRSTOP_INVALID.
            result = obj.InvokeMethod_D(-610385709);
        end

        function set_tCurrStop(obj, newVal)
            % Changes the torque regulation current when the motor is stopped, measured in mA.
            %
            % @param newval : an integer corresponding to the torque regulation current when the
            % motor is stopped, measured in mA
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(787388983, newVal);
        end

        function result = get_tCurrRun(obj)
            % Returns the torque regulation current when the motor is running, measured in mA.
            %
            % @return an integer corresponding to the torque regulation current when the motor is
            % running, measured in mA
            %
            % On failure, throws an exception or returns YStepperMotor.TCURRRUN_INVALID.
            result = obj.InvokeMethod_D(914661419);
        end

        function set_tCurrRun(obj, newVal)
            % Changes the torque regulation current when the motor is running, measured in mA.
            %
            % @param newval : an integer corresponding to the torque regulation current when the
            % motor is running, measured in mA
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1928606612, newVal);
        end

        function result = get_auxSignal(obj)
            % Returns the current value of the signal generated on the auxiliary output.
            %
            % @return an integer corresponding to the current value of the signal generated on the
            % auxiliary output
            %
            % On failure, throws an exception or returns YStepperMotor.AUXSIGNAL_INVALID.
            result = obj.InvokeMethod_D(-2134872015);
        end

        function set_auxSignal(obj, newVal)
            % Changes the value of the signal generated on the auxiliary output.
            % Acceptable values depend on the auxiliary output signal type configured.
            %
            % @param newval : an integer corresponding to the value of the signal generated on the
            % auxiliary output
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1974512341, newVal);
        end

        function result = reset(obj)
            % Reinitialize the controller and clear all alert flags.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        function result = findHomePosition(obj, speed)
            % Starts the motor backward at the specified speed, to search for the motor home position.
            %
            % @param speed : desired speed, in steps per second.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(881844422, speed);
        end

        function result = changeSpeed(obj, speed)
            % Starts the motor at a given speed. The time needed to reach the requested speed
            % will depend on the acceleration parameters configured for the motor.
            %
            % @param speed : desired speed, in steps per second. The minimal non-zero speed
            %         is 0.001 pulse per second.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(1009228242, speed);
        end

        function result = moveTo(obj, absPos)
            % Starts the motor to reach a given absolute position. The time needed to reach the requested
            % position will depend on the acceleration and max speed parameters configured for
            % the motor.
            %
            % @param absPos : absolute position, measured in steps from the origin.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(1822233101, absPos);
        end

        function result = moveRel(obj, relPos)
            % Starts the motor to reach a given relative position. The time needed to reach the requested
            % position will depend on the acceleration and max speed parameters configured for
            % the motor.
            %
            % @param relPos : relative position, measured in steps from the current position.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(-1044878323, relPos);
        end

        function result = moveRelSlow(obj, relPos, maxSpeed)
            % Starts the motor to reach a given relative position, keeping the speed under the
            % specified limit. The time needed to reach the requested position will depend on
            % the acceleration parameters configured for the motor.
            %
            % @param relPos : relative position, measured in steps from the current position.
            % @param maxSpeed : limit speed, in steps per second.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dff(-496693321, relPos, maxSpeed);
        end

        function result = pause(obj, waitMs)
            % Keep the motor in the same state for the specified amount of time, before processing next command.
            %
            % @param waitMs : wait time, specified in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1258533319, waitMs);
        end

        function result = emergencyStop(obj)
            % Stops the motor with an emergency alert, without taking any additional precaution.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1184506499);
        end

        function result = alertStepOut(obj)
            % Move one step in the direction opposite the direction set when the most recent alert was raised.
            % The move occurs even if the system is still in alert mode (end switch depressed). Caution.
            % use this function with great care as it may cause mechanical damages !
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1786989049);
        end

        function result = alertStepDir(obj, dir)
            % Move one single step in the selected direction without regards to end switches.
            % The move occurs even if the system is still in alert mode (end switch depressed). Caution.
            % use this function with great care as it may cause mechanical damages !
            %
            % @param dir : Value +1 or -1, according to the desired direction of the move
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-326076859, dir);
        end

        function result = abortAndBrake(obj)
            % Stops the motor smoothly as soon as possible, without waiting for ongoing move completion.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2142153652);
        end

        function result = abortAndHiZ(obj)
            % Turn the controller into Hi-Z mode immediately, without waiting for ongoing move completion.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(711487166);
        end

        % //--- (end of YStepperMotor accessors declaration)
    end
end
