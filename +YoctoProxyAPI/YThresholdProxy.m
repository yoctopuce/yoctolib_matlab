% YThresholdProxy: Control interface to define a threshold
% 
% The <tt>Threshold</tt> class allows you define a threshold on a Yoctopuce sensor to trigger a
% predefined action, on specific devices where this is implemented.

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


% //--- (YThreshold declaration)
classdef YThresholdProxy < YoctoProxyAPI.YFunctionProxy
    % YThresholdProxy: Control interface to define a threshold
    % 
    % The <tt>Threshold</tt> class allows you define a threshold on a Yoctopuce sensor to trigger a
    % predefined action, on specific devices where this is implemented.

    properties (Transient, Nontunable)
        % AlertLevel Sensor alert level, triggering the threshold function
        AlertLevel (1,1) double
        % SafeLevel Sensor acceptable level for disabling the threshold function
        SafeLevel (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
        % ThresholdState Current state of the threshold function
        ThresholdState (1,1) YoctoProxyAPI.EnumThresholdState
    end

    properties (Constant)
    end
    % //--- (end of YThreshold declaration)

    % //--- (YThreshold implementation)
    methods (Hidden)
        function obj = YThresholdProxy()
            % YThresholdProxy For internal use as System Object.
            % Use FindThreshold() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1770760245;
        end
    end

    methods (Static)
        function obj = FindThreshold(func)
            % FindThreshold Retrieve instances of YThresholdProxy
            obj = YoctoProxyAPI.YThresholdProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindThreshold to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1770760245);
        end
    end
    % //--- (end of YThreshold implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YThresholdProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Threshold');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Threshold', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Threshold settings', ...
                'PropertyList', {'ThresholdState','AlertLevel','SafeLevel'});
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
        % //--- (YThreshold accessors declaration)

        function result = get_thresholdState(obj)
            % Returns current state of the threshold function.
            %
            % @return either YThreshold.THRESHOLDSTATE_SAFE or YThreshold.THRESHOLDSTATE_ALERT,
            % according to current state of the threshold function
            %
            % On failure, throws an exception or returns YThreshold.THRESHOLDSTATE_INVALID.
            result = YoctoProxyAPI.EnumThresholdState(obj.InvokeMethod_D(-215121489));
        end

        function result = get.ThresholdState(obj)
            result = YoctoProxyAPI.EnumThresholdState(obj.GetPropInt32(-636231828));
        end

        function result = get_targetSensor(obj)
            % Returns the name of the sensor monitored by the threshold function.
            %
            % @return a string corresponding to the name of the sensor monitored by the threshold function
            %
            % On failure, throws an exception or returns YThreshold.TARGETSENSOR_INVALID.
            result = obj.InvokeMethod_S(1234233758);
        end

        function set_alertLevel(obj, newVal)
            % Changes the sensor alert level triggering the threshold function.
            % Remember to call the matching module saveToFlash()
            % method if you want to preserve the setting after reboot.
            %
            % @param newval : a floating point number corresponding to the sensor alert level
            % triggering the threshold function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-404041135, newVal);
        end

        function result = get_alertLevel(obj)
            % Returns the sensor alert level, triggering the threshold function.
            %
            % @return a floating point number corresponding to the sensor alert level, triggering the
            % threshold function
            %
            % On failure, throws an exception or returns YThreshold.ALERTLEVEL_INVALID.
            result = obj.InvokeMethod_F(-292388736);
        end

        function result = get.AlertLevel(obj)
            result = obj.GetPropDouble(-958184872);
        end

        function set.AlertLevel(obj, newVal)
            obj.AlertLevel = newVal;
            obj.SetPropDouble(-958184872, newVal);
        end

        function set_safeLevel(obj, newVal)
            % Changes the sensor acceptable level for disabling the threshold function.
            % Remember to call the matching module saveToFlash()
            % method if you want to preserve the setting after reboot.
            %
            % @param newval : a floating point number corresponding to the sensor acceptable level
            % for disabling the threshold function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1803462748, newVal);
        end

        function result = get_safeLevel(obj)
            % Returns the sensor acceptable level for disabling the threshold function.
            %
            % @return a floating point number corresponding to the sensor acceptable level for
            % disabling the threshold function
            %
            % On failure, throws an exception or returns YThreshold.SAFELEVEL_INVALID.
            result = obj.InvokeMethod_F(-1643220296);
        end

        function result = get.SafeLevel(obj)
            result = obj.GetPropDouble(-1665058300);
        end

        function set.SafeLevel(obj, newVal)
            obj.SafeLevel = newVal;
            obj.SetPropDouble(-1665058300, newVal);
        end

        % //--- (end of YThreshold accessors declaration)
    end
end
