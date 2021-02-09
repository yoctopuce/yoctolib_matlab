% YCarbonDioxideProxy: CO2 sensor control interface, available for instance in the Yocto-CO2-V2
% 
% The YCarbonDioxideProxy class allows you to read and configure Yoctopuce CO2 sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger. This class adds the ability to perform manual
% calibration if required.

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


% //--- (YCarbonDioxide declaration)
classdef YCarbonDioxideProxy < YoctoProxyAPI.YSensorProxy
    % YCarbonDioxideProxy: CO2 sensor control interface, available for instance in the Yocto-CO2-V2
    % 
    % The YCarbonDioxideProxy class allows you to read and configure Yoctopuce CO2 sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger. This class adds the ability to perform manual
    % calibration if required.

    properties (Transient, Nontunable)
        % AbcPeriod Automatic Baseline Calibration period, in hours
        AbcPeriod (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YCarbonDioxide declaration)

    % //--- (YCarbonDioxide implementation)
    methods (Hidden)
        function obj = YCarbonDioxideProxy()
            % YCarbonDioxideProxy For internal use as System Object.
            % Use FindCarbonDioxide() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -667224881;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindCarbonDioxide(func)
            % FindCarbonDioxide Retrieve instances of YCarbonDioxideProxy
            obj = YoctoProxyAPI.YCarbonDioxideProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindCarbonDioxide to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-667224881);
        end
    end
    % //--- (end of YCarbonDioxide implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YCarbonDioxideProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'CarbonDioxide');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'CarbonDioxide', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'CarbonDioxide settings', ...
                'PropertyList', {'AbcPeriod'});
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
        % //--- (YCarbonDioxide accessors declaration)

        function result = get_abcPeriod(obj)
            % Returns the Automatic Baseline Calibration period, in hours. A negative value
            % means that automatic baseline calibration is disabled.
            %
            % @return an integer corresponding to the Automatic Baseline Calibration period, in hours
            %
            % On failure, throws an exception or returns YCarbonDioxide.ABCPERIOD_INVALID.
            result = obj.InvokeMethod_D(771699240);
        end

        function set_abcPeriod(obj, newVal)
            % Changes Automatic Baseline Calibration period, in hours. If you need
            % to disable automatic baseline calibration (for instance when using the
            % sensor in an environment that is constantly above 400 ppm CO2), set the
            % period to -1. Remember to call the saveToFlash() method of the
            % module if the modification must be kept.
            %
            % @param newval : an integer corresponding to Automatic Baseline Calibration period, in hours
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-661657396, newVal);
        end

        function result = get.AbcPeriod(obj)
            result = obj.GetPropInt32(1957054479);
        end

        function set.AbcPeriod(obj, newVal)
            obj.AbcPeriod = newVal;
            obj.SetPropInt32(1957054479, newVal);
        end

        function result = triggerBaselineCalibration(obj)
            % Triggers a baseline calibration at standard CO2 ambiant level (400ppm).
            % It is normally not necessary to manually calibrate the sensor, because
            % the built-in automatic baseline calibration procedure will automatically
            % fix any long-term drift based on the lowest level of CO2 observed over the
            % automatic calibration period. However, if you disable automatic baseline
            % calibration, you may want to manually trigger a calibration from time to
            % time. Before starting a baseline calibration, make sure to put the sensor
            % in a standard environment (e.g. outside in fresh air) at around 400 ppm.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-324279273);
        end

        function result = triggerZeroCalibration(obj)
            % Triggers a zero calibration of the sensor on carbon dioxide-free air.
            % It is normally not necessary to manually calibrate the sensor, because
            % the built-in automatic baseline calibration procedure will automatically
            % fix any long-term drift based on the lowest level of CO2 observed over the
            % automatic calibration period. However, if you disable automatic baseline
            % calibration, you may want to manually trigger a calibration from time to
            % time. Before starting a zero calibration, you should circulate carbon
            % dioxide-free air within the sensor for a minute or two, using a small pipe
            % connected to the sensor. Please contact support@yoctopuce.com for more details
            % on the zero calibration procedure.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1693580810);
        end

        % //--- (end of YCarbonDioxide accessors declaration)
    end
end
