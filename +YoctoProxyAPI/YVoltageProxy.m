% YVoltageProxy: voltage sensor control interface, available for instance in the Yocto-Motor-DC, the
% Yocto-Volt or the Yocto-Watt
% 
% The YVoltageProxy class allows you to read and configure Yoctopuce voltage sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measures, to register callback functions,
% and to access the autonomous datalogger.

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


% //--- (YVoltage declaration)
classdef YVoltageProxy < YoctoProxyAPI.YSensorProxy
    % YVoltageProxy: voltage sensor control interface, available for instance in the Yocto-Motor-DC, the
    % Yocto-Volt or the Yocto-Watt
    % 
    % The YVoltageProxy class allows you to read and configure Yoctopuce voltage sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measures, to register callback functions,
    % and to access the autonomous datalogger.

    properties (Transient, Nontunable)
        % Enabled Activation state of this input
        Enabled (1,1) YoctoProxyAPI.EnumEnabled
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YVoltage declaration)

    % //--- (YVoltage implementation)
    methods (Hidden)
        function obj = YVoltageProxy()
            % YVoltageProxy For internal use as System Object.
            % Use FindVoltage() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1037706661;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindVoltage(func)
            % FindVoltage Retrieve instances of YVoltageProxy
            obj = YoctoProxyAPI.YVoltageProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindVoltage to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1037706661);
        end
    end
    % //--- (end of YVoltage implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YVoltageProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Voltage');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Voltage', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Voltage settings', ...
                'PropertyList', {'Enabled'});
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
        % //--- (YVoltage accessors declaration)

        function result = get_enabled(obj)
            % Returns the activation state of this input.
            %
            % @return either YVoltage.ENABLED_FALSE or YVoltage.ENABLED_TRUE, according to the
            % activation state of this input
            %
            % On failure, throws an exception or returns YVoltage.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Changes the activation state of this voltage input. When AC measures are disabled,
            % the device will always assume a DC signal, and vice-versa. When both AC and DC measures
            % are active, the device switches between AC and DC mode based on the relative amplitude
            % of variations compared to the average value.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : either YVoltage.ENABLED_FALSE or YVoltage.ENABLED_TRUE, according to
            % the activation state of this voltage input
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function result = get.Enabled(obj)
            result = YoctoProxyAPI.EnumEnabled(obj.GetPropInt32(-1622900200));
        end

        function set.Enabled(obj, newVal)
            obj.Enabled = newVal;
            obj.SetPropInt32(-1622900200, newVal);
        end

        % //--- (end of YVoltage accessors declaration)
    end
end
