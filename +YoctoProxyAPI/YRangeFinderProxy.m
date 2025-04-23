% YRangeFinderProxy: range finder control interface, available for instance in the Yocto-RangeFinder
% 
% The YRangeFinderProxy class allows you to read and configure Yoctopuce range finders. It inherits
% from <tt>YSensor</tt> class the core functions to read measures, to register callback functions,
% and to access the autonomous datalogger. This class adds the ability to easily perform a one-point
% linear calibration to compensate the effect of a glass or filter placed in front of the sensor.

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


% //--- (YRangeFinder declaration)
classdef YRangeFinderProxy < YoctoProxyAPI.YSensorProxy
    % YRangeFinderProxy: range finder control interface, available for instance in the Yocto-RangeFinder
    % 
    % The YRangeFinderProxy class allows you to read and configure Yoctopuce range finders. It inherits
    % from <tt>YSensor</tt> class the core functions to read measures, to register callback functions,
    % and to access the autonomous datalogger. This class adds the ability to easily perform a one-point
    % linear calibration to compensate the effect of a glass or filter placed in front of the sensor.

    properties (Transient, Nontunable)
        % RangeFinderMode Range finder running mode
        RangeFinderMode (1,1) YoctoProxyAPI.EnumRangeFinderMode
        % TimeFrame Time frame used to measure the distance and estimate the measure
        TimeFrame (1,1) int64
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YRangeFinder declaration)

    % //--- (YRangeFinder implementation)
    methods (Hidden)
        function obj = YRangeFinderProxy()
            % YRangeFinderProxy For internal use as System Object.
            % Use FindRangeFinder() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1644905758;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindRangeFinder(func)
            % FindRangeFinder Retrieve instances of YRangeFinderProxy
            obj = YoctoProxyAPI.YRangeFinderProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindRangeFinder to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1644905758);
        end
    end
    % //--- (end of YRangeFinder implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YRangeFinderProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'RangeFinder');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'RangeFinder', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'RangeFinder settings', ...
                'PropertyList', {'RangeFinderMode','TimeFrame'});
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
        % //--- (YRangeFinder accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the measured range. That unit is a string.
            % String value can be " or mm. Any other value is ignored.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            % WARNING: if a specific calibration is defined for the rangeFinder function, a
            % unit system change will probably break it.
            %
            % @param newval : a string corresponding to the measuring unit for the measured range
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_rangeFinderMode(obj)
            % Returns the range finder running mode. The rangefinder running mode
            % allows you to put priority on precision, speed or maximum range.
            %
            % @return a value among YRangeFinder.RANGEFINDERMODE_DEFAULT,
            % YRangeFinder.RANGEFINDERMODE_LONG_RANGE, YRangeFinder.RANGEFINDERMODE_HIGH_ACCURACY and
            % YRangeFinder.RANGEFINDERMODE_HIGH_SPEED corresponding to the range finder running mode
            %
            % On failure, throws an exception or returns YRangeFinder.RANGEFINDERMODE_INVALID.
            result = YoctoProxyAPI.EnumRangeFinderMode(obj.InvokeMethod_D(157751572));
        end

        function set_rangeFinderMode(obj, newVal)
            % Changes the rangefinder running mode, allowing you to put priority on
            % precision, speed or maximum range.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among YRangeFinder.RANGEFINDERMODE_DEFAULT,
            % YRangeFinder.RANGEFINDERMODE_LONG_RANGE, YRangeFinder.RANGEFINDERMODE_HIGH_ACCURACY and
            % YRangeFinder.RANGEFINDERMODE_HIGH_SPEED corresponding to the rangefinder running mode,
            % allowing you to put priority on
            %         precision, speed or maximum range
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1796485003, newVal);
        end

        function result = get.RangeFinderMode(obj)
            result = YoctoProxyAPI.EnumRangeFinderMode(obj.GetPropInt32(2099892640));
        end

        function set.RangeFinderMode(obj, newVal)
            obj.RangeFinderMode = newVal;
            obj.SetPropInt32(2099892640, newVal);
        end

        function result = get_timeFrame(obj)
            % Returns the time frame used to measure the distance and estimate the measure
            % reliability. The time frame is expressed in milliseconds.
            %
            % @return an integer corresponding to the time frame used to measure the distance and
            % estimate the measure
            %         reliability
            %
            % On failure, throws an exception or returns YRangeFinder.TIMEFRAME_INVALID.
            result = obj.InvokeMethod_Q(123865418);
        end

        function set_timeFrame(obj, newVal)
            % Changes the time frame used to measure the distance and estimate the measure
            % reliability. The time frame is expressed in milliseconds. A larger timeframe
            % improves stability and reliability, at the cost of higher latency, but prevents
            % the detection of events shorter than the time frame.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the time frame used to measure the distance
            % and estimate the measure
            %         reliability
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_q(-233647186, newVal);
        end

        function result = get.TimeFrame(obj)
            result = obj.GetPropInt64(105965660);
        end

        function set.TimeFrame(obj, newVal)
            obj.TimeFrame = newVal;
            obj.SetPropInt64(105965660, newVal);
        end

        function result = get_quality(obj)
            % Returns a measure quality estimate, based on measured dispersion.
            %
            % @return an integer corresponding to a measure quality estimate, based on measured dispersion
            %
            % On failure, throws an exception or returns YRangeFinder.QUALITY_INVALID.
            result = obj.InvokeMethod_D(-55375872);
        end

        function result = get_currentTemperature(obj)
            % Returns the current sensor temperature, as a floating point number.
            %
            % @return a floating point number corresponding to the current sensor temperature, as a
            % floating point number
            %
            % On failure, throws an exception or returns YRangeFinder.CURRENTTEMPERATURE_INVALID.
            result = obj.InvokeMethod_F(2058614777);
        end

        function result = get_hardwareCalibrationTemperature(obj)
            % Returns the temperature at the time when the latest calibration was performed.
            % This function can be used to determine if a new calibration for ambient temperature
            % is required.
            %
            % @return a temperature, as a floating point number.
            %         On failure, throws an exception or return YAPI_INVALID_DOUBLE.
            result = obj.InvokeMethod_F(97189777);
        end

        function result = triggerTemperatureCalibration(obj)
            % Triggers a sensor calibration according to the current ambient temperature. That
            % calibration process needs no physical interaction with the sensor. It is performed
            % automatically at device startup, but it is recommended to start it again when the
            % temperature delta since the latest calibration exceeds 8 degrees Celsius.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1024472675);
        end

        function result = triggerSpadCalibration(obj)
            % Triggers the photon detector hardware calibration.
            % This function is part of the calibration procedure to compensate for the effect
            % of a cover glass. Make sure to read the chapter about hardware calibration for details
            % on the calibration procedure for proper results.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2095163516);
        end

        function result = triggerOffsetCalibration(obj, targetDist)
            % Triggers the hardware offset calibration of the distance sensor.
            % This function is part of the calibration procedure to compensate for the the effect
            % of a cover glass. Make sure to read the chapter about hardware calibration for details
            % on the calibration procedure for proper results.
            %
            % @param targetDist : true distance of the calibration target, in mm or inches, depending
            %         on the unit selected in the device
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(-506750790, targetDist);
        end

        function result = triggerXTalkCalibration(obj, targetDist)
            % Triggers the hardware cross-talk calibration of the distance sensor.
            % This function is part of the calibration procedure to compensate for the effect
            % of a cover glass. Make sure to read the chapter about hardware calibration for details
            % on the calibration procedure for proper results.
            %
            % @param targetDist : true distance of the calibration target, in mm or inches, depending
            %         on the unit selected in the device
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Df(-260843677, targetDist);
        end

        function result = cancelCoverGlassCalibrations(obj)
            % Cancels the effect of previous hardware calibration procedures to compensate
            % for cover glass, and restores factory settings.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1547193273);
        end

        % //--- (end of YRangeFinder accessors declaration)
    end
end
