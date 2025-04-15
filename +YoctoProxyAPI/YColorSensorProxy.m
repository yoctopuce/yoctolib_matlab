% YColorSensorProxy: color sensor control interface
% 
% The YColorSensorProxy class allows you to read and configure Yoctopuce color sensors.

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
    % The YColorSensorProxy class allows you to read and configure Yoctopuce color sensors.

    properties (Transient, Nontunable)
        % EstimationModel Predictive model used for color estimation (reflective or emissive)
        EstimationModel (1,1) YoctoProxyAPI.EnumEstimationModel
        % WorkingMode Sensor working mode
        WorkingMode (1,1) YoctoProxyAPI.EnumWorkingMode
        % LedCalibration Current sent to the illumination LEDs during the last calibration
        LedCalibration (1,1) int32
        % IntegrationTime Current integration time for spectral measurement, in milliseconds
        IntegrationTime (1,1) int32
        % Gain Current spectral channel detector gain exponent
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
            % Returns the predictive model used for color estimation (reflective or emissive).
            %
            % @return either YColorSensor.ESTIMATIONMODEL_REFLECTION or
            % YColorSensor.ESTIMATIONMODEL_EMISSION, according to the predictive model used for color
            % estimation (reflective or emissive)
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATIONMODEL_INVALID.
            result = YoctoProxyAPI.EnumEstimationModel(obj.InvokeMethod_D(218938719));
        end

        function set_estimationModel(obj, newVal)
            % Changes the mpredictive model to be used for color estimation (reflective or emissive).
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : either YColorSensor.ESTIMATIONMODEL_REFLECTION or
            % YColorSensor.ESTIMATIONMODEL_EMISSION, according to the mpredictive model to be used
            % for color estimation (reflective or emissive)
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
            % Returns the sensor working mode.
            % In Auto mode, sensor parameters are automatically set based on the selected estimation model.
            % In Expert mode, sensor parameters such as gain and integration time are configured manually.
            %
            % @return either YColorSensor.WORKINGMODE_AUTO or YColorSensor.WORKINGMODE_EXPERT,
            % according to the sensor working mode
            %
            % On failure, throws an exception or returns YColorSensor.WORKINGMODE_INVALID.
            result = YoctoProxyAPI.EnumWorkingMode(obj.InvokeMethod_D(1407808611));
        end

        function set_workingMode(obj, newVal)
            % Changes the sensor working mode.
            % In Auto mode, sensor parameters are automatically set based on the selected estimation model.
            % In Expert mode, sensor parameters such as gain and integration time are configured manually.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : either YColorSensor.WORKINGMODE_AUTO or
            % YColorSensor.WORKINGMODE_EXPERT, according to the sensor working mode
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

        function result = get_ledCurrent(obj)
            % Returns the amount of current sent to the illumination LEDs, for reflection measurements.
            % The value is an integer ranging from 0 (LEDs off) to 254 (LEDs at maximum intensity).
            %
            % @return an integer corresponding to the amount of current sent to the illumination
            % LEDs, for reflection measurements
            %
            % On failure, throws an exception or returns YColorSensor.LEDCURRENT_INVALID.
            result = obj.InvokeMethod_D(-72936127);
        end

        function set_ledCurrent(obj, newVal)
            % Changes the amount of current sent to the illumination LEDs, for reflection measurements.
            % The value is an integer ranging from 0 (LEDs off) to 254 (LEDs at maximum intensity).
            %
            % @param newval : an integer corresponding to the amount of current sent to the
            % illumination LEDs, for reflection measurements
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-220248176, newVal);
        end

        function result = get_ledCalibration(obj)
            % Returns the current sent to the illumination LEDs during the last calibration.
            %
            % @return an integer corresponding to the current sent to the illumination LEDs during
            % the last calibration
            %
            % On failure, throws an exception or returns YColorSensor.LEDCALIBRATION_INVALID.
            result = obj.InvokeMethod_D(-1127226659);
        end

        function set_ledCalibration(obj, newVal)
            % Remember the LED current sent to the illumination LEDs during a calibration.
            % Thanks to this, the device will be able to use the same current during measurements.
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
            % Returns the current integration time for spectral measurement, in milliseconds.
            % A longer integration time increase the sensitivity for low light conditions,
            % but reduces the measurement rate and may lead to saturation for lighter colors.
            %
            % @return an integer corresponding to the current integration time for spectral
            % measurement, in milliseconds
            %
            % On failure, throws an exception or returns YColorSensor.INTEGRATIONTIME_INVALID.
            result = obj.InvokeMethod_D(201947573);
        end

        function set_integrationTime(obj, newVal)
            % Changes the integration time for spectral measurement, in milliseconds.
            % A longer integration time increase the sensitivity for low light conditions,
            % but reduces the measurement rate and may lead to saturation for lighter colors.
            % This method can only be used when the sensor is configured in expert mode;
            % when running in auto mode, the change will be ignored.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the integration time for spectral
            % measurement, in milliseconds
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
            % Returns the current spectral channel detector gain exponent.
            % For a value n ranging from 0 to 12, the applied gain is 2^(n-1).
            % 0 corresponds to a gain of 0.5, and 12 corresponds to a gain of 2048.
            %
            % @return an integer corresponding to the current spectral channel detector gain exponent
            %
            % On failure, throws an exception or returns YColorSensor.GAIN_INVALID.
            result = obj.InvokeMethod_D(-1030468082);
        end

        function set_gain(obj, newVal)
            % Changes the spectral channel detector gain exponent.
            % For a value n ranging from 0 to 12, the applied gain is 2^(n-1).
            % 0 corresponds to a gain of 0.5, and 12 corresponds to a gain of 2048.
            % This method can only be used when the sensor is configured in expert mode;
            % when running in auto mode, the change will be ignored.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the spectral channel detector gain exponent
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

        function result = get_saturation(obj)
            % Returns the current saturation state of the sensor, as an integer.
            % Bit 0 indicates saturation of the analog sensor, which can only
            % be corrected by reducing the gain parameters or the luminosity.
            % Bit 1 indicates saturation of the digital interface, which can
            % be corrected by reducing the integration time or the gain.
            %
            % @return an integer corresponding to the current saturation state of the sensor, as an integer
            %
            % On failure, throws an exception or returns YColorSensor.SATURATION_INVALID.
            result = obj.InvokeMethod_D(-1457460117);
        end

        function result = get_estimatedRGB(obj)
            % Returns the estimated color in RGB color model (0xRRGGBB).
            % The RGB color model describes each color using a combination of 3 components:
            % - Red (R): the intensity of red, in thee range 0...255
            % - Green (G): the intensity of green, in thee range 0...255
            % - Blue (B): the intensity of blue, in thee range 0...255
            %
            % @return an integer corresponding to the estimated color in RGB color model (0xRRGGBB)
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDRGB_INVALID.
            result = obj.InvokeMethod_D(1107969826);
        end

        function result = get_estimatedHSL(obj)
            % Returns the estimated color in HSL color model (0xHHSSLL).
            % The HSL color model describes each color using a combination of 3 components:
            % - Hue (H): the angle on the color wheel (0-360 degrees), mapped to 0...255
            % - Saturation (S): the intensity of the color (0-100%), mapped to 0...255
            % - Lightness (L): the brightness of the color (0-100%), mapped to 0...255
            %
            % @return an integer corresponding to the estimated color in HSL color model (0xHHSSLL)
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDHSL_INVALID.
            result = obj.InvokeMethod_D(-1111546429);
        end

        function result = get_estimatedXYZ(obj)
            % Returns the estimated color according to the CIE XYZ color model.
            % This color model is based on human vision and light perception, with three components
            % represented by real numbers between 0 and 1:
            % - X: corresponds to a component mixing sensitivity to red and green
            % - Y: represents luminance (perceived brightness)
            % - Z: corresponds to sensitivity to blue
            %
            % @return a string corresponding to the estimated color according to the CIE XYZ color model
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDXYZ_INVALID.
            result = obj.InvokeMethod_S(697960480);
        end

        function result = get_estimatedOkLab(obj)
            % Returns the estimated color according to the OkLab color model.
            % OkLab is a perceptual color model that aims to align human color perception with numerical
            % values, so that visually near colors are also numerically near. Colors are represented
            % using three components:
            % - L: lightness, a real number between 0 and 1-
            % - a: color variations between green and red, between -0.5 and 0.5-
            % - b: color variations between blue and yellow, between -0.5 and 0.5.
            %
            % @return a string corresponding to the estimated color according to the OkLab color model
            %
            % On failure, throws an exception or returns YColorSensor.ESTIMATEDOKLAB_INVALID.
            result = obj.InvokeMethod_S(619819217);
        end

        function result = get_nearRAL1(obj)
            % Returns the RAL Classic color closest to the estimated color, with a similarity ratio.
            %
            % @return a string corresponding to the RAL Classic color closest to the estimated color,
            % with a similarity ratio
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL1_INVALID.
            result = obj.InvokeMethod_S(1190053623);
        end

        function result = get_nearRAL2(obj)
            % Returns the second closest RAL Classic color to the estimated color, with a similarity ratio.
            %
            % @return a string corresponding to the second closest RAL Classic color to the estimated
            % color, with a similarity ratio
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL2_INVALID.
            result = obj.InvokeMethod_S(1151891630);
        end

        function result = get_nearRAL3(obj)
            % Returns the third closest RAL Classic color to the estimated color, with a similarity ratio.
            %
            % @return a string corresponding to the third closest RAL Classic color to the estimated
            % color, with a similarity ratio
            %
            % On failure, throws an exception or returns YColorSensor.NEARRAL3_INVALID.
            result = obj.InvokeMethod_S(1164579481);
        end

        function result = get_nearHTMLColor(obj)
            % Returns the name of the HTML color closest to the estimated color.
            %
            % @return a string corresponding to the name of the HTML color closest to the estimated color
            %
            % On failure, throws an exception or returns YColorSensor.NEARHTMLCOLOR_INVALID.
            result = obj.InvokeMethod_S(-1278596900);
        end

        function result = get_nearSimpleColorIndex(obj)
            % Returns the index of the basic color typically used to refer to the estimated color
            % (enumerated value).
            % The list of basic colors recognized is:
            % - 0 - Brown
            % - 1 - Red
            % - 2 - Orange
            % - 3 - Yellow
            % - 4 - White
            % - 5 - Gray
            % - 6 - Black
            % - 7 - Green
            % - 8 - Blue
            % - 9 - Purple
            % - 10 - Pink
            %
            % @return a value among YColorSensor.NEARSIMPLECOLORINDEX_BROWN,
            % YColorSensor.NEARSIMPLECOLORINDEX_RED, YColorSensor.NEARSIMPLECOLORINDEX_ORANGE,
            % YColorSensor.NEARSIMPLECOLORINDEX_YELLOW, YColorSensor.NEARSIMPLECOLORINDEX_WHITE,
            % YColorSensor.NEARSIMPLECOLORINDEX_GRAY, YColorSensor.NEARSIMPLECOLORINDEX_BLACK,
            % YColorSensor.NEARSIMPLECOLORINDEX_GREEN, YColorSensor.NEARSIMPLECOLORINDEX_BLUE,
            % YColorSensor.NEARSIMPLECOLORINDEX_PURPLE and YColorSensor.NEARSIMPLECOLORINDEX_PINK
            % corresponding to the index of the basic color typically used to refer to the estimated
            % color (enumerated value)
            %
            % On failure, throws an exception or returns YColorSensor.NEARSIMPLECOLORINDEX_INVALID.
            result = YoctoProxyAPI.EnumNearSimpleColorIndex(obj.InvokeMethod_D(-1408172873));
        end

        function result = get_nearSimpleColor(obj)
            % Returns the name of the basic color typically used to refer to the estimated color.
            %
            % @return a string corresponding to the name of the basic color typically used to refer
            % to the estimated color
            %
            % On failure, throws an exception or returns YColorSensor.NEARSIMPLECOLOR_INVALID.
            result = obj.InvokeMethod_S(1488118945);
        end

        function result = turnLedOn(obj)
            % Turns on the built-in illumination LEDs using the same current as used during last calibration.
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1420082593);
        end

        function result = turnLedOff(obj)
            % Turns off the built-in illumination LEDs.
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1158570157);
        end

        % //--- (end of YColorSensor accessors declaration)
    end
end
