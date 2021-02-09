% YRelayProxy: relay control interface, available for instance in the Yocto-LatchedRelay, the
% Yocto-MaxiPowerRelay, the Yocto-PowerRelay-V3 or the Yocto-Relay
% 
% The YRelayProxy class allows you to drive a Yoctopuce relay or optocoupled output. It can be used
% to simply switch the output on or off, but also to automatically generate short pulses of
% determined duration. On devices with two output for each relay (double throw), the two outputs are
% named A and B, with output A corresponding to the idle position (normally closed) and the output B
% corresponding to the active state (normally open).

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


% //--- (YRelay declaration)
classdef YRelayProxy < YoctoProxyAPI.YFunctionProxy
    % YRelayProxy: relay control interface, available for instance in the Yocto-LatchedRelay, the
    % Yocto-MaxiPowerRelay, the Yocto-PowerRelay-V3 or the Yocto-Relay
    % 
    % The YRelayProxy class allows you to drive a Yoctopuce relay or optocoupled output. It can be used
    % to simply switch the output on or off, but also to automatically generate short pulses of
    % determined duration. On devices with two output for each relay (double throw), the two outputs are
    % named A and B, with output A corresponding to the idle position (normally closed) and the output B
    % corresponding to the active state (normally open).

    properties (Transient, Nontunable)
        % State State of the relays (A for the idle position, B for the active position)
        State (1,1) YoctoProxyAPI.EnumState
        % StateAtPowerOn State of the relays at device startup (A for the idle position,
        StateAtPowerOn (1,1) YoctoProxyAPI.EnumStateAtPowerOn
        % MaxTimeOnStateA Maximum time (ms) allowed for the relay to stay in state
        MaxTimeOnStateA (1,1) int64
        % MaxTimeOnStateB The maximum time (ms) allowed for the relay to stay in state B
        MaxTimeOnStateB (1,1) int64
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YRelay declaration)

    % //--- (YRelay implementation)
    methods (Hidden)
        function obj = YRelayProxy()
            % YRelayProxy For internal use as System Object.
            % Use FindRelay() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1661219395;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindRelay(func)
            % FindRelay Retrieve instances of YRelayProxy
            obj = YoctoProxyAPI.YRelayProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindRelay to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1661219395);
        end
    end
    % //--- (end of YRelay implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YRelayProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Relay');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Relay', ...
                'PropertyList', {'State'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Relay settings', ...
                'PropertyList', {'StateAtPowerOn','MaxTimeOnStateA','MaxTimeOnStateB'});
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
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'State';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YRelay accessors declaration)

        function result = get_state(obj)
            % Returns the state of the relays (A for the idle position, B for the active position).
            %
            % @return either YRelay.STATE_A or YRelay.STATE_B, according to the state of the relays
            % (A for the idle position, B for the active position)
            %
            % On failure, throws an exception or returns YRelay.STATE_INVALID.
            result = YoctoProxyAPI.EnumState(obj.InvokeMethod_D(190689118));
        end

        function set_state(obj, newVal)
            % Changes the state of the relays (A for the idle position, B for the active position).
            %
            % @param newval : either YRelay.STATE_A or YRelay.STATE_B, according to the state of the
            % relays (A for the idle position, B for the active position)
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
            % Returns the state of the relays at device startup (A for the idle position,
            % B for the active position, UNCHANGED to leave the relay state as is).
            %
            % @return a value among YRelay.STATEATPOWERON_UNCHANGED, YRelay.STATEATPOWERON_A and
            % YRelay.STATEATPOWERON_B corresponding to the state of the relays at device startup (A
            % for the idle position,
            %         B for the active position, UNCHANGED to leave the relay state as is)
            %
            % On failure, throws an exception or returns YRelay.STATEATPOWERON_INVALID.
            result = YoctoProxyAPI.EnumStateAtPowerOn(obj.InvokeMethod_D(-678218502));
        end

        function set_stateAtPowerOn(obj, newVal)
            % Changes the state of the relays at device startup (A for the idle position,
            % B for the active position, UNCHANGED to leave the relay state as is).
            % Remember to call the matching module saveToFlash()
            % method, otherwise this call will have no effect.
            %
            % @param newval : a value among YRelay.STATEATPOWERON_UNCHANGED, YRelay.STATEATPOWERON_A
            % and YRelay.STATEATPOWERON_B corresponding to the state of the relays at device startup
            % (A for the idle position,
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
            % Returns the maximum time (ms) allowed for the relay to stay in state
            % A before automatically switching back in to B state. Zero means no time limit.
            %
            % @return an integer corresponding to the maximum time (ms) allowed for the relay to stay in state
            %         A before automatically switching back in to B state
            %
            % On failure, throws an exception or returns YRelay.MAXTIMEONSTATEA_INVALID.
            result = obj.InvokeMethod_Q(136334968);
        end

        function set_maxTimeOnStateA(obj, newVal)
            % Changes the maximum time (ms) allowed for the relay to stay in state A
            % before automatically switching back in to B state. Use zero for no time limit.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the maximum time (ms) allowed for the relay
            % to stay in state A
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
            % Retourne the maximum time (ms) allowed for the relay to stay in state B
            % before automatically switching back in to A state. Zero means no time limit.
            %
            % @return an integer
            %
            % On failure, throws an exception or returns YRelay.MAXTIMEONSTATEB_INVALID.
            result = obj.InvokeMethod_Q(174518305);
        end

        function set_maxTimeOnStateB(obj, newVal)
            % Changes the maximum time (ms) allowed for the relay to stay in state B before
            % automatically switching back in to A state. Use zero for no time limit.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the maximum time (ms) allowed for the relay
            % to stay in state B before
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
            % Returns the output state of the relays, when used as a simple switch (single throw).
            %
            % @return either YRelay.OUTPUT_OFF or YRelay.OUTPUT_ON, according to the output state of
            % the relays, when used as a simple switch (single throw)
            %
            % On failure, throws an exception or returns YRelay.OUTPUT_INVALID.
            result = YoctoProxyAPI.EnumOutput(obj.InvokeMethod_D(-911973276));
        end

        function set_output(obj, newVal)
            % Changes the output state of the relays, when used as a simple switch (single throw).
            %
            % @param newval : either YRelay.OUTPUT_OFF or YRelay.OUTPUT_ON, according to the output
            % state of the relays, when used as a simple switch (single throw)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-36400593, newVal);
        end

        function result = get_pulseTimer(obj)
            % Returns the number of milliseconds remaining before the relays is returned to idle position
            % (state A), during a measured pulse generation. When there is no ongoing pulse, returns zero.
            %
            % @return an integer corresponding to the number of milliseconds remaining before the
            % relays is returned to idle position
            %         (state A), during a measured pulse generation
            %
            % On failure, throws an exception or returns YRelay.PULSETIMER_INVALID.
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
            % On failure, throws an exception or returns YRelay.COUNTDOWN_INVALID.
            result = obj.InvokeMethod_Q(-1586370564);
        end

        function result = toggle(obj)
            % Switch the relay to the opposite state.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(2103143890);
        end

        % //--- (end of YRelay accessors declaration)
    end
end
