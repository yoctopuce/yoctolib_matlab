% YPowerOutputProxy: power output control interface, available for instance in the Yocto-I2C, the
% Yocto-MaxiMicroVolt-Rx, the Yocto-SPI or the Yocto-Serial
% 
% The YPowerOutputProxy class allows you to control the power output featured on some Yoctopuce
% devices.

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


% //--- (YPowerOutput declaration)
classdef YPowerOutputProxy < YoctoProxyAPI.YFunctionProxy
    % YPowerOutputProxy: power output control interface, available for instance in the Yocto-I2C, the
    % Yocto-MaxiMicroVolt-Rx, the Yocto-SPI or the Yocto-Serial
    % 
    % The YPowerOutputProxy class allows you to control the power output featured on some Yoctopuce
    % devices.

    properties (Transient, Nontunable)
        % Voltage Voltage on the power output featured by the module
        Voltage (1,1) YoctoProxyAPI.EnumVoltage
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPowerOutput declaration)

    % //--- (YPowerOutput implementation)
    methods (Hidden)
        function obj = YPowerOutputProxy()
            % YPowerOutputProxy For internal use as System Object.
            % Use FindPowerOutput() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1046168319;
        end
    end

    methods (Static)
        function obj = FindPowerOutput(func)
            % FindPowerOutput Retrieve instances of YPowerOutputProxy
            obj = YoctoProxyAPI.YPowerOutputProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPowerOutput to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1046168319);
        end
    end
    % //--- (end of YPowerOutput implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPowerOutputProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'PowerOutput');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'PowerOutput', ...
                'PropertyList', {'Voltage'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'PowerOutput settings', ...
                'PropertyList', {});
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
        % //--- (YPowerOutput accessors declaration)

        function result = get_voltage(obj)
            % Returns the voltage on the power output featured by the module.
            %
            % @return a value among Y_VOLTAGE_OFF, Y_VOLTAGE_OUT3V3, Y_VOLTAGE_OUT5V,
            % Y_VOLTAGE_OUT4V7 and Y_VOLTAGE_OUT1V8 corresponding to the voltage on the power output
            % featured by the module
            %
            % On failure, throws an exception or returns Y_VOLTAGE_INVALID.
            result = YoctoProxyAPI.EnumVoltage(obj.InvokeMethod_D(-1675935560));
        end

        function set_voltage(obj, newVal)
            % Changes the voltage on the power output provided by the
            % module. Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among Y_VOLTAGE_OFF, Y_VOLTAGE_OUT3V3, Y_VOLTAGE_OUT5V,
            % Y_VOLTAGE_OUT4V7 and Y_VOLTAGE_OUT1V8 corresponding to the voltage on the power output
            % provided by the
            %         module
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-741626820, newVal);
        end

        function result = get.Voltage(obj)
            result = YoctoProxyAPI.EnumVoltage(obj.GetPropInt32(-1037706661));
        end

        function set.Voltage(obj, newVal)
            obj.Voltage = newVal;
            obj.SetPropInt32(-1037706661, newVal);
        end

        % //--- (end of YPowerOutput accessors declaration)
    end
end
