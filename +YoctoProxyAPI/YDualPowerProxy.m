% YDualPowerProxy: dual power switch control interface, available for instance in the Yocto-Servo
% 
% The YDualPowerProxy class allows you to control the power source to use for module functions that
% require high current. The module can also automatically disconnect the external power when a
% voltage drop is observed on the external power source (external battery running out of power).

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


% //--- (YDualPower declaration)
classdef YDualPowerProxy < YoctoProxyAPI.YFunctionProxy
    % YDualPowerProxy: dual power switch control interface, available for instance in the Yocto-Servo
    % 
    % The YDualPowerProxy class allows you to control the power source to use for module functions that
    % require high current. The module can also automatically disconnect the external power when a
    % voltage drop is observed on the external power source (external battery running out of power).

    properties (Transient, Nontunable)
        % PowerControl Selected power source for module functions that require lots of current
        PowerControl (1,1) YoctoProxyAPI.EnumPowerControl
    end

    properties (Transient, Nontunable, SetAccess = private)
        % PowerState Current power source for module functions that require lots of current
        PowerState (1,1) YoctoProxyAPI.EnumPowerState
    end

    properties (Constant)
    end
    % //--- (end of YDualPower declaration)

    % //--- (YDualPower implementation)
    methods (Hidden)
        function obj = YDualPowerProxy()
            % YDualPowerProxy For internal use as System Object.
            % Use FindDualPower() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 2136574104;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindDualPower(func)
            % FindDualPower Retrieve instances of YDualPowerProxy
            obj = YoctoProxyAPI.YDualPowerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindDualPower to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(2136574104);
        end
    end
    % //--- (end of YDualPower implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YDualPowerProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'DualPower');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'DualPower', ...
                'PropertyList', {'PowerControl','PowerState'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'DualPower settings', ...
                'PropertyList', {});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = YoctoProxyAPI.EnumPowerState(obj.GetPropInt32(1153826216));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'YoctoProxyAPI.EnumPowerState';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'PowerState';
        end
    end

    methods
        % //--- (YDualPower accessors declaration)

        function result = get_powerState(obj)
            % Returns the current power source for module functions that require lots of current.
            %
            % @return a value among YDualPower.POWERSTATE_OFF, YDualPower.POWERSTATE_FROM_USB and
            % YDualPower.POWERSTATE_FROM_EXT corresponding to the current power source for module
            % functions that require lots of current
            %
            % On failure, throws an exception or returns YDualPower.POWERSTATE_INVALID.
            result = YoctoProxyAPI.EnumPowerState(obj.InvokeMethod_D(1342057514));
        end

        function result = get.PowerState(obj)
            result = YoctoProxyAPI.EnumPowerState(obj.GetPropInt32(1153826216));
        end

        function result = get_powerControl(obj)
            % Returns the selected power source for module functions that require lots of current.
            %
            % @return a value among YDualPower.POWERCONTROL_AUTO, YDualPower.POWERCONTROL_FROM_USB,
            % YDualPower.POWERCONTROL_FROM_EXT and YDualPower.POWERCONTROL_OFF corresponding to the
            % selected power source for module functions that require lots of current
            %
            % On failure, throws an exception or returns YDualPower.POWERCONTROL_INVALID.
            result = YoctoProxyAPI.EnumPowerControl(obj.InvokeMethod_D(1058308694));
        end

        function set_powerControl(obj, newVal)
            % Changes the selected power source for module functions that require lots of current.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among YDualPower.POWERCONTROL_AUTO,
            % YDualPower.POWERCONTROL_FROM_USB, YDualPower.POWERCONTROL_FROM_EXT and
            % YDualPower.POWERCONTROL_OFF corresponding to the selected power source for module
            % functions that require lots of current
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(561064320, newVal);
        end

        function result = get.PowerControl(obj)
            result = YoctoProxyAPI.EnumPowerControl(obj.GetPropInt32(-677578541));
        end

        function set.PowerControl(obj, newVal)
            obj.PowerControl = newVal;
            obj.SetPropInt32(-677578541, newVal);
        end

        function result = get_extVoltage(obj)
            % Returns the measured voltage on the external power source, in millivolts.
            %
            % @return an integer corresponding to the measured voltage on the external power source, in millivolts
            %
            % On failure, throws an exception or returns YDualPower.EXTVOLTAGE_INVALID.
            result = obj.InvokeMethod_D(1530538410);
        end

        % //--- (end of YDualPower accessors declaration)
    end
end
