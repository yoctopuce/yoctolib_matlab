% YCurrentLoopOutputProxy: 4-20mA output control interface, available for instance in the
% Yocto-4-20mA-Tx
% 
% The YCurrentLoopOutputProxy class allows you to drive a 4-20mA output by regulating the current
% flowing through the current loop. It can also provide information about the power state of the
% current loop.

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


% //--- (YCurrentLoopOutput declaration)
classdef YCurrentLoopOutputProxy < YoctoProxyAPI.YFunctionProxy
    % YCurrentLoopOutputProxy: 4-20mA output control interface, available for instance in the
    % Yocto-4-20mA-Tx
    % 
    % The YCurrentLoopOutputProxy class allows you to drive a 4-20mA output by regulating the current
    % flowing through the current loop. It can also provide information about the power state of the
    % current loop.

    properties (Transient, Nontunable)
        % Current Loop current set point in mA
        Current (1,1) double
        % CurrentAtStartUp Current in the loop at device startup, in mA
        CurrentAtStartUp (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
        % LoopPower POWEROK when the loop is powered, NOPWR when the loop is not powered, LOWPWR when the loop is not powered enough to maintain requested current
        LoopPower (1,1) YoctoProxyAPI.EnumLoopPower
    end

    properties (Constant)
    end
    % //--- (end of YCurrentLoopOutput declaration)

    % //--- (YCurrentLoopOutput implementation)
    methods (Hidden)
        function obj = YCurrentLoopOutputProxy()
            % YCurrentLoopOutputProxy For internal use as System Object.
            % Use FindCurrentLoopOutput() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1008979631;
            obj.numInputs = 1;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindCurrentLoopOutput(func)
            % FindCurrentLoopOutput Retrieve instances of YCurrentLoopOutputProxy
            obj = YoctoProxyAPI.YCurrentLoopOutputProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindCurrentLoopOutput to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1008979631);
        end
    end
    % //--- (end of YCurrentLoopOutput implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YCurrentLoopOutputProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'CurrentLoopOutput');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'CurrentLoopOutput', ...
                'PropertyList', {'Current','LoopPower'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'CurrentLoopOutput settings', ...
                'PropertyList', {'CurrentAtStartUp'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropDouble(323882391, varargin{1});
            end
            if nargout >= 1
                varargout{1} = YoctoProxyAPI.EnumLoopPower(obj.GetPropInt32(231849694));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'YoctoProxyAPI.EnumLoopPower';
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'Current';
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'LoopPower';
        end
    end

    methods
        % //--- (YCurrentLoopOutput accessors declaration)

        function set_current(obj, newVal)
            % Changes the current loop, the valid range is from 3 to 21mA. If the loop is
            % not properly powered, the  target current is not reached and
            % loopPower is set to LOWPWR.
            %
            % @param newval : a floating point number corresponding to the current loop, the valid
            % range is from 3 to 21mA
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1111343950, newVal);
        end

        function result = get_current(obj)
            % Returns the loop current set point in mA.
            %
            % @return a floating point number corresponding to the loop current set point in mA
            %
            % On failure, throws an exception or returns Y_CURRENT_INVALID.
            result = obj.InvokeMethod_F(233648074);
        end

        function result = get.Current(obj)
            result = obj.GetPropDouble(323882391);
        end

        function set.Current(obj, newVal)
            obj.Current = newVal;
            obj.SetPropDouble(323882391, newVal);
        end

        function result = get.LoopPower(obj)
            result = YoctoProxyAPI.EnumLoopPower(obj.GetPropInt32(231849694));
        end

        function set_currentAtStartUp(obj, newVal)
            % Changes the loop current at device start up. Remember to call the matching
            % module saveToFlash() method, otherwise this call has no effect.
            %
            % @param newval : a floating point number corresponding to the loop current at device start up
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1709375609, newVal);
        end

        function result = get_currentAtStartUp(obj)
            % Returns the current in the loop at device startup, in mA.
            %
            % @return a floating point number corresponding to the current in the loop at device startup, in mA
            %
            % On failure, throws an exception or returns Y_CURRENTATSTARTUP_INVALID.
            result = obj.InvokeMethod_F(-1411646992);
        end

        function result = get.CurrentAtStartUp(obj)
            result = obj.GetPropDouble(-2136585727);
        end

        function set.CurrentAtStartUp(obj, newVal)
            obj.CurrentAtStartUp = newVal;
            obj.SetPropDouble(-2136585727, newVal);
        end

        function result = get_loopPower(obj)
            % Returns the loop powerstate.  POWEROK: the loop
            % is powered. NOPWR: the loop in not powered. LOWPWR: the loop is not
            % powered enough to maintain the current required (insufficient voltage).
            %
            % @return a value among Y_LOOPPOWER_NOPWR, Y_LOOPPOWER_LOWPWR and Y_LOOPPOWER_POWEROK
            % corresponding to the loop powerstate
            %
            % On failure, throws an exception or returns Y_LOOPPOWER_INVALID.
            result = YoctoProxyAPI.EnumLoopPower(obj.InvokeMethod_D(-519903192));
        end

        function result = currentMove(obj, mA_target, ms_duration)
            % Performs a smooth transition of current flowing in the loop. Any current explicit
            % change cancels any ongoing transition process.
            %
            % @param mA_target   : new current value at the end of the transition
            %         (floating-point number, representing the end current in mA)
            % @param ms_duration : total duration of the transition, in milliseconds
            %
            % @return 0 when the call succeeds.
            result = obj.InvokeMethod_Dfd(1697453512, mA_target, ms_duration);
        end

        % //--- (end of YCurrentLoopOutput accessors declaration)
    end
end
