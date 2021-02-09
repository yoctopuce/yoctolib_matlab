% YLightSensorProxy: light sensor control interface, available for instance in the Yocto-Light-V3,
% the Yocto-Proximity or the Yocto-RangeFinder
% 
% The YLightSensorProxy class allows you to read and configure Yoctopuce light sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger. This class adds the ability to easily perform a
% one-point linear calibration to compensate the effect of a glass or filter placed in front of the
% sensor. For some light sensors with several working modes, this class can select the desired
% working mode.

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


% //--- (YLightSensor declaration)
classdef YLightSensorProxy < YoctoProxyAPI.YSensorProxy
    % YLightSensorProxy: light sensor control interface, available for instance in the Yocto-Light-V3,
    % the Yocto-Proximity or the Yocto-RangeFinder
    % 
    % The YLightSensorProxy class allows you to read and configure Yoctopuce light sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger. This class adds the ability to easily perform a
    % one-point linear calibration to compensate the effect of a glass or filter placed in front of the
    % sensor. For some light sensors with several working modes, this class can select the desired
    % working mode.

    properties (Transient, Nontunable)
        % MeasureType Type of light measure
        MeasureType (1,1) YoctoProxyAPI.EnumMeasureType
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YLightSensor declaration)

    % //--- (YLightSensor implementation)
    methods (Hidden)
        function obj = YLightSensorProxy()
            % YLightSensorProxy For internal use as System Object.
            % Use FindLightSensor() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1276902144;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindLightSensor(func)
            % FindLightSensor Retrieve instances of YLightSensorProxy
            obj = YoctoProxyAPI.YLightSensorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindLightSensor to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1276902144);
        end
    end
    % //--- (end of YLightSensor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YLightSensorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'LightSensor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'LightSensor', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'LightSensor settings', ...
                'PropertyList', {'MeasureType'});
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
        % //--- (YLightSensor accessors declaration)

        function calibrate(obj, calibratedVal)
            % Changes the sensor-specific calibration parameter so that the current value
            % matches a desired target (linear scaling).
            %
            % @param calibratedVal : the desired target value.
            %
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(608564150, calibratedVal);
        end

        function result = get_measureType(obj)
            % Returns the type of light measure.
            %
            % @return a value among YLightSensor.MEASURETYPE_HUMAN_EYE,
            % YLightSensor.MEASURETYPE_WIDE_SPECTRUM, YLightSensor.MEASURETYPE_INFRARED,
            % YLightSensor.MEASURETYPE_HIGH_RATE, YLightSensor.MEASURETYPE_HIGH_ENERGY and
            % YLightSensor.MEASURETYPE_HIGH_RESOLUTION corresponding to the type of light measure
            %
            % On failure, throws an exception or returns YLightSensor.MEASURETYPE_INVALID.
            result = YoctoProxyAPI.EnumMeasureType(obj.InvokeMethod_D(-694793543));
        end

        function set_measureType(obj, newVal)
            % Changes the light sensor type used in the device. The measure can either
            % approximate the response of the human eye, focus on a specific light
            % spectrum, depending on the capabilities of the light-sensitive cell.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YLightSensor.MEASURETYPE_HUMAN_EYE,
            % YLightSensor.MEASURETYPE_WIDE_SPECTRUM, YLightSensor.MEASURETYPE_INFRARED,
            % YLightSensor.MEASURETYPE_HIGH_RATE, YLightSensor.MEASURETYPE_HIGH_ENERGY and
            % YLightSensor.MEASURETYPE_HIGH_RESOLUTION corresponding to the light sensor type used in the device
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1985882941, newVal);
        end

        function result = get.MeasureType(obj)
            result = YoctoProxyAPI.EnumMeasureType(obj.GetPropInt32(-1936546348));
        end

        function set.MeasureType(obj, newVal)
            obj.MeasureType = newVal;
            obj.SetPropInt32(-1936546348, newVal);
        end

        % //--- (end of YLightSensor accessors declaration)
    end
end
