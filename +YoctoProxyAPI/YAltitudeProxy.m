% YAltitudeProxy: altimeter control interface, available for instance in the Yocto-Altimeter-V2 or
% the Yocto-GPS-V2
% 
% The YAltitudeProxy class allows you to read and configure Yoctopuce altimeters. It inherits from
% <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
% to access the autonomous datalogger. This class adds the ability to configure the barometric
% pressure adjusted to sea level (QNH) for barometric sensors.

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


% //--- (YAltitude declaration)
classdef YAltitudeProxy < YoctoProxyAPI.YSensorProxy
    % YAltitudeProxy: altimeter control interface, available for instance in the Yocto-Altimeter-V2 or
    % the Yocto-GPS-V2
    % 
    % The YAltitudeProxy class allows you to read and configure Yoctopuce altimeters. It inherits from
    % <tt>YSensor</tt> class the core functions to read measurements, to register callback functions, and
    % to access the autonomous datalogger. This class adds the ability to configure the barometric
    % pressure adjusted to sea level (QNH) for barometric sensors.

    properties (Transient, Nontunable)
        % Qnh Barometric pressure adjusted to sea level used to compute
        Qnh (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YAltitude declaration)

    % //--- (YAltitude implementation)
    methods (Hidden)
        function obj = YAltitudeProxy()
            % YAltitudeProxy For internal use as System Object.
            % Use FindAltitude() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 1119668068;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindAltitude(func)
            % FindAltitude Retrieve instances of YAltitudeProxy
            obj = YoctoProxyAPI.YAltitudeProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindAltitude to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1119668068);
        end
    end
    % //--- (end of YAltitude implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YAltitudeProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Altitude');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Altitude', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Altitude settings', ...
                'PropertyList', {'Qnh'});
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
        % //--- (YAltitude accessors declaration)

        function set_currentValue(obj, newVal)
            % Changes the current estimated altitude. This allows one to compensate for
            % ambient pressure variations and to work in relative mode.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the current estimated altitude
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-189450195, newVal);
        end

        function set_qnh(obj, newVal)
            % Changes the barometric pressure adjusted to sea level used to compute
            % the altitude (QNH). This enables you to compensate for atmospheric pressure
            % changes due to weather conditions. Applicable to barometric altimeters only.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the barometric pressure
            % adjusted to sea level used to compute
            %         the altitude (QNH)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-1834066598, newVal);
        end

        function result = get_qnh(obj)
            % Returns the barometric pressure adjusted to sea level used to compute
            % the altitude (QNH). Applicable to barometric altimeters only.
            %
            % @return a floating point number corresponding to the barometric pressure adjusted to
            % sea level used to compute
            %         the altitude (QNH)
            %
            % On failure, throws an exception or returns YAltitude.QNH_INVALID.
            result = obj.InvokeMethod_F(1491889903);
        end

        function result = get.Qnh(obj)
            result = obj.GetPropDouble(707277526);
        end

        function set.Qnh(obj, newVal)
            obj.Qnh = newVal;
            obj.SetPropDouble(707277526, newVal);
        end

        function result = get_technology(obj)
            % Returns the technology used by the sesnor to compute
            % altitude. Possibles values are  "barometric" and "gps"
            %
            % @return a string corresponding to the technology used by the sesnor to compute
            %         altitude
            %
            % On failure, throws an exception or returns YAltitude.TECHNOLOGY_INVALID.
            result = obj.InvokeMethod_S(-1317242013);
        end

        % //--- (end of YAltitude accessors declaration)
    end
end
