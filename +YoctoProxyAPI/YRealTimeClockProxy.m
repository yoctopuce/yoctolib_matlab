% YRealTimeClockProxy: real-time clock control interface, available for instance in the
% YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
% 
% The YRealTimeClockProxy class provide access to the embedded real-time clock available on some
% Yoctopuce devices. It can provide current date and time, even after a power outage lasting several
% days. It is the base for automated wake-up functions provided by the WakeUpScheduler. The current
% time may represent a local time as well as an UTC time, but no automatic time change will occur to
% account for daylight saving time.

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


% //--- (YRealTimeClock declaration)
classdef YRealTimeClockProxy < YoctoProxyAPI.YFunctionProxy
    % YRealTimeClockProxy: real-time clock control interface, available for instance in the
    % YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
    % 
    % The YRealTimeClockProxy class provide access to the embedded real-time clock available on some
    % Yoctopuce devices. It can provide current date and time, even after a power outage lasting several
    % days. It is the base for automated wake-up functions provided by the WakeUpScheduler. The current
    % time may represent a local time as well as an UTC time, but no automatic time change will occur to
    % account for daylight saving time.

    properties (Transient, Nontunable)
        % UtcOffset Number of seconds between current time and UTC time (time zone)
        UtcOffset (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YRealTimeClock declaration)

    % //--- (YRealTimeClock implementation)
    methods (Hidden)
        function obj = YRealTimeClockProxy()
            % YRealTimeClockProxy For internal use as System Object.
            % Use FindRealTimeClock() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1728580619;
        end
    end

    methods (Static)
        function obj = FindRealTimeClock(func)
            % FindRealTimeClock Retrieve instances of YRealTimeClockProxy
            obj = YoctoProxyAPI.YRealTimeClockProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindRealTimeClock to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1728580619);
        end
    end
    % //--- (end of YRealTimeClock implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YRealTimeClockProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'RealTimeClock');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'RealTimeClock', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'RealTimeClock settings', ...
                'PropertyList', {'UtcOffset'});
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
        % //--- (YRealTimeClock accessors declaration)

        function result = get_unixTime(obj)
            % Returns the current time in Unix format (number of elapsed seconds since Jan 1st, 1970).
            %
            % @return an integer corresponding to the current time in Unix format (number of elapsed
            % seconds since Jan 1st, 1970)
            %
            % On failure, throws an exception or returns Y_UNIXTIME_INVALID.
            result = obj.InvokeMethod_Q(-692204019);
        end

        function set_unixTime(obj, newVal)
            % Changes the current time. Time is specifid in Unix format (number of elapsed seconds
            % since Jan 1st, 1970).
            %
            % @param newval : an integer corresponding to the current time
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(-1832034894, newVal);
        end

        function result = get_dateTime(obj)
            % Returns the current time in the form "YYYY/MM/DD hh:mm:ss".
            %
            % @return a string corresponding to the current time in the form "YYYY/MM/DD hh:mm:ss"
            %
            % On failure, throws an exception or returns Y_DATETIME_INVALID.
            result = obj.InvokeMethod_S(-825142318);
        end

        function result = get_utcOffset(obj)
            % Returns the number of seconds between current time and UTC time (time zone).
            %
            % @return an integer corresponding to the number of seconds between current time and UTC
            % time (time zone)
            %
            % On failure, throws an exception or returns Y_UTCOFFSET_INVALID.
            result = obj.InvokeMethod_D(1285538158);
        end

        function set_utcOffset(obj, newVal)
            % Changes the number of seconds between current time and UTC time (time zone).
            % The timezone is automatically rounded to the nearest multiple of 15 minutes.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the number of seconds between current time
            % and UTC time (time zone)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1175512182, newVal);
        end

        function result = get.UtcOffset(obj)
            result = obj.GetPropInt32(-1544767552);
        end

        function set.UtcOffset(obj, newVal)
            obj.UtcOffset = newVal;
            obj.SetPropInt32(-1544767552, newVal);
        end

        function result = get_timeSet(obj)
            % Returns true if the clock has been set, and false otherwise.
            %
            % @return either Y_TIMESET_FALSE or Y_TIMESET_TRUE, according to true if the clock has
            % been set, and false otherwise
            %
            % On failure, throws an exception or returns Y_TIMESET_INVALID.
            result = YoctoProxyAPI.EnumTimeSet(obj.InvokeMethod_D(1987268889));
        end

        % //--- (end of YRealTimeClock accessors declaration)
    end
end
