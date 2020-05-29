% YProximityProxy: proximity sensor control interface, available for instance in the Yocto-Proximity
% 
% The YProximityProxy class allows you to read and configure Yoctopuce proximity sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger. This class adds the ability to setup a
% detection threshold and to count the number of detected state changes.

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


% //--- (YProximity declaration)
classdef YProximityProxy < YoctoProxyAPI.YSensorProxy
    % YProximityProxy: proximity sensor control interface, available for instance in the Yocto-Proximity
    % 
    % The YProximityProxy class allows you to read and configure Yoctopuce proximity sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger. This class adds the ability to setup a
    % detection threshold and to count the number of detected state changes.

    properties (Transient, Nontunable)
        % DetectionThreshold Threshold used to determine the logical state of the proximity sensor, when considered
        DetectionThreshold (1,1) int32
        % DetectionHysteresis Hysteresis used to determine the logical state of the proximity sensor, when considered
        DetectionHysteresis (1,1) int32
        % PresenceMinTime Minimal detection duration before signalling a presence event
        PresenceMinTime (1,1) int32
        % RemovalMinTime Minimal detection duration before signalling a removal event
        RemovalMinTime (1,1) int32
        % ProximityReportMode Parameter (sensor value, presence or pulse count) returned by the get_currentValue function and callbacks
        ProximityReportMode (1,1) YoctoProxyAPI.EnumProximityReportMode
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YProximity declaration)

    % //--- (YProximity implementation)
    methods (Hidden)
        function obj = YProximityProxy()
            % YProximityProxy For internal use as System Object.
            % Use FindProximity() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1740386382;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindProximity(func)
            % FindProximity Retrieve instances of YProximityProxy
            obj = YoctoProxyAPI.YProximityProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindProximity to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1740386382);
        end
    end
    % //--- (end of YProximity implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YProximityProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Proximity');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Proximity', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Proximity settings', ...
                'PropertyList', {'DetectionThreshold','DetectionHysteresis','PresenceMinTime','RemovalMinTime','ProximityReportMode'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropDouble(1444001205);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'double';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'CurrentValue';
        end
    end

    methods
        % //--- (YProximity accessors declaration)

        function result = get_signalValue(obj)
            % Returns the current value of signal measured by the proximity sensor.
            %
            % @return a floating point number corresponding to the current value of signal measured
            % by the proximity sensor
            %
            % On failure, throws an exception or returns Y_SIGNALVALUE_INVALID.
            result = obj.InvokeMethod_F(-2090205936);
        end

        function result = get_detectionThreshold(obj)
            % Returns the threshold used to determine the logical state of the proximity sensor, when considered
            % as a binary input (on/off).
            %
            % @return an integer corresponding to the threshold used to determine the logical state
            % of the proximity sensor, when considered
            %         as a binary input (on/off)
            %
            % On failure, throws an exception or returns Y_DETECTIONTHRESHOLD_INVALID.
            result = obj.InvokeMethod_D(-1458419129);
        end

        function set_detectionThreshold(obj, newVal)
            % Changes the threshold used to determine the logical state of the proximity sensor, when considered
            % as a binary input (on/off).
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the threshold used to determine the logical
            % state of the proximity sensor, when considered
            %         as a binary input (on/off)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2079224851, newVal);
        end

        function result = get.DetectionThreshold(obj)
            result = obj.GetPropInt32(-1760438400);
        end

        function set.DetectionThreshold(obj, newVal)
            obj.DetectionThreshold = newVal;
            obj.SetPropInt32(-1760438400, newVal);
        end

        function result = get_detectionHysteresis(obj)
            % Returns the hysteresis used to determine the logical state of the proximity sensor, when considered
            % as a binary input (on/off).
            %
            % @return an integer corresponding to the hysteresis used to determine the logical state
            % of the proximity sensor, when considered
            %         as a binary input (on/off)
            %
            % On failure, throws an exception or returns Y_DETECTIONHYSTERESIS_INVALID.
            result = obj.InvokeMethod_D(703291101);
        end

        function set_detectionHysteresis(obj, newVal)
            % Changes the hysteresis used to determine the logical state of the proximity sensor, when considered
            % as a binary input (on/off).
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the hysteresis used to determine the
            % logical state of the proximity sensor, when considered
            %         as a binary input (on/off)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1322314880, newVal);
        end

        function result = get.DetectionHysteresis(obj)
            result = obj.GetPropInt32(1337846157);
        end

        function set.DetectionHysteresis(obj, newVal)
            obj.DetectionHysteresis = newVal;
            obj.SetPropInt32(1337846157, newVal);
        end

        function result = get_presenceMinTime(obj)
            % Returns the minimal detection duration before signalling a presence event. Any shorter detection is
            % considered as noise or bounce (false positive) and filtered out.
            %
            % @return an integer corresponding to the minimal detection duration before signalling a
            % presence event
            %
            % On failure, throws an exception or returns Y_PRESENCEMINTIME_INVALID.
            result = obj.InvokeMethod_D(-1203886537);
        end

        function set_presenceMinTime(obj, newVal)
            % Changes the minimal detection duration before signalling a presence event. Any shorter detection is
            % considered as noise or bounce (false positive) and filtered out.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the minimal detection duration before
            % signalling a presence event
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-632483672, newVal);
        end

        function result = get.PresenceMinTime(obj)
            result = obj.GetPropInt32(-1009984493);
        end

        function set.PresenceMinTime(obj, newVal)
            obj.PresenceMinTime = newVal;
            obj.SetPropInt32(-1009984493, newVal);
        end

        function result = get_removalMinTime(obj)
            % Returns the minimal detection duration before signalling a removal event. Any shorter detection is
            % considered as noise or bounce (false positive) and filtered out.
            %
            % @return an integer corresponding to the minimal detection duration before signalling a removal event
            %
            % On failure, throws an exception or returns Y_REMOVALMINTIME_INVALID.
            result = obj.InvokeMethod_D(-2082171092);
        end

        function set_removalMinTime(obj, newVal)
            % Changes the minimal detection duration before signalling a removal event. Any shorter detection is
            % considered as noise or bounce (false positive) and filtered out.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the minimal detection duration before
            % signalling a removal event
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(379713432, newVal);
        end

        function result = get.RemovalMinTime(obj)
            result = obj.GetPropInt32(-2078298610);
        end

        function set.RemovalMinTime(obj, newVal)
            obj.RemovalMinTime = newVal;
            obj.SetPropInt32(-2078298610, newVal);
        end

        function result = get_isPresent(obj)
            % Returns true if the input (considered as binary) is active (detection value is smaller
            % than the specified threshold), and false otherwise.
            %
            % @return either Y_ISPRESENT_FALSE or Y_ISPRESENT_TRUE, according to true if the input
            % (considered as binary) is active (detection value is smaller than the specified
            % threshold), and false otherwise
            %
            % On failure, throws an exception or returns Y_ISPRESENT_INVALID.
            result = YoctoProxyAPI.EnumIsPresent(obj.InvokeMethod_D(1502173750));
        end

        function result = get_lastTimeApproached(obj)
            % Returns the number of elapsed milliseconds between the module power on and the last observed
            % detection (the input contact transitioned from absent to present).
            %
            % @return an integer corresponding to the number of elapsed milliseconds between the
            % module power on and the last observed
            %         detection (the input contact transitioned from absent to present)
            %
            % On failure, throws an exception or returns Y_LASTTIMEAPPROACHED_INVALID.
            result = obj.InvokeMethod_Q(-97771528);
        end

        function result = get_lastTimeRemoved(obj)
            % Returns the number of elapsed milliseconds between the module power on and the last observed
            % detection (the input contact transitioned from present to absent).
            %
            % @return an integer corresponding to the number of elapsed milliseconds between the
            % module power on and the last observed
            %         detection (the input contact transitioned from present to absent)
            %
            % On failure, throws an exception or returns Y_LASTTIMEREMOVED_INVALID.
            result = obj.InvokeMethod_Q(978622805);
        end

        function result = get_pulseCounter(obj)
            % Returns the pulse counter value. The value is a 32 bit integer. In case
            % of overflow (>=2^32), the counter will wrap. To reset the counter, just
            % call the resetCounter() method.
            %
            % @return an integer corresponding to the pulse counter value
            %
            % On failure, throws an exception or returns Y_PULSECOUNTER_INVALID.
            result = obj.InvokeMethod_Q(335219165);
        end

        function result = get_pulseTimer(obj)
            % Returns the timer of the pulse counter (ms).
            %
            % @return an integer corresponding to the timer of the pulse counter (ms)
            %
            % On failure, throws an exception or returns Y_PULSETIMER_INVALID.
            result = obj.InvokeMethod_Q(1447258781);
        end

        function result = get_proximityReportMode(obj)
            % Returns the parameter (sensor value, presence or pulse count) returned by the
            % get_currentValue function and callbacks.
            %
            % @return a value among Y_PROXIMITYREPORTMODE_NUMERIC, Y_PROXIMITYREPORTMODE_PRESENCE and
            % Y_PROXIMITYREPORTMODE_PULSECOUNT corresponding to the parameter (sensor value, presence
            % or pulse count) returned by the get_currentValue function and callbacks
            %
            % On failure, throws an exception or returns Y_PROXIMITYREPORTMODE_INVALID.
            result = YoctoProxyAPI.EnumProximityReportMode(obj.InvokeMethod_D(-895025918));
        end

        function set_proximityReportMode(obj, newVal)
            % Changes the  parameter  type (sensor value, presence or pulse count) returned by the
            % get_currentValue function and callbacks.
            % The edge count value is limited to the 6 lowest digits. For values greater than one
            % million, use get_pulseCounter().
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among Y_PROXIMITYREPORTMODE_NUMERIC,
            % Y_PROXIMITYREPORTMODE_PRESENCE and Y_PROXIMITYREPORTMODE_PULSECOUNT corresponding to
            % the  parameter  type (sensor value, presence or pulse count) returned by the
            % get_currentValue function and callbacks
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1382199391, newVal);
        end

        function result = get.ProximityReportMode(obj)
            result = YoctoProxyAPI.EnumProximityReportMode(obj.GetPropInt32(1400758512));
        end

        function set.ProximityReportMode(obj, newVal)
            obj.ProximityReportMode = newVal;
            obj.SetPropInt32(1400758512, newVal);
        end

        function result = resetCounter(obj)
            % Resets the pulse counter value as well as its timer.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1034161823);
        end

        % //--- (end of YProximity accessors declaration)
    end
end
