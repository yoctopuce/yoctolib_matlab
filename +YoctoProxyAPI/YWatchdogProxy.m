% YWatchdogProxy: watchdog control interface, available for instance in the Yocto-WatchdogDC
% 
% The YWatchdogProxy class allows you to drive a Yoctopuce watchdog. A watchdog works like a relay,
% with an extra timer that can automatically trigger a brief power cycle to an appliance after a
% preset delay, to force this appliance to reset if a problem occurs. During normal use, the watchdog
% timer is reset periodically by the application to prevent the automated power cycle. Whenever the
% application dies, the watchdog will automatically trigger the power cycle. The watchdog can also be
% driven directly with <tt>pulse</tt> and <tt>delayedPulse</tt> methods to switch off an appliance
% for a given duration.

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


% //--- (YWatchdog declaration)
classdef YWatchdogProxy < YoctoProxyAPI.YFunctionProxy
    % YWatchdogProxy: watchdog control interface, available for instance in the Yocto-WatchdogDC
    % 
    % The YWatchdogProxy class allows you to drive a Yoctopuce watchdog. A watchdog works like a relay,
    % with an extra timer that can automatically trigger a brief power cycle to an appliance after a
    % preset delay, to force this appliance to reset if a problem occurs. During normal use, the watchdog
    % timer is reset periodically by the application to prevent the automated power cycle. Whenever the
    % application dies, the watchdog will automatically trigger the power cycle. The watchdog can also be
    % driven directly with <tt>pulse</tt> and <tt>delayedPulse</tt> methods to switch off an appliance
    % for a given duration.

    properties (Transient, Nontunable)
        % State State of the watchdog (A for the idle position, B for the active position)
        State (1,1) YoctoProxyAPI.EnumState
        % StateAtPowerOn State of the watchdog at device startup (A for the idle position,
        StateAtPowerOn (1,1) YoctoProxyAPI.EnumStateAtPowerOn
        % MaxTimeOnStateA Maximum time (ms) allowed for the watchdog to stay in state
        MaxTimeOnStateA (1,1) int64
        % MaxTimeOnStateB The maximum time (ms) allowed for the watchdog to stay in state B
        MaxTimeOnStateB (1,1) int64
        % AutoStart Watchdog running state at module power on
        AutoStart (1,1) YoctoProxyAPI.EnumAutoStart
        % Running Watchdog running state
        Running (1,1) YoctoProxyAPI.EnumRunning
        % TriggerDelay Waiting duration before a reset is automatically triggered by the watchdog, in milliseconds
        TriggerDelay (1,1) int64
        % TriggerDuration Duration of resets caused by the watchdog, in milliseconds
        TriggerDuration (1,1) int64
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YWatchdog declaration)

    % //--- (YWatchdog implementation)
    methods (Hidden)
        function obj = YWatchdogProxy()
            % YWatchdogProxy For internal use as System Object.
            % Use FindWatchdog() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -639754450;
            obj.numInputs = 2;
        end
    end

    methods (Static)
        function obj = FindWatchdog(func)
            % FindWatchdog Retrieve instances of YWatchdogProxy
            obj = YoctoProxyAPI.YWatchdogProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindWatchdog to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-639754450);
        end
    end
    % //--- (end of YWatchdog implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YWatchdogProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Watchdog');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Watchdog', ...
                'PropertyList', {'State','Running'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Watchdog settings', ...
                'PropertyList', {'StateAtPowerOn','MaxTimeOnStateA','MaxTimeOnStateB','AutoStart','TriggerDelay','TriggerDuration'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(1649606143, varargin{1});
            end
            if nargin >= 2
                obj.SetPropInt32(-526601997, varargin{2});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1,name2] = getInputNamesImpl(~)
            name1 = 'State';
            name2 = 'Running';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YWatchdog accessors declaration)

        function result = get_state(obj)
            % Returns the state of the watchdog (A for the idle position, B for the active position).
            %
            % @return either YWatchdog.STATE_A or YWatchdog.STATE_B, according to the state of the
            % watchdog (A for the idle position, B for the active position)
            %
            % On failure, throws an exception or returns YWatchdog.STATE_INVALID.
            result = YoctoProxyAPI.EnumState(obj.InvokeMethod_D(190689118));
        end

        function set_state(obj, newVal)
            % Changes the state of the watchdog (A for the idle position, B for the active position).
            %
            % @param newval : either YWatchdog.STATE_A or YWatchdog.STATE_B, according to the state
            % of the watchdog (A for the idle position, B for the active position)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(773601503, newVal);
        end

        function result = get.State(obj)
            result = YoctoProxyAPI.EnumState(obj.GetPropInt32(1649606143));
        end

        function set.State(obj, newVal)
            obj.State = newVal;
            obj.SetPropInt32(1649606143, newVal);
        end

        function result = get_stateAtPowerOn(obj)
            % Returns the state of the watchdog at device startup (A for the idle position,
            % B for the active position, UNCHANGED to leave the relay state as is).
            %
            % @return a value among YWatchdog.STATEATPOWERON_UNCHANGED, YWatchdog.STATEATPOWERON_A
            % and YWatchdog.STATEATPOWERON_B corresponding to the state of the watchdog at device
            % startup (A for the idle position,
            %         B for the active position, UNCHANGED to leave the relay state as is)
            %
            % On failure, throws an exception or returns YWatchdog.STATEATPOWERON_INVALID.
            result = YoctoProxyAPI.EnumStateAtPowerOn(obj.InvokeMethod_D(-678218502));
        end

        function set_stateAtPowerOn(obj, newVal)
            % Changes the state of the watchdog at device startup (A for the idle position,
            % B for the active position, UNCHANGED to leave the relay state as is).
            % Remember to call the matching module saveToFlash()
            % method, otherwise this call will have no effect.
            %
            % @param newval : a value among YWatchdog.STATEATPOWERON_UNCHANGED,
            % YWatchdog.STATEATPOWERON_A and YWatchdog.STATEATPOWERON_B corresponding to the state of
            % the watchdog at device startup (A for the idle position,
            %         B for the active position, UNCHANGED to leave the relay state as is)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1121342542, newVal);
        end

        function result = get.StateAtPowerOn(obj)
            result = YoctoProxyAPI.EnumStateAtPowerOn(obj.GetPropInt32(-867300382));
        end

        function set.StateAtPowerOn(obj, newVal)
            obj.StateAtPowerOn = newVal;
            obj.SetPropInt32(-867300382, newVal);
        end

        function result = get_maxTimeOnStateA(obj)
            % Returns the maximum time (ms) allowed for the watchdog to stay in state
            % A before automatically switching back in to B state. Zero means no time limit.
            %
            % @return an integer corresponding to the maximum time (ms) allowed for the watchdog to stay in state
            %         A before automatically switching back in to B state
            %
            % On failure, throws an exception or returns YWatchdog.MAXTIMEONSTATEA_INVALID.
            result = obj.InvokeMethod_Q(136334968);
        end

        function set_maxTimeOnStateA(obj, newVal)
            % Changes the maximum time (ms) allowed for the watchdog to stay in state A
            % before automatically switching back in to B state. Use zero for no time limit.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the maximum time (ms) allowed for the
            % watchdog to stay in state A
            %         before automatically switching back in to B state
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(1783855335, newVal);
        end

        function result = get.MaxTimeOnStateA(obj)
            result = obj.GetPropInt64(1380265060);
        end

        function set.MaxTimeOnStateA(obj, newVal)
            obj.MaxTimeOnStateA = newVal;
            obj.SetPropInt64(1380265060, newVal);
        end

        function result = get_maxTimeOnStateB(obj)
            % Retourne the maximum time (ms) allowed for the watchdog to stay in state B
            % before automatically switching back in to A state. Zero means no time limit.
            %
            % @return an integer
            %
            % On failure, throws an exception or returns YWatchdog.MAXTIMEONSTATEB_INVALID.
            result = obj.InvokeMethod_Q(174518305);
        end

        function set_maxTimeOnStateB(obj, newVal)
            % Changes the maximum time (ms) allowed for the watchdog to stay in state B before
            % automatically switching back in to A state. Use zero for no time limit.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the maximum time (ms) allowed for the
            % watchdog to stay in state B before
            %         automatically switching back in to A state
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(1746257598, newVal);
        end

        function result = get.MaxTimeOnStateB(obj)
            result = obj.GetPropInt64(-884179490);
        end

        function set.MaxTimeOnStateB(obj, newVal)
            obj.MaxTimeOnStateB = newVal;
            obj.SetPropInt64(-884179490, newVal);
        end

        function result = get_output(obj)
            % Returns the output state of the watchdog, when used as a simple switch (single throw).
            %
            % @return either YWatchdog.OUTPUT_OFF or YWatchdog.OUTPUT_ON, according to the output
            % state of the watchdog, when used as a simple switch (single throw)
            %
            % On failure, throws an exception or returns YWatchdog.OUTPUT_INVALID.
            result = YoctoProxyAPI.EnumOutput(obj.InvokeMethod_D(-911973276));
        end

        function set_output(obj, newVal)
            % Changes the output state of the watchdog, when used as a simple switch (single throw).
            %
            % @param newval : either YWatchdog.OUTPUT_OFF or YWatchdog.OUTPUT_ON, according to the
            % output state of the watchdog, when used as a simple switch (single throw)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-36400593, newVal);
        end

        function result = get_pulseTimer(obj)
            % Returns the number of milliseconds remaining before the watchdog is returned to idle position
            % (state A), during a measured pulse generation. When there is no ongoing pulse, returns zero.
            %
            % @return an integer corresponding to the number of milliseconds remaining before the
            % watchdog is returned to idle position
            %         (state A), during a measured pulse generation
            %
            % On failure, throws an exception or returns YWatchdog.PULSETIMER_INVALID.
            result = obj.InvokeMethod_Q(1447258781);
        end

        function pulse(obj, ms_duration)
            % Sets the relay to output B (active) for a specified duration, then brings it
            % automatically back to output A (idle state).
            %
            % @param ms_duration : pulse duration, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(910420744, ms_duration);
        end

        function delayedPulse(obj, ms_delay, ms_duration)
            % Schedules a pulse.
            %
            % @param ms_delay : waiting time before the pulse, in milliseconds
            % @param ms_duration : pulse duration, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_dd(-1994666463, ms_delay, ms_duration);
        end

        function result = get_countdown(obj)
            % Returns the number of milliseconds remaining before a pulse (delayedPulse() call)
            % When there is no scheduled pulse, returns zero.
            %
            % @return an integer corresponding to the number of milliseconds remaining before a pulse
            % (delayedPulse() call)
            %         When there is no scheduled pulse, returns zero
            %
            % On failure, throws an exception or returns YWatchdog.COUNTDOWN_INVALID.
            result = obj.InvokeMethod_Q(-1586370564);
        end

        function result = get_autoStart(obj)
            % Returns the watchdog running state at module power on.
            %
            % @return either YWatchdog.AUTOSTART_OFF or YWatchdog.AUTOSTART_ON, according to the
            % watchdog running state at module power on
            %
            % On failure, throws an exception or returns YWatchdog.AUTOSTART_INVALID.
            result = YoctoProxyAPI.EnumAutoStart(obj.InvokeMethod_D(-284241322));
        end

        function set_autoStart(obj, newVal)
            % Changes the watchdog running state at module power on. Remember to call the
            % saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param newval : either YWatchdog.AUTOSTART_OFF or YWatchdog.AUTOSTART_ON, according to
            % the watchdog running state at module power on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(444467378, newVal);
        end

        function result = get.AutoStart(obj)
            result = YoctoProxyAPI.EnumAutoStart(obj.GetPropInt32(-1303422913));
        end

        function set.AutoStart(obj, newVal)
            obj.AutoStart = newVal;
            obj.SetPropInt32(-1303422913, newVal);
        end

        function result = get_running(obj)
            % Returns the watchdog running state.
            %
            % @return either YWatchdog.RUNNING_OFF or YWatchdog.RUNNING_ON, according to the watchdog
            % running state
            %
            % On failure, throws an exception or returns YWatchdog.RUNNING_INVALID.
            result = YoctoProxyAPI.EnumRunning(obj.InvokeMethod_D(1470291110));
        end

        function set_running(obj, newVal)
            % Changes the running state of the watchdog.
            %
            % @param newval : either YWatchdog.RUNNING_OFF or YWatchdog.RUNNING_ON, according to the
            % running state of the watchdog
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(410136610, newVal);
        end

        function result = get.Running(obj)
            result = YoctoProxyAPI.EnumRunning(obj.GetPropInt32(-526601997));
        end

        function set.Running(obj, newVal)
            obj.Running = newVal;
            obj.SetPropInt32(-526601997, newVal);
        end

        function resetWatchdog(obj, )
            % Resets the watchdog. When the watchdog is running, this function
            % must be called on a regular basis to prevent the watchdog to
            % trigger
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_(1464029032, );
        end

        function result = get_triggerDelay(obj)
            % Returns  the waiting duration before a reset is automatically triggered by the
            % watchdog, in milliseconds.
            %
            % @return an integer corresponding to  the waiting duration before a reset is
            % automatically triggered by the watchdog, in milliseconds
            %
            % On failure, throws an exception or returns YWatchdog.TRIGGERDELAY_INVALID.
            result = obj.InvokeMethod_Q(1417459193);
        end

        function set_triggerDelay(obj, newVal)
            % Changes the waiting delay before a reset is triggered by the watchdog,
            % in milliseconds. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the waiting delay before a reset is
            % triggered by the watchdog,
            %         in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(1243160111, newVal);
        end

        function result = get.TriggerDelay(obj)
            result = obj.GetPropInt64(119910737);
        end

        function set.TriggerDelay(obj, newVal)
            obj.TriggerDelay = newVal;
            obj.SetPropInt64(119910737, newVal);
        end

        function result = get_triggerDuration(obj)
            % Returns the duration of resets caused by the watchdog, in milliseconds.
            %
            % @return an integer corresponding to the duration of resets caused by the watchdog, in milliseconds
            %
            % On failure, throws an exception or returns YWatchdog.TRIGGERDURATION_INVALID.
            result = obj.InvokeMethod_Q(-1582727134);
        end

        function set_triggerDuration(obj, newVal)
            % Changes the duration of resets caused by the watchdog, in milliseconds.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the duration of resets caused by the
            % watchdog, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(-1009076547, newVal);
        end

        function result = get.TriggerDuration(obj)
            result = obj.GetPropInt64(-2015086004);
        end

        function set.TriggerDuration(obj, newVal)
            obj.TriggerDuration = newVal;
            obj.SetPropInt64(-2015086004, newVal);
        end

        function result = get_lastTrigger(obj)
            % Returns the number of seconds spent since the last output power-up event.
            %
            % @return an integer corresponding to the number of seconds spent since the last output power-up event
            %
            % On failure, throws an exception or returns YWatchdog.LASTTRIGGER_INVALID.
            result = obj.InvokeMethod_D(1845132316);
        end

        function result = toggle(obj)
            % Switch the relay to the opposite state.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(2103143890);
        end

        % //--- (end of YWatchdog accessors declaration)
    end
end
