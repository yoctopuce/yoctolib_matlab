% YVoltageOutputProxy: voltage output control interface, available for instance in the Yocto-0-10V-Tx
% 
% The YVoltageOutputProxy class allows you to drive a voltage output.

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


% //--- (YVoltageOutput declaration)
classdef YVoltageOutputProxy < YoctoProxyAPI.YFunctionProxy
    % YVoltageOutputProxy: voltage output control interface, available for instance in the Yocto-0-10V-Tx
    % 
    % The YVoltageOutputProxy class allows you to drive a voltage output.

    properties (Transient, Nontunable)
        % CurrentVoltage Output voltage set point, in V
        CurrentVoltage (1,1) double
        % VoltageAtStartUp Selected voltage output at device startup, in V
        VoltageAtStartUp (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YVoltageOutput declaration)

    % //--- (YVoltageOutput implementation)
    methods (Hidden)
        function obj = YVoltageOutputProxy()
            % YVoltageOutputProxy For internal use as System Object.
            % Use FindVoltageOutput() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1807323974;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindVoltageOutput(func)
            % FindVoltageOutput Retrieve instances of YVoltageOutputProxy
            obj = YoctoProxyAPI.YVoltageOutputProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindVoltageOutput to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1807323974);
        end
    end
    % //--- (end of YVoltageOutput implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YVoltageOutputProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'VoltageOutput');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'VoltageOutput', ...
                'PropertyList', {'CurrentVoltage'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'VoltageOutput settings', ...
                'PropertyList', {'VoltageAtStartUp'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropDouble(-239362194, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'CurrentVoltage';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YVoltageOutput accessors declaration)

        function set_currentVoltage(obj, newVal)
            % Changes the output voltage, in V. Valid range is from 0 to 10V.
            %
            % @param newval : a floating point number corresponding to the output voltage, in V
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-863205235, newVal);
        end

        function result = get_currentVoltage(obj)
            % Returns the output voltage set point, in V.
            %
            % @return a floating point number corresponding to the output voltage set point, in V
            %
            % On failure, throws an exception or returns YVoltageOutput.CURRENTVOLTAGE_INVALID.
            result = obj.InvokeMethod_F(1506404409);
        end

        function result = get.CurrentVoltage(obj)
            result = obj.GetPropDouble(-239362194);
        end

        function set.CurrentVoltage(obj, newVal)
            obj.CurrentVoltage = newVal;
            obj.SetPropDouble(-239362194, newVal);
        end

        function set_voltageAtStartUp(obj, newVal)
            % Changes the output voltage at device start up. Remember to call the matching
            % module saveToFlash() method, otherwise this call has no effect.
            %
            % @param newval : a floating point number corresponding to the output voltage at device start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1729905413, newVal);
        end

        function result = get_voltageAtStartUp(obj)
            % Returns the selected voltage output at device startup, in V.
            %
            % @return a floating point number corresponding to the selected voltage output at device startup, in V
            %
            % On failure, throws an exception or returns YVoltageOutput.VOLTAGEATSTARTUP_INVALID.
            result = obj.InvokeMethod_F(-1457210740);
        end

        function result = get.VoltageAtStartUp(obj)
            result = obj.GetPropDouble(-2107764019);
        end

        function set.VoltageAtStartUp(obj, newVal)
            obj.VoltageAtStartUp = newVal;
            obj.SetPropDouble(-2107764019, newVal);
        end

        function result = voltageMove(obj, V_target, ms_duration)
            % Performs a smooth transition of output voltage. Any explicit voltage
            % change cancels any ongoing transition process.
            %
            % @param V_target   : new output voltage value at the end of the transition
            %         (floating-point number, representing the end voltage in V)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            result = obj.InvokeMethod_Dfd(-253308149, V_target, ms_duration);
        end

        % //--- (end of YVoltageOutput accessors declaration)
    end
end
