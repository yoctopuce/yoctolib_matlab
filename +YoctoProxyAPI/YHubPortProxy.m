% YHubPortProxy: YoctoHub slave port control interface, available for instance in the
% YoctoHub-Ethernet, the YoctoHub-GSM-4G, the YoctoHub-Shield or the YoctoHub-Wireless-n
% 
% The YHubPortProxy class provides control over the power supply for slave ports on a YoctoHub. It
% provide information about the device connected to it. The logical name of a YHubPort is always
% automatically set to the unique serial number of the Yoctopuce device connected to it.

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


% //--- (YHubPort declaration)
classdef YHubPortProxy < YoctoProxyAPI.YFunctionProxy
    % YHubPortProxy: YoctoHub slave port control interface, available for instance in the
    % YoctoHub-Ethernet, the YoctoHub-GSM-4G, the YoctoHub-Shield or the YoctoHub-Wireless-n
    % 
    % The YHubPortProxy class provides control over the power supply for slave ports on a YoctoHub. It
    % provide information about the device connected to it. The logical name of a YHubPort is always
    % automatically set to the unique serial number of the Yoctopuce device connected to it.

    properties (Transient, Nontunable)
        % Enabled True if the port output is enabled
        Enabled (1,1) YoctoProxyAPI.EnumEnabled
    end

    properties (Transient, Nontunable, SetAccess = private)
        % PortState Current state of the YoctoHub port
        PortState (1,1) YoctoProxyAPI.EnumPortState
    end

    properties (Constant)
    end
    % //--- (end of YHubPort declaration)

    % //--- (YHubPort implementation)
    methods (Hidden)
        function obj = YHubPortProxy()
            % YHubPortProxy For internal use as System Object.
            % Use FindHubPort() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1871547951;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindHubPort(func)
            % FindHubPort Retrieve instances of YHubPortProxy
            obj = YoctoProxyAPI.YHubPortProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindHubPort to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1871547951);
        end
    end
    % //--- (end of YHubPort implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YHubPortProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'HubPort');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'HubPort', ...
                'PropertyList', {'Enabled','PortState'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'HubPort settings', ...
                'PropertyList', {});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = YoctoProxyAPI.EnumPortState(obj.GetPropInt32(-760978440));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'YoctoProxyAPI.EnumPortState';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'PortState';
        end
    end

    methods
        % //--- (YHubPort accessors declaration)

        function result = get_enabled(obj)
            % Returns true if the YoctoHub port is powered, false otherwise.
            %
            % @return either YHubPort.ENABLED_FALSE or YHubPort.ENABLED_TRUE, according to true if
            % the YoctoHub port is powered, false otherwise
            %
            % On failure, throws an exception or returns YHubPort.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Changes the activation of the YoctoHub port. If the port is enabled, the
            % connected module is powered. Otherwise, port power is shut down.
            %
            % @param newval : either YHubPort.ENABLED_FALSE or YHubPort.ENABLED_TRUE, according to
            % the activation of the YoctoHub port
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function result = get_portState(obj)
            % Returns the current state of the YoctoHub port.
            %
            % @return a value among YHubPort.PORTSTATE_OFF, YHubPort.PORTSTATE_OVRLD,
            % YHubPort.PORTSTATE_ON, YHubPort.PORTSTATE_RUN and YHubPort.PORTSTATE_PROG corresponding
            % to the current state of the YoctoHub port
            %
            % On failure, throws an exception or returns YHubPort.PORTSTATE_INVALID.
            result = YoctoProxyAPI.EnumPortState(obj.InvokeMethod_D(-625075696));
        end

        function result = get.PortState(obj)
            result = YoctoProxyAPI.EnumPortState(obj.GetPropInt32(-760978440));
        end

        function result = get.Enabled(obj)
            result = YoctoProxyAPI.EnumEnabled(obj.GetPropInt32(-1622900200));
        end

        function set.Enabled(obj, newVal)
            obj.Enabled = newVal;
            obj.SetPropInt32(-1622900200, newVal);
        end

        function result = get_baudRate(obj)
            % Returns the current baud rate used by this YoctoHub port, in kbps.
            % The default value is 1000 kbps, but a slower rate may be used if communication
            % problems are encountered.
            %
            % @return an integer corresponding to the current baud rate used by this YoctoHub port, in kbps
            %
            % On failure, throws an exception or returns YHubPort.BAUDRATE_INVALID.
            result = obj.InvokeMethod_D(-503767631);
        end

        % //--- (end of YHubPort accessors declaration)
    end
end
