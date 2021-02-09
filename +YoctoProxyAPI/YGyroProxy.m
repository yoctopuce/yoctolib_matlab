% YGyroProxy: gyroscope control interface, available for instance in the Yocto-3D-V2
% 
% The YGyroProxy class allows you to read and configure Yoctopuce gyroscopes. It inherits from
% <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
% to access the autonomous datalogger. This class adds the possibility to access x, y and z
% components of the rotation vector separately, as well as the possibility to deal with
% quaternion-based orientation estimates.

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


% //--- (YGyro declaration)
classdef YGyroProxy < YoctoProxyAPI.YSensorProxy
    % YGyroProxy: gyroscope control interface, available for instance in the Yocto-3D-V2
    % 
    % The YGyroProxy class allows you to read and configure Yoctopuce gyroscopes. It inherits from
    % <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
    % to access the autonomous datalogger. This class adds the possibility to access x, y and z
    % components of the rotation vector separately, as well as the possibility to deal with
    % quaternion-based orientation estimates.

    properties (Transient, Nontunable)
        % Bandwidth Measure update frequency, measured in Hz
        Bandwidth (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YGyro declaration)

    % //--- (YGyro implementation)
    methods (Hidden)
        function obj = YGyroProxy()
            % YGyroProxy For internal use as System Object.
            % Use FindGyro() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1130132486;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindGyro(func)
            % FindGyro Retrieve instances of YGyroProxy
            obj = YoctoProxyAPI.YGyroProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindGyro to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1130132486);
        end
    end
    % //--- (end of YGyro implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YGyroProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Gyro');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Gyro', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Gyro settings', ...
                'PropertyList', {'Bandwidth'});
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
        % //--- (YGyro accessors declaration)

        function result = get_bandwidth(obj)
            % Returns the measure update frequency, measured in Hz.
            %
            % @return an integer corresponding to the measure update frequency, measured in Hz
            %
            % On failure, throws an exception or returns YGyro.BANDWIDTH_INVALID.
            result = obj.InvokeMethod_D(1075889934);
        end

        function set_bandwidth(obj, newVal)
            % Changes the measure update frequency, measured in Hz. When the
            % frequency is lower, the device performs averaging.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the measure update frequency, measured in Hz
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1253040662, newVal);
        end

        function result = get.Bandwidth(obj)
            result = obj.GetPropInt32(150493132);
        end

        function set.Bandwidth(obj, newVal)
            obj.Bandwidth = newVal;
            obj.SetPropInt32(150493132, newVal);
        end

        function result = get_xValue(obj)
            % Returns the angular velocity around the X axis of the device, as a floating point number.
            %
            % @return a floating point number corresponding to the angular velocity around the X axis
            % of the device, as a floating point number
            %
            % On failure, throws an exception or returns YGyro.XVALUE_INVALID.
            result = obj.InvokeMethod_F(1148075671);
        end

        function result = get_yValue(obj)
            % Returns the angular velocity around the Y axis of the device, as a floating point number.
            %
            % @return a floating point number corresponding to the angular velocity around the Y axis
            % of the device, as a floating point number
            %
            % On failure, throws an exception or returns YGyro.YVALUE_INVALID.
            result = obj.InvokeMethod_F(-2000404983);
        end

        function result = get_zValue(obj)
            % Returns the angular velocity around the Z axis of the device, as a floating point number.
            %
            % @return a floating point number corresponding to the angular velocity around the Z axis
            % of the device, as a floating point number
            %
            % On failure, throws an exception or returns YGyro.ZVALUE_INVALID.
            result = obj.InvokeMethod_F(105593322);
        end

        function result = get_roll(obj)
            % Returns the estimated roll angle, based on the integration of
            % gyroscopic measures combined with acceleration and
            % magnetic field measurements.
            % The axis corresponding to the roll angle can be mapped to any
            % of the device X, Y or Z physical directions using methods of
            % the class YRefFrame.
            %
            % @return a floating-point number corresponding to roll angle
            %         in degrees, between -180 and +180.
            result = obj.InvokeMethod_F(-185915849);
        end

        function result = get_pitch(obj)
            % Returns the estimated pitch angle, based on the integration of
            % gyroscopic measures combined with acceleration and
            % magnetic field measurements.
            % The axis corresponding to the pitch angle can be mapped to any
            % of the device X, Y or Z physical directions using methods of
            % the class YRefFrame.
            %
            % @return a floating-point number corresponding to pitch angle
            %         in degrees, between -90 and +90.
            result = obj.InvokeMethod_F(115679533);
        end

        function result = get_heading(obj)
            % Returns the estimated heading angle, based on the integration of
            % gyroscopic measures combined with acceleration and
            % magnetic field measurements.
            % The axis corresponding to the heading can be mapped to any
            % of the device X, Y or Z physical directions using methods of
            % the class YRefFrame.
            %
            % @return a floating-point number corresponding to heading
            %         in degrees, between 0 and 360.
            result = obj.InvokeMethod_F(-1423304767);
        end

        function result = get_quaternionW(obj)
            % Returns the w component (real part) of the quaternion
            % describing the device estimated orientation, based on the
            % integration of gyroscopic measures combined with acceleration and
            % magnetic field measurements.
            %
            % @return a floating-point number corresponding to the w
            %         component of the quaternion.
            result = obj.InvokeMethod_F(-1773423687);
        end

        function result = get_quaternionX(obj)
            % Returns the x component of the quaternion
            % describing the device estimated orientation, based on the
            % integration of gyroscopic measures combined with acceleration and
            % magnetic field measurements. The x component is
            % mostly correlated with rotations on the roll axis.
            %
            % @return a floating-point number corresponding to the x
            %         component of the quaternion.
            result = obj.InvokeMethod_F(-1659374460);
        end

        function result = get_quaternionY(obj)
            % Returns the y component of the quaternion
            % describing the device estimated orientation, based on the
            % integration of gyroscopic measures combined with acceleration and
            % magnetic field measurements. The y component is
            % mostly correlated with rotations on the pitch axis.
            %
            % @return a floating-point number corresponding to the y
            %         component of the quaternion.
            result = obj.InvokeMethod_F(-1663721805);
        end

        function result = get_quaternionZ(obj)
            % Returns the x component of the quaternion
            % describing the device estimated orientation, based on the
            % integration of gyroscopic measures combined with acceleration and
            % magnetic field measurements. The x component is
            % mostly correlated with changes of heading.
            %
            % @return a floating-point number corresponding to the z
            %         component of the quaternion.
            result = obj.InvokeMethod_F(-1634524950);
        end

        % //--- (end of YGyro accessors declaration)
    end
end
