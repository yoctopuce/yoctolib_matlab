% YMultiSensControllerProxy: Sensor chain configuration interface, available for instance in the
% Yocto-Temperature-IR
% 
% The YMultiSensControllerProxy class allows you to setup a customized sensor chain on devices
% featuring that functionality.

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


% //--- (YMultiSensController declaration)
classdef YMultiSensControllerProxy < YoctoProxyAPI.YFunctionProxy
    % YMultiSensControllerProxy: Sensor chain configuration interface, available for instance in the
    % Yocto-Temperature-IR
    % 
    % The YMultiSensControllerProxy class allows you to setup a customized sensor chain on devices
    % featuring that functionality.

    properties (Transient, Nontunable)
        % NSensors Number of sensors to poll
        NSensors (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YMultiSensController declaration)

    % //--- (YMultiSensController implementation)
    methods (Hidden)
        function obj = YMultiSensControllerProxy()
            % YMultiSensControllerProxy For internal use as System Object.
            % Use FindMultiSensController() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1517278025;
        end
    end

    methods (Static)
        function obj = FindMultiSensController(func)
            % FindMultiSensController Retrieve instances of YMultiSensControllerProxy
            obj = YoctoProxyAPI.YMultiSensControllerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindMultiSensController to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1517278025);
        end
    end
    % //--- (end of YMultiSensController implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YMultiSensControllerProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'MultiSensController');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'MultiSensController', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'MultiSensController settings', ...
                'PropertyList', {'NSensors'});
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
        % //--- (YMultiSensController accessors declaration)

        function result = get_nSensors(obj)
            % Returns the number of sensors to poll.
            %
            % @return an integer corresponding to the number of sensors to poll
            %
            % On failure, throws an exception or returns YMultiSensController.NSENSORS_INVALID.
            result = obj.InvokeMethod_D(1841927138);
        end

        function set_nSensors(obj, newVal)
            % Changes the number of sensors to poll. Remember to call the
            % saveToFlash() method of the module if the
            % modification must be kept. It is recommended to restart the
            % device with  module->reboot() after modifying
            % (and saving) this settings.
            %
            % @param newval : an integer corresponding to the number of sensors to poll
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(699990109, newVal);
        end

        function result = get.NSensors(obj)
            result = obj.GetPropInt32(-617147452);
        end

        function set.NSensors(obj, newVal)
            obj.NSensors = newVal;
            obj.SetPropInt32(-617147452, newVal);
        end

        function result = get_maxSensors(obj)
            % Returns the maximum configurable sensor count allowed on this device.
            %
            % @return an integer corresponding to the maximum configurable sensor count allowed on this device
            %
            % On failure, throws an exception or returns YMultiSensController.MAXSENSORS_INVALID.
            result = obj.InvokeMethod_D(52493196);
        end

        function result = get_maintenanceMode(obj)
            % Returns true when the device is in maintenance mode.
            %
            % @return either YMultiSensController.MAINTENANCEMODE_FALSE or
            % YMultiSensController.MAINTENANCEMODE_TRUE, according to true when the device is in maintenance mode
            %
            % On failure, throws an exception or returns YMultiSensController.MAINTENANCEMODE_INVALID.
            result = YoctoProxyAPI.EnumMaintenanceMode(obj.InvokeMethod_D(-1026204954));
        end

        function set_maintenanceMode(obj, newVal)
            % Changes the device mode to enable maintenance and to stop sensor polling.
            % This way, the device does not automatically restart when it cannot
            % communicate with one of the sensors.
            %
            % @param newval : either YMultiSensController.MAINTENANCEMODE_FALSE or
            % YMultiSensController.MAINTENANCEMODE_TRUE, according to the device mode to enable
            % maintenance and to stop sensor polling
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1599705991, newVal);
        end

        function result = get_lastAddressDetected(obj)
            % Returns the I2C address of the most recently detected sensor. This method can
            % be used to in case of I2C communication error to determine what is the
            % last sensor that can be reached, or after a call to setupAddress
            % to make sure that the address change was properly processed.
            %
            % @return an integer corresponding to the I2C address of the most recently detected sensor
            %
            % On failure, throws an exception or returns YMultiSensController.LASTADDRESSDETECTED_INVALID.
            result = obj.InvokeMethod_D(-1943903437);
        end

        function result = setupAddress(obj, addr)
            % Configures the I2C address of the only sensor connected to the device.
            % It is recommended to put the the device in maintenance mode before
            % changing sensor addresses.  This method is only intended to work with a single
            % sensor connected to the device. If several sensors are connected, the result
            % is unpredictable.
            %
            % Note that the device is expecting to find a sensor or a string of sensors with specific
            % addresses. Check the device documentation to find out which addresses should be used.
            %
            % @param addr : new address of the connected sensor
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1992262065, addr);
        end

        function result = get_sensorAddress(obj)
            % Triggers the I2C address detection procedure for the only sensor connected to the device.
            % This method is only intended to work with a single sensor connected to the device.
            % If several sensors are connected, the result is unpredictable.
            %
            % @return the I2C address of the detected sensor, or 0 if none is found
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1230222336);
        end

        % //--- (end of YMultiSensController accessors declaration)
    end
end
