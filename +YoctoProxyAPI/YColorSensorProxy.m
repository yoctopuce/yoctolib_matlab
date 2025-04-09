% YColorSensorProxy: color sensor control interface
% 
% The YColorSensorProxy class allows you to read and configure Yoctopuce color sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger.

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


% //--- (YColorSensor declaration)
classdef YColorSensorProxy < YoctoProxyAPI.YFunctionProxy
    % YColorSensorProxy: color sensor control interface
    % 
    % The YColorSensorProxy class allows you to read and configure Yoctopuce color sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger.

    properties (Transient, Nontunable)
        % EstimationModel Model for color estimation
        EstimationModel (1,1) YoctoProxyAPI.EnumEstimationModel
        % WorkingMode Active working mode
        WorkingMode (1,1) YoctoProxyAPI.EnumWorkingMode
        % LedCalibration LED current at calibration
        LedCalibration (1,1) int32
        % IntegrationTime Current integration time
        IntegrationTime (1,1) int32
        % Gain Current gain
        Gain (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YColorSensor declaration)

    % //--- (YColorSensor implementation)
    methods (Hidden)
        function obj = YColorSensorProxy()
            % YColorSensorProxy For internal use as System Object.
            % Use FindColorSensor() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -968744065;
        end
    end

    methods (Static)
        function obj = FindColorSensor(func)
            % FindColorSensor Retrieve instances of YColorSensorProxy
            obj = YoctoProxyAPI.YColorSensorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindColorSensor to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-968744065);
        end
    end
    % //--- (end of YColorSensor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YColorSensorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'ColorSensor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'ColorSensor', ...
                'PropertyList', {'EstimationModel','WorkingMode'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'ColorSensor settings', ...
                'PropertyList', {'LedCalibration','IntegrationTime','Gain'});
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
        % //--- (YColorSensor accessors declaration)

        function result = get_estimationModel(obj)
            % Returns the model for color estimation.
            %
            % @return either YColorSensor.ESTIMATIONMODEL_REFLECTION or
            % YColorSensor.ESTIMATIONMODEL_EMISSION, according to the model for color estimation
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATIONMODEL_INVALID.
            result = YoctoProxyAPI.EnumEstimationModel(obj.InvokeMethod_D(218938719));
        end

        function set_estimationModel(obj, newVal)
            % Changes the model for color estimation.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : either YColorSensor.ESTIMATIONMODEL_REFLECTION or
            % YColorSensor.ESTIMATIONMODEL_EMISSION, according to the model for color estimation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1870629824, newVal);
        end

        function result = get.EstimationModel(obj)
            result = YoctoProxyAPI.EnumEstimationModel(obj.GetPropInt32(804222426));
        end

        function set.EstimationModel(obj, newVal)
            obj.EstimationModel = newVal;
            obj.SetPropInt32(804222426, newVal);
        end

        function result = get_workingMode(obj)
            % Returns the active working mode.
            %
            % @return either YColorSensor.WORKINGMODE_AUTO or YColorSensor.WORKINGMODE_EXPERT,
            % according to the active working mode
            %
            % On failure, throws an exception or returns YColorSensor.WORKINGMODE_INVALID.
            result = YoctoProxyAPI.EnumWorkingMode(obj.InvokeMethod_D(1407808611));
        end

        function set_workingMode(obj, newVal)
            % Changes the operating mode.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : either YColorSensor.WORKINGMODE_AUTO or
            % YColorSensor.WORKINGMODE_EXPERT, according to the operating mode
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(215935513, newVal);
        end

        function result = get.WorkingMode(obj)
            result = YoctoProxyAPI.EnumWorkingMode(obj.GetPropInt32(1480886976));
        end

        function set.WorkingMode(obj, newVal)
            obj.WorkingMode = newVal;
            obj.SetPropInt32(1480886976, newVal);
        end

        function result = get_saturation(obj)
            % Returns the current saturation of the sensor.
            % This function updates the sensor's saturation value.
            %
            % @return an integer corresponding to the current saturation of the sensor
            %
            % On failure, throws an exception or returns YColorSensor.SATURATION_INVALID.
            result = obj.InvokeMethod_D(-1457460117);
        end

        function result = get_ledCurrent(obj)
            % Returns the current value of the LED.
            %
            % @return an integer corresponding to the current value of the LED
            %
            % On failure, throws an exception or returns YColorSensor.LEDCURRENT_INVALID.
            result = obj.InvokeMethod_D(-72936127);
        end

        function set_ledCurrent(obj, newVal)
            % Changes the luminosity of the module leds. The parameter is a
            % value between 0 and 254.
            %
            % @param newval : an integer corresponding to the luminosity of the module leds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-220248176, newVal);
        end

        function result = get_ledCalibration(obj)
            % Returns the LED current at calibration.
            %
            % @return an integer corresponding to the LED current at calibration
            %
            % On failure, throws an exception or returns YColorSensor.LEDCALIBRATION_INVALID.
            result = obj.InvokeMethod_D(-1127226659);
        end

        function set_ledCalibration(obj, newVal)
            % Sets the LED current for calibration.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(696943209, newVal);
        end

        function result = get.LedCalibration(obj)
            result = obj.GetPropInt32(-1817793783);
        end

        function set.LedCalibration(obj, newVal)
            obj.LedCalibration = newVal;
            obj.SetPropInt32(-1817793783, newVal);
        end

        function result = get_integrationTime(obj)
            % Returns the current integration time.
            % This method retrieves the integration time value
            % used for data processing and returns it as an integer or an object.
            %
            % @return an integer corresponding to the current integration time
            %
            % On failure, throws an exception or returns YColorSensor.INTEGRATIONTIME_INVALID.
            result = obj.InvokeMethod_D(201947573);
        end

        function set_integrationTime(obj, newVal)
            % Changes the integration time for data processing.
            % This method takes a parameter and assigns it
            % as the new integration time. This affects the duration
            % for which data is integrated before being processed.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the integration time for data processing
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1853509418, newVal);
        end

        function result = get.IntegrationTime(obj)
            result = obj.GetPropInt32(563999031);
        end

        function set.IntegrationTime(obj, newVal)
            obj.IntegrationTime = newVal;
            obj.SetPropInt32(563999031, newVal);
        end

        function result = get_gain(obj)
            % Returns the current gain.
            % This method updates the gain value.
            %
            % @return an integer corresponding to the current gain
            %
            % On failure, throws an exception or returns YColorSensor.GAIN_INVALID.
            result = obj.InvokeMethod_D(-1030468082);
        end

        function set_gain(obj, newVal)
            % Changes the gain for signal processing.
            % This method takes a parameter and assigns it
            % as the new gain. This affects the sensitivity and
            % intensity of the processed signal.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the gain for signal processing
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-675328172, newVal);
        end

        function result = get.Gain(obj)
            result = obj.GetPropInt32(1890026046);
        end

        function set.Gain(obj, newVal)
            obj.Gain = newVal;
            obj.SetPropInt32(1890026046, newVal);
        end

        function result = get_estimatedRGB(obj)
            % Returns the estimated color in RGB format (0xRRGGBB).
            %
            % @return an integer corresponding to the estimated color in RGB format (0xRRGGBB)
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDRGB_INVALID.
            result = obj.InvokeMethod_D(1107969826);
        end

        function result = get_estimatedHSL(obj)
            % Returns the estimated color in HSL (Hue, Saturation, Lightness) format.
            %
            % @return an integer corresponding to the estimated color in HSL (Hue, Saturation, Lightness) format
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDHSL_INVALID.
            result = obj.InvokeMethod_D(-1111546429);
        end

        function result = get_estimatedXYZ(obj)
            % Returns the estimated color in XYZ format.
            %
            % @return a string corresponding to the estimated color in XYZ format
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDXYZ_INVALID.
            result = obj.InvokeMethod_S(697960480);
        end

        function result = get_estimatedOkLab(obj)
            % Returns the estimated color in OkLab format.
            %
            % @return a string corresponding to the estimated color in OkLab format
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDOKLAB_INVALID.
            result = obj.InvokeMethod_S(619819217);
        end

        function result = get_nearRAL1(obj)
            % Returns the estimated color in RAL format.
            %
            % @return a string corresponding to the estimated color in RAL format
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL1_INVALID.
            result = obj.InvokeMethod_S(1190053623);
        end

        function result = get_nearRAL2(obj)
            % Returns the estimated color in RAL format.
            %
            % @return a string corresponding to the estimated color in RAL format
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL2_INVALID.
            result = obj.InvokeMethod_S(1151891630);
        end

        function result = get_nearRAL3(obj)
            % Returns the estimated color in RAL format.
            %
            % @return a string corresponding to the estimated color in RAL format
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL3_INVALID.
            result = obj.InvokeMethod_S(1164579481);
        end

        function result = get_nearHTMLColor(obj)
            % Returns the estimated HTML color .
            %
            % @return a string corresponding to the estimated HTML color
            %
            % On failure, throws an exception or returns YColorSensor.NEARHTMLCOLOR_INVALID.
            result = obj.InvokeMethod_S(-1278596900);
        end

        function result = get_nearSimpleColor(obj)
            % Returns the estimated color .
            %
            % @return a string corresponding to the estimated color
            %
            % On failure, throws an exception or returns YColorSensor.NEARSIMPLECOLOR_INVALID.
            result = obj.InvokeMethod_S(1488118945);
        end

        function result = get_nearSimpleColorIndex(obj)
            % Returns the estimated color as an index.
            %
            % @return a value among YColorSensor.NEARSIMPLECOLORINDEX_BROWN,
            % YColorSensor.NEARSIMPLECOLORINDEX_RED, YColorSensor.NEARSIMPLECOLORINDEX_ORANGE,
            % YColorSensor.NEARSIMPLECOLORINDEX_YELLOW, YColorSensor.NEARSIMPLECOLORINDEX_WHITE,
            % YColorSensor.NEARSIMPLECOLORINDEX_GRAY, YColorSensor.NEARSIMPLECOLORINDEX_BLACK,
            % YColorSensor.NEARSIMPLECOLORINDEX_GREEN, YColorSensor.NEARSIMPLECOLORINDEX_BLUE,
            % YColorSensor.NEARSIMPLECOLORINDEX_PURPLE and YColorSensor.NEARSIMPLECOLORINDEX_PINK
            % corresponding to the estimated color as an index
            %
            % On failure, throws an exception or returns YColorSensor.NEARSIMPLECOLORINDEX_INVALID.
            result = YoctoProxyAPI.EnumNearSimpleColorIndex(obj.InvokeMethod_D(-1408172873));
        end

        function result = turnLedOn(obj)
            % Turns on the LEDs at the current used during calibration.
            % On failure, throws an exception or returns Y_DATA_INVALID.
            result = obj.InvokeMethod_D(1420082593);
        end

        function result = turnLedOff(obj)
            % Turns off the LEDs.
            % On failure, throws an exception or returns Y_DATA_INVALID.
            result = obj.InvokeMethod_D(1158570157);
        end

        % //--- (end of YColorSensor accessors declaration)
    end
end
