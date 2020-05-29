% YRefFrameProxy: 3D reference frame configuration interface, available for instance in the
% Yocto-3D-V2
% 
% The YRefFrameProxy class is used to setup the base orientation of the Yoctopuce inertial sensors.
% Thanks to this, orientation functions relative to the earth surface plane can use the proper
% reference frame. The class also implements a tridimensional sensor calibration process, which can
% compensate for local variations of standard gravity and improve the precision of the tilt sensors.

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


% //--- (YRefFrame declaration)
classdef YRefFrameProxy < YoctoProxyAPI.YFunctionProxy
    % YRefFrameProxy: 3D reference frame configuration interface, available for instance in the
    % Yocto-3D-V2
    % 
    % The YRefFrameProxy class is used to setup the base orientation of the Yoctopuce inertial sensors.
    % Thanks to this, orientation functions relative to the earth surface plane can use the proper
    % reference frame. The class also implements a tridimensional sensor calibration process, which can
    % compensate for local variations of standard gravity and improve the precision of the tilt sensors.

    properties (Transient, Nontunable)
        % Bearing Reference bearing used by the compass
        Bearing (1,1) double
        % FusionMode BNO055 fusion mode
        FusionMode (1,1) YoctoProxyAPI.EnumFusionMode
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YRefFrame declaration)

    % //--- (YRefFrame implementation)
    methods (Hidden)
        function obj = YRefFrameProxy()
            % YRefFrameProxy For internal use as System Object.
            % Use FindRefFrame() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -954646525;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindRefFrame(func)
            % FindRefFrame Retrieve instances of YRefFrameProxy
            obj = YoctoProxyAPI.YRefFrameProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindRefFrame to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-954646525);
        end
    end
    % //--- (end of YRefFrame implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YRefFrameProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'RefFrame');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'RefFrame', ...
                'PropertyList', {'Bearing'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'RefFrame settings', ...
                'PropertyList', {'FusionMode'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropDouble(470503760, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'Bearing';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YRefFrame accessors declaration)

        function set_bearing(obj, newVal)
            % Changes the reference bearing used by the compass. The relative bearing
            % indicated by the compass is the difference between the measured magnetic
            % heading and the reference bearing indicated here.
            %
            % For instance, if you setup as reference bearing the value of the earth
            % magnetic declination, the compass will provide the orientation relative
            % to the geographic North.
            %
            % Similarly, when the sensor is not mounted along the standard directions
            % because it has an additional yaw angle, you can set this angle in the reference
            % bearing so that the compass provides the expected natural direction.
            %
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the reference bearing used by the compass
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1537503139, newVal);
        end

        function result = get_bearing(obj)
            % Returns the reference bearing used by the compass. The relative bearing
            % indicated by the compass is the difference between the measured magnetic
            % heading and the reference bearing indicated here.
            %
            % @return a floating point number corresponding to the reference bearing used by the compass
            %
            % On failure, throws an exception or returns Y_BEARING_INVALID.
            result = obj.InvokeMethod_F(-343180071);
        end

        function result = get.Bearing(obj)
            result = obj.GetPropDouble(470503760);
        end

        function set.Bearing(obj, newVal)
            obj.Bearing = newVal;
            obj.SetPropDouble(470503760, newVal);
        end

        function result = get_fusionMode(obj)
            % Returns the BNO055 fusion mode. Note this feature is only availabe on Yocto-3D-V2.
            %
            % @return a value among Y_FUSIONMODE_NDOF, Y_FUSIONMODE_NDOF_FMC_OFF, Y_FUSIONMODE_M4G,
            % Y_FUSIONMODE_COMPASS and Y_FUSIONMODE_IMU corresponding to the BNO055 fusion mode
            %
            % On failure, throws an exception or returns Y_FUSIONMODE_INVALID.
            result = YoctoProxyAPI.EnumFusionMode(obj.InvokeMethod_D(-317983516));
        end

        function set_fusionMode(obj, newVal)
            % Change the BNO055 fusion mode. Note: this feature is only availabe on Yocto-3D-V2.
            % Remember to call the matching module saveToFlash() method to save the setting permanently.
            %
            % @param newval : a value among Y_FUSIONMODE_NDOF, Y_FUSIONMODE_NDOF_FMC_OFF,
            % Y_FUSIONMODE_M4G, Y_FUSIONMODE_COMPASS and Y_FUSIONMODE_IMU
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-462182859, newVal);
        end

        function result = get.FusionMode(obj)
            result = YoctoProxyAPI.EnumFusionMode(obj.GetPropInt32(1073169764));
        end

        function set.FusionMode(obj, newVal)
            obj.FusionMode = newVal;
            obj.SetPropInt32(1073169764, newVal);
        end

        function result = get_mountPosition(obj)
            % Returns the installation position of the device, as configured
            % in order to define the reference frame for the compass and the
            % pitch/roll tilt sensors.
            %
            % @return a value among the Y_MOUNTPOSITION enumeration
            %         (Y_MOUNTPOSITION_BOTTOM,   Y_MOUNTPOSITION_TOP,
            %         Y_MOUNTPOSITION_FRONT,    Y_MOUNTPOSITION_RIGHT,
            %         Y_MOUNTPOSITION_REAR,     Y_MOUNTPOSITION_LEFT),
            %         corresponding to the installation in a box, on one of the six faces.
            %
            % On failure, throws an exception or returns Y_MOUNTPOSITION_INVALID.
            result = obj.InvokeMethod_D(-1970363789);
        end

        function result = get_mountOrientation(obj)
            % Returns the installation orientation of the device, as configured
            % in order to define the reference frame for the compass and the
            % pitch/roll tilt sensors.
            %
            % @return a value among the enumeration Y_MOUNTORIENTATION
            %         (Y_MOUNTORIENTATION_TWELVE, Y_MOUNTORIENTATION_THREE,
            %         Y_MOUNTORIENTATION_SIX,     Y_MOUNTORIENTATION_NINE)
            %         corresponding to the orientation of the "X" arrow on the device,
            %         as on a clock dial seen from an observer in the center of the box.
            %         On the bottom face, the 12H orientation points to the front, while
            %         on the top face, the 12H orientation points to the rear.
            %
            % On failure, throws an exception or returns Y_MOUNTORIENTATION_INVALID.
            result = obj.InvokeMethod_D(331967861);
        end

        function result = set_mountPosition(obj, (YoctoLib::Y_MOUNTPOSITION)(position-1), (YoctoLib::Y_MOUNTORIENTATION)(orientation-1))
            % Changes the compass and tilt sensor frame of reference. The magnetic compass
            % and the tilt sensors (pitch and roll) naturally work in the plane
            % parallel to the earth surface. In case the device is not installed upright
            % and horizontally, you must select its reference orientation (parallel to
            % the earth surface) so that the measures are made relative to this position.
            %
            % @param position : a value among the Y_MOUNTPOSITION enumeration
            %         (Y_MOUNTPOSITION_BOTTOM,   Y_MOUNTPOSITION_TOP,
            %         Y_MOUNTPOSITION_FRONT,    Y_MOUNTPOSITION_RIGHT,
            %         Y_MOUNTPOSITION_REAR,     Y_MOUNTPOSITION_LEFT),
            %         corresponding to the installation in a box, on one of the six faces.
            % @param orientation : a value among the enumeration Y_MOUNTORIENTATION
            %         (Y_MOUNTORIENTATION_TWELVE, Y_MOUNTORIENTATION_THREE,
            %         Y_MOUNTORIENTATION_SIX,     Y_MOUNTORIENTATION_NINE)
            %         corresponding to the orientation of the "X" arrow on the device,
            %         as on a clock dial seen from an observer in the center of the box.
            %         On the bottom face, the 12H orientation points to the front, while
            %         on the top face, the 12H orientation points to the rear.
            %
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1866493237, (YoctoLib::Y_MOUNTPOSITION)(position-1), (YoctoLib::Y_MOUNTORIENTATION)(orientation-1));
        end

        function result = get_calibrationState(obj)
            % Returns the 3D sensor calibration state (Yocto-3D-V2 only). This function returns
            % an integer representing the calibration state of the 3 inertial sensors of
            % the BNO055 chip, found in the Yocto-3D-V2. Hundredths show the calibration state
            % of the accelerometer, tenths show the calibration state of the magnetometer while
            % units show the calibration state of the gyroscope. For each sensor, the value 0
            % means no calibration and the value 3 means full calibration.
            %
            % @return an integer representing the calibration state of Yocto-3D-V2:
            %         333 when fully calibrated, 0 when not calibrated at all.
            %
            % On failure, throws an exception or returns a negative error code.
            % For the Yocto-3D (V1), this function always return -3 (unsupported function).
            result = obj.InvokeMethod_D(1336012176);
        end

        function result = get_measureQuality(obj)
            % Returns estimated quality of the orientation (Yocto-3D-V2 only). This function returns
            % an integer between 0 and 3 representing the degree of confidence of the position
            % estimate. When the value is 3, the estimation is reliable. Below 3, one should
            % expect sudden corrections, in particular for heading (compass function).
            % The most frequent causes for values below 3 are magnetic interferences, and
            % accelerations or rotations beyond the sensor range.
            %
            % @return an integer between 0 and 3 (3 when the measure is reliable)
            %
            % On failure, throws an exception or returns a negative error code.
            % For the Yocto-3D (V1), this function always return -3 (unsupported function).
            result = obj.InvokeMethod_D(340932957);
        end

        function result = start3DCalibration(obj)
            % Initiates the sensors tridimensional calibration process.
            % This calibration is used at low level for inertial position estimation
            % and to enhance the precision of the tilt sensors.
            %
            % After calling this method, the device should be moved according to the
            % instructions provided by method get_3DCalibrationHint,
            % and more3DCalibration should be invoked about 5 times per second.
            % The calibration procedure is completed when the method
            % get_3DCalibrationProgress returns 100. At this point,
            % the computed calibration parameters can be applied using method
            % save3DCalibration. The calibration process can be cancelled
            % at any time using method cancel3DCalibration.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-734831571);
        end

        function result = more3DCalibration(obj)
            % Continues the sensors tridimensional calibration process previously
            % initiated using method start3DCalibration.
            % This method should be called approximately 5 times per second, while
            % positioning the device according to the instructions provided by method
            % get_3DCalibrationHint. Note that the instructions change during
            % the calibration process.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-35257492);
        end

        function result = get_3DCalibrationHint(obj)
            % Returns instructions to proceed to the tridimensional calibration initiated with
            % method start3DCalibration.
            %
            % @return a character string.
            result = obj.InvokeMethod_S(-667547053);
        end

        function result = get_3DCalibrationProgress(obj)
            % Returns the global process indicator for the tridimensional calibration
            % initiated with method start3DCalibration.
            %
            % @return an integer between 0 (not started) and 100 (stage completed).
            result = obj.InvokeMethod_D(-2097943345);
        end

        function result = get_3DCalibrationStage(obj)
            % Returns index of the current stage of the calibration
            % initiated with method start3DCalibration.
            %
            % @return an integer, growing each time a calibration stage is completed.
            result = obj.InvokeMethod_D(-835861029);
        end

        function result = get_3DCalibrationStageProgress(obj)
            % Returns the process indicator for the current stage of the calibration
            % initiated with method start3DCalibration.
            %
            % @return an integer between 0 (not started) and 100 (stage completed).
            result = obj.InvokeMethod_D(-771084694);
        end

        function result = get_3DCalibrationLogMsg(obj)
            % Returns the latest log message from the calibration process.
            % When no new message is available, returns an empty string.
            %
            % @return a character string.
            result = obj.InvokeMethod_S(1526301088);
        end

        function result = save3DCalibration(obj)
            % Applies the sensors tridimensional calibration parameters that have just been computed.
            % Remember to call the saveToFlash()  method of the module if the changes
            % must be kept when the device is restarted.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(284957622);
        end

        function result = cancel3DCalibration(obj)
            % Aborts the sensors tridimensional calibration process et restores normal settings.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1638480466);
        end

        % //--- (end of YRefFrame accessors declaration)
    end
end
