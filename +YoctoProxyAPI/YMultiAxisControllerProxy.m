% YMultiAxisControllerProxy: MultiAxisController function interface
% 
% The YMultiAxisControllerProxy class allows you to drive multiple stepper motors synchronously.

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


% //--- (YMultiAxisController declaration)
classdef YMultiAxisControllerProxy < YoctoProxyAPI.YFunctionProxy
    % YMultiAxisControllerProxy: MultiAxisController function interface
    % 
    % The YMultiAxisControllerProxy class allows you to drive multiple stepper motors synchronously.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YMultiAxisController declaration)

    % //--- (YMultiAxisController implementation)
    methods (Hidden)
        function obj = YMultiAxisControllerProxy()
            % YMultiAxisControllerProxy For internal use as System Object.
            % Use FindMultiAxisController() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1509950627;
        end
    end

    methods (Static)
        function obj = FindMultiAxisController(func)
            % FindMultiAxisController Retrieve instances of YMultiAxisControllerProxy
            obj = YoctoProxyAPI.YMultiAxisControllerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindMultiAxisController to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1509950627);
        end
    end
    % //--- (end of YMultiAxisController implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YMultiAxisControllerProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'MultiAxisController');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'MultiAxisController', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'MultiAxisController settings', ...
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
        % //--- (YMultiAxisController accessors declaration)

        function result = get_nAxis(obj)
            % Returns the number of synchronized controllers.
            %
            % @return an integer corresponding to the number of synchronized controllers
            %
            % On failure, throws an exception or returns Y_NAXIS_INVALID.
            result = obj.InvokeMethod_D(-1899273923);
        end

        function set_nAxis(obj, newVal)
            % Changes the number of synchronized controllers.
            %
            % @param newval : an integer corresponding to the number of synchronized controllers
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1416956228, newVal);
        end

        function result = get_globalState(obj)
            % Returns the stepper motor set overall state.
            %
            % @return a value among Y_GLOBALSTATE_ABSENT, Y_GLOBALSTATE_ALERT, Y_GLOBALSTATE_HI_Z,
            % Y_GLOBALSTATE_STOP, Y_GLOBALSTATE_RUN and Y_GLOBALSTATE_BATCH corresponding to the
            % stepper motor set overall state
            %
            % On failure, throws an exception or returns Y_GLOBALSTATE_INVALID.
            result = YoctoProxyAPI.EnumGlobalState(obj.InvokeMethod_D(1619671536));
        end

        function result = reset(obj)
            % Reinitialize all controllers and clear all alert flags.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        function result = findHomePosition(obj, speed)
            % Starts all motors backward at the specified speeds, to search for the motor home position.
            %
            % @param speed : desired speed for all axis, in steps per second.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxf(-794690470, speed);
        end

        function result = moveTo(obj, absPos)
            % Starts all motors synchronously to reach a given absolute position.
            % The time needed to reach the requested position will depend on the lowest
            % acceleration and max speed parameters configured for all motors.
            % The final position will be reached on all axis at the same time.
            %
            % @param absPos : absolute position, measured in steps from each origin.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxf(-598739568, absPos);
        end

        function result = moveRel(obj, relPos)
            % Starts all motors synchronously to reach a given relative position.
            % The time needed to reach the requested position will depend on the lowest
            % acceleration and max speed parameters configured for all motors.
            % The final position will be reached on all axis at the same time.
            %
            % @param relPos : relative position, measured in steps from the current position.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxf(-589115154, relPos);
        end

        function result = pause(obj, waitMs)
            % Keep the motor in the same state for the specified amount of time, before processing next command.
            %
            % @param waitMs : wait time, specified in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1258533319, waitMs);
        end

        function result = emergencyStop(obj)
            % Stops the motor with an emergency alert, without taking any additional precaution.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1184506499);
        end

        function result = abortAndBrake(obj)
            % Stops the motor smoothly as soon as possible, without waiting for ongoing move completion.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2142153652);
        end

        function result = abortAndHiZ(obj)
            % Turn the controller into Hi-Z mode immediately, without waiting for ongoing move completion.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(711487166);
        end

        % //--- (end of YMultiAxisController accessors declaration)
    end
end
