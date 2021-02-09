% YWakeUpMonitorProxy: wake-up monitor control interface, available for instance in the
% YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA, the YoctoHub-GSM-4G or the YoctoHub-Wireless-n
% 
% The YWakeUpMonitorProxy class handles globally all wake-up sources, as well as automated sleep mode.

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


% //--- (YWakeUpMonitor declaration)
classdef YWakeUpMonitorProxy < YoctoProxyAPI.YFunctionProxy
    % YWakeUpMonitorProxy: wake-up monitor control interface, available for instance in the
    % YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA, the YoctoHub-GSM-4G or the YoctoHub-Wireless-n
    % 
    % The YWakeUpMonitorProxy class handles globally all wake-up sources, as well as automated sleep mode.

    properties (Transient, Nontunable)
        % PowerDuration Maximal wake up time (in seconds) before automatically going to sleep
        PowerDuration (1,1) int32
        % NextWakeUp Next scheduled wake up date/time (UNIX format)
        NextWakeUp (1,1) int64
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YWakeUpMonitor declaration)

    % //--- (YWakeUpMonitor implementation)
    methods (Hidden)
        function obj = YWakeUpMonitorProxy()
            % YWakeUpMonitorProxy For internal use as System Object.
            % Use FindWakeUpMonitor() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1424989366;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindWakeUpMonitor(func)
            % FindWakeUpMonitor Retrieve instances of YWakeUpMonitorProxy
            obj = YoctoProxyAPI.YWakeUpMonitorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindWakeUpMonitor to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1424989366);
        end
    end
    % //--- (end of YWakeUpMonitor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YWakeUpMonitorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'WakeUpMonitor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'WakeUpMonitor', ...
                'PropertyList', {'NextWakeUp'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'WakeUpMonitor settings', ...
                'PropertyList', {'PowerDuration'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropInt64(-1833688379);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int64';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'NextWakeUp';
        end
    end

    methods
        % //--- (YWakeUpMonitor accessors declaration)

        function result = get_powerDuration(obj)
            % Returns the maximal wake up time (in seconds) before automatically going to sleep.
            %
            % @return an integer corresponding to the maximal wake up time (in seconds) before
            % automatically going to sleep
            %
            % On failure, throws an exception or returns YWakeUpMonitor.POWERDURATION_INVALID.
            result = obj.InvokeMethod_D(595014578);
        end

        function set_powerDuration(obj, newVal)
            % Changes the maximal wake up time (seconds) before automatically going to sleep.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the maximal wake up time (seconds) before
            % automatically going to sleep
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-499964526, newVal);
        end

        function result = get.PowerDuration(obj)
            result = obj.GetPropInt32(2024922210);
        end

        function set.PowerDuration(obj, newVal)
            obj.PowerDuration = newVal;
            obj.SetPropInt32(2024922210, newVal);
        end

        function result = get_sleepCountdown(obj)
            % Returns the delay before the  next sleep period.
            %
            % @return an integer corresponding to the delay before the  next sleep period
            %
            % On failure, throws an exception or returns YWakeUpMonitor.SLEEPCOUNTDOWN_INVALID.
            result = obj.InvokeMethod_D(1816871795);
        end

        function set_sleepCountdown(obj, newVal)
            % Changes the delay before the next sleep period.
            %
            % @param newval : an integer corresponding to the delay before the next sleep period
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-116513849, newVal);
        end

        function result = get_nextWakeUp(obj)
            % Returns the next scheduled wake up date/time (UNIX format).
            %
            % @return an integer corresponding to the next scheduled wake up date/time (UNIX format)
            %
            % On failure, throws an exception or returns YWakeUpMonitor.NEXTWAKEUP_INVALID.
            result = obj.InvokeMethod_Q(-467876833);
        end

        function set_nextWakeUp(obj, newVal)
            % Changes the days of the week when a wake up must take place.
            %
            % @param newval : an integer corresponding to the days of the week when a wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(-312174898, newVal);
        end

        function result = get.NextWakeUp(obj)
            result = obj.GetPropInt64(-1833688379);
        end

        function set.NextWakeUp(obj, newVal)
            obj.NextWakeUp = newVal;
            obj.SetPropInt64(-1833688379, newVal);
        end

        function result = get_wakeUpReason(obj)
            % Returns the latest wake up reason.
            %
            % @return a value among YWakeUpMonitor.WAKEUPREASON_USBPOWER,
            % YWakeUpMonitor.WAKEUPREASON_EXTPOWER, YWakeUpMonitor.WAKEUPREASON_ENDOFSLEEP,
            % YWakeUpMonitor.WAKEUPREASON_EXTSIG1, YWakeUpMonitor.WAKEUPREASON_SCHEDULE1 and
            % YWakeUpMonitor.WAKEUPREASON_SCHEDULE2 corresponding to the latest wake up reason
            %
            % On failure, throws an exception or returns YWakeUpMonitor.WAKEUPREASON_INVALID.
            result = YoctoProxyAPI.EnumWakeUpReason(obj.InvokeMethod_D(1646271557));
        end

        function result = get_wakeUpState(obj)
            % Returns  the current state of the monitor.
            %
            % @return either YWakeUpMonitor.WAKEUPSTATE_SLEEPING or YWakeUpMonitor.WAKEUPSTATE_AWAKE,
            % according to  the current state of the monitor
            %
            % On failure, throws an exception or returns YWakeUpMonitor.WAKEUPSTATE_INVALID.
            result = YoctoProxyAPI.EnumWakeUpState(obj.InvokeMethod_D(1089356677));
        end

        function result = wakeUp(obj)
            % Forces a wake up.
            result = obj.InvokeMethod_D(958878919);
        end

        function result = sleep(obj, secBeforeSleep)
            % Goes to sleep until the next wake up condition is met,  the
            % RTC time must have been set before calling this function.
            %
            % @param secBeforeSleep : number of seconds before going into sleep mode,
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-803868914, secBeforeSleep);
        end

        function result = sleepFor(obj, secUntilWakeUp, secBeforeSleep)
            % Goes to sleep for a specific duration or until the next wake up condition is met, the
            % RTC time must have been set before calling this function. The count down before sleep
            % can be canceled with resetSleepCountDown.
            %
            % @param secUntilWakeUp : number of seconds before next wake up
            % @param secBeforeSleep : number of seconds before going into sleep mode
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(226325682, secUntilWakeUp, secBeforeSleep);
        end

        function result = sleepUntil(obj, wakeUpTime, secBeforeSleep)
            % Go to sleep until a specific date is reached or until the next wake up condition is met, the
            % RTC time must have been set before calling this function. The count down before sleep
            % can be canceled with resetSleepCountDown.
            %
            % @param wakeUpTime : wake-up datetime (UNIX format)
            % @param secBeforeSleep : number of seconds before going into sleep mode
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1915838630, wakeUpTime, secBeforeSleep);
        end

        function result = resetSleepCountDown(obj)
            % Resets the sleep countdown.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-527920630);
        end

        % //--- (end of YWakeUpMonitor accessors declaration)
    end
end
