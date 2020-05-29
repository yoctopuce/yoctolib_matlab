% YPwmPowerSourceProxy: PWM generator power source control interface, available for instance in the
% Yocto-PWM-Tx
% 
% The YPwmPowerSourceProxy class allows you to configure the voltage source used by all PWM outputs
% on the same device.

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


% //--- (YPwmPowerSource declaration)
classdef YPwmPowerSourceProxy < YoctoProxyAPI.YFunctionProxy
    % YPwmPowerSourceProxy: PWM generator power source control interface, available for instance in the
    % Yocto-PWM-Tx
    % 
    % The YPwmPowerSourceProxy class allows you to configure the voltage source used by all PWM outputs
    % on the same device.

    properties (Transient, Nontunable)
        % PowerMode Selected power source for the PWM on the same device
        PowerMode (1,1) YoctoProxyAPI.EnumPowerMode
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YPwmPowerSource declaration)

    % //--- (YPwmPowerSource implementation)
    methods (Hidden)
        function obj = YPwmPowerSourceProxy()
            % YPwmPowerSourceProxy For internal use as System Object.
            % Use FindPwmPowerSource() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1094860190;
        end
    end

    methods (Static)
        function obj = FindPwmPowerSource(func)
            % FindPwmPowerSource Retrieve instances of YPwmPowerSourceProxy
            obj = YoctoProxyAPI.YPwmPowerSourceProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindPwmPowerSource to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1094860190);
        end
    end
    % //--- (end of YPwmPowerSource implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YPwmPowerSourceProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'PwmPowerSource');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'PwmPowerSource', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'PwmPowerSource settings', ...
                'PropertyList', {'PowerMode'});
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
        % //--- (YPwmPowerSource accessors declaration)

        function result = get_powerMode(obj)
            % Returns the selected power source for the PWM on the same device.
            %
            % @return a value among Y_POWERMODE_USB_5V, Y_POWERMODE_USB_3V, Y_POWERMODE_EXT_V and
            % Y_POWERMODE_OPNDRN corresponding to the selected power source for the PWM on the same device
            %
            % On failure, throws an exception or returns Y_POWERMODE_INVALID.
            result = YoctoProxyAPI.EnumPowerMode(obj.InvokeMethod_D(-2052136103));
        end

        function set_powerMode(obj, newVal)
            % Changes  the PWM power source. PWM can use isolated 5V from USB, isolated 3V from USB or
            % voltage from an external power source. The PWM can also work in open drain  mode. In that
            % mode, the PWM actively pulls the line down.
            % Warning: this setting is common to all PWM on the same device. If you change that parameter,
            % all PWM located on the same device are  affected.
            % If you want the change to be kept after a device reboot, make sure  to call the matching
            % module saveToFlash().
            %
            % @param newval : a value among Y_POWERMODE_USB_5V, Y_POWERMODE_USB_3V, Y_POWERMODE_EXT_V
            % and Y_POWERMODE_OPNDRN corresponding to  the PWM power source
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1893611965, newVal);
        end

        function result = get.PowerMode(obj)
            result = YoctoProxyAPI.EnumPowerMode(obj.GetPropInt32(2043155365));
        end

        function set.PowerMode(obj, newVal)
            obj.PowerMode = newVal;
            obj.SetPropInt32(2043155365, newVal);
        end

        % //--- (end of YPwmPowerSource accessors declaration)
    end
end
