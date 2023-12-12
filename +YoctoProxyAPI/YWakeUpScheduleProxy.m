% YWakeUpScheduleProxy: wake up schedule control interface, available for instance in the
% YoctoHub-GSM-4G, the YoctoHub-Wireless-SR, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
% 
% The YWakeUpScheduleProxy class implements a wake up condition. The wake up time is specified as a
% set of months and/or days and/or hours and/or minutes when the wake up should happen.

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


% //--- (YWakeUpSchedule declaration)
classdef YWakeUpScheduleProxy < YoctoProxyAPI.YFunctionProxy
    % YWakeUpScheduleProxy: wake up schedule control interface, available for instance in the
    % YoctoHub-GSM-4G, the YoctoHub-Wireless-SR, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
    % 
    % The YWakeUpScheduleProxy class implements a wake up condition. The wake up time is specified as a
    % set of months and/or days and/or hours and/or minutes when the wake up should happen.

    properties (Transient, Nontunable)
        % MinutesA Minutes in the 00-29 interval of each hour scheduled for wake up
        MinutesA (1,1) int32
        % MinutesB Minutes in the 30-59 interval of each hour scheduled for wake up
        MinutesB (1,1) int32
        % Hours Hours scheduled for wake up
        Hours (1,1) int32
        % WeekDays Days of the week scheduled for wake up
        WeekDays (1,1) int32
        % MonthDays Days of the month scheduled for wake up
        MonthDays (1,1) int32
        % Months Months scheduled for wake up
        Months (1,1) int32
        % SecondsBefore Number of seconds to anticipate wake-up time to allow
        SecondsBefore (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % NextOccurence Date/time (seconds) of the next wake up occurrence
        NextOccurence (1,1) int64
    end

    properties (Constant)
    end
    % //--- (end of YWakeUpSchedule declaration)

    % //--- (YWakeUpSchedule implementation)
    methods (Hidden)
        function obj = YWakeUpScheduleProxy()
            % YWakeUpScheduleProxy For internal use as System Object.
            % Use FindWakeUpSchedule() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1370082080;
        end
    end

    methods (Static)
        function obj = FindWakeUpSchedule(func)
            % FindWakeUpSchedule Retrieve instances of YWakeUpScheduleProxy
            obj = YoctoProxyAPI.YWakeUpScheduleProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindWakeUpSchedule to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1370082080);
        end
    end
    % //--- (end of YWakeUpSchedule implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YWakeUpScheduleProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'WakeUpSchedule');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'WakeUpSchedule', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'WakeUpSchedule settings', ...
                'PropertyList', {'MinutesA','MinutesB','Hours','WeekDays','MonthDays','Months','SecondsBefore','NextOccurence'});
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
        % //--- (YWakeUpSchedule accessors declaration)

        function result = get_minutesA(obj)
            % Returns the minutes in the 00-29 interval of each hour scheduled for wake up.
            %
            % @return an integer corresponding to the minutes in the 00-29 interval of each hour
            % scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.MINUTESA_INVALID.
            result = obj.InvokeMethod_D(-843790259);
        end

        function set_minutesA(obj, newVal)
            % Changes the minutes in the 00-29 interval when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the minutes in the 00-29 interval when a
            % wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1983620110, newVal);
        end

        function result = get.MinutesA(obj)
            result = obj.GetPropInt32(1708156357);
        end

        function set.MinutesA(obj, newVal)
            obj.MinutesA = newVal;
            obj.SetPropInt32(1708156357, newVal);
        end

        function result = get_minutesB(obj)
            % Returns the minutes in the 30-59 interval of each hour scheduled for wake up.
            %
            % @return an integer corresponding to the minutes in the 30-59 interval of each hour
            % scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.MINUTESB_INVALID.
            result = obj.InvokeMethod_D(-806193644);
        end

        function set_minutesB(obj, newVal)
            % Changes the minutes in the 30-59 interval when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the minutes in the 30-59 interval when a
            % wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1954355797, newVal);
        end

        function result = get.MinutesB(obj)
            result = obj.GetPropInt32(-52874113);
        end

        function set.MinutesB(obj, newVal)
            obj.MinutesB = newVal;
            obj.SetPropInt32(-52874113, newVal);
        end

        function result = get_hours(obj)
            % Returns the hours scheduled for wake up.
            %
            % @return an integer corresponding to the hours scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.HOURS_INVALID.
            result = obj.InvokeMethod_D(-1355471762);
        end

        function set_hours(obj, newVal)
            % Changes the hours when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the hours when a wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1972063249, newVal);
        end

        function result = get.Hours(obj)
            result = obj.GetPropInt32(1272681097);
        end

        function set.Hours(obj, newVal)
            obj.Hours = newVal;
            obj.SetPropInt32(1272681097, newVal);
        end

        function result = get_weekDays(obj)
            % Returns the days of the week scheduled for wake up.
            %
            % @return an integer corresponding to the days of the week scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.WEEKDAYS_INVALID.
            result = obj.InvokeMethod_D(-936402614);
        end

        function set_weekDays(obj, newVal)
            % Changes the days of the week when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the days of the week when a wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1939918091, newVal);
        end

        function result = get.WeekDays(obj)
            result = obj.GetPropInt32(1057362437);
        end

        function set.WeekDays(obj, newVal)
            obj.WeekDays = newVal;
            obj.SetPropInt32(1057362437, newVal);
        end

        function result = get_monthDays(obj)
            % Returns the days of the month scheduled for wake up.
            %
            % @return an integer corresponding to the days of the month scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.MONTHDAYS_INVALID.
            result = obj.InvokeMethod_D(-1309158493);
        end

        function set_monthDays(obj, newVal)
            % Changes the days of the month when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the days of the month when a wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1149700423, newVal);
        end

        function result = get.MonthDays(obj)
            result = obj.GetPropInt32(1224051278);
        end

        function set.MonthDays(obj, newVal)
            obj.MonthDays = newVal;
            obj.SetPropInt32(1224051278, newVal);
        end

        function result = get_months(obj)
            % Returns the months scheduled for wake up.
            %
            % @return an integer corresponding to the months scheduled for wake up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.MONTHS_INVALID.
            result = obj.InvokeMethod_D(-1193361821);
        end

        function set_months(obj, newVal)
            % Changes the months when a wake up must take place.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the months when a wake up must take place
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1934735320, newVal);
        end

        function result = get.Months(obj)
            result = obj.GetPropInt32(-179316456);
        end

        function set.Months(obj, newVal)
            obj.Months = newVal;
            obj.SetPropInt32(-179316456, newVal);
        end

        function result = get_secondsBefore(obj)
            % Returns the number of seconds to anticipate wake-up time to allow
            % the system to power-up.
            %
            % @return an integer corresponding to the number of seconds to anticipate wake-up time to allow
            %         the system to power-up
            %
            % On failure, throws an exception or returns YWakeUpSchedule.SECONDSBEFORE_INVALID.
            result = obj.InvokeMethod_D(-119158058);
        end

        function set_secondsBefore(obj, newVal)
            % Changes the number of seconds to anticipate wake-up time to allow
            % the system to power-up.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the number of seconds to anticipate wake-up
            % time to allow
            %         the system to power-up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(966909174, newVal);
        end

        function result = get.SecondsBefore(obj)
            result = obj.GetPropInt32(-1849004517);
        end

        function set.SecondsBefore(obj, newVal)
            obj.SecondsBefore = newVal;
            obj.SetPropInt32(-1849004517, newVal);
        end

        function result = get_nextOccurence(obj)
            % Returns the date/time (seconds) of the next wake up occurrence.
            %
            % @return an integer corresponding to the date/time (seconds) of the next wake up occurrence
            %
            % On failure, throws an exception or returns YWakeUpSchedule.NEXTOCCURENCE_INVALID.
            result = obj.InvokeMethod_Q(1950222634);
        end

        function result = get.NextOccurence(obj)
            result = obj.GetPropInt64(1140328534);
        end

        function result = get_minutes(obj)
            % Returns all the minutes of each hour that are scheduled for wake up.
            result = obj.InvokeMethod_Q(1599978575);
        end

        function result = set_minutes(obj, bitmap)
            % Changes all the minutes where a wake up must take place.
            %
            % @param bitmap : Minutes 00-59 of each hour scheduled for wake up.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dq(1536686841, bitmap);
        end

        % //--- (end of YWakeUpSchedule accessors declaration)
    end
end
