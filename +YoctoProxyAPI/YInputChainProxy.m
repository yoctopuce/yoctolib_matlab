% YInputChainProxy: InputChain function interface
% 
% The YInputChainProxy class provides access to separate digital inputs connected in a chain.

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


% //--- (YInputChain declaration)
classdef YInputChainProxy < YoctoProxyAPI.YFunctionProxy
    % YInputChainProxy: InputChain function interface
    % 
    % The YInputChainProxy class provides access to separate digital inputs connected in a chain.

    properties (Transient, Nontunable)
        % ExpectedNodes Number of nodes expected in the chain
        ExpectedNodes (1,1) int32
        % LoopbackTest Activation state of the exhaustive chain connectivity test
        LoopbackTest (1,1) YoctoProxyAPI.EnumLoopbackTest
        % RefreshRate Desired refresh rate, measured in Hz
        RefreshRate (1,1) int32
        % WatchdogPeriod Wait time in seconds before triggering an inactivity
        WatchdogPeriod (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YInputChain declaration)

    % //--- (YInputChain implementation)
    methods (Hidden)
        function obj = YInputChainProxy()
            % YInputChainProxy For internal use as System Object.
            % Use FindInputChain() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 567738162;
        end
    end

    methods (Static)
        function obj = FindInputChain(func)
            % FindInputChain Retrieve instances of YInputChainProxy
            obj = YoctoProxyAPI.YInputChainProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindInputChain to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(567738162);
        end
    end
    % //--- (end of YInputChain implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YInputChainProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'InputChain');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'InputChain', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'InputChain settings', ...
                'PropertyList', {'ExpectedNodes','LoopbackTest','RefreshRate','WatchdogPeriod'});
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
        % //--- (YInputChain accessors declaration)

        function result = get_expectedNodes(obj)
            % Returns the number of nodes expected in the chain.
            %
            % @return an integer corresponding to the number of nodes expected in the chain
            %
            % On failure, throws an exception or returns YInputChain.EXPECTEDNODES_INVALID.
            result = obj.InvokeMethod_D(-399061321);
        end

        function set_expectedNodes(obj, newVal)
            % Changes the number of nodes expected in the chain.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the number of nodes expected in the chain
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(695392407, newVal);
        end

        function result = get.ExpectedNodes(obj)
            result = obj.GetPropInt32(1505615639);
        end

        function set.ExpectedNodes(obj, newVal)
            obj.ExpectedNodes = newVal;
            obj.SetPropInt32(1505615639, newVal);
        end

        function result = get_detectedNodes(obj)
            % Returns the number of nodes detected in the chain.
            %
            % @return an integer corresponding to the number of nodes detected in the chain
            %
            % On failure, throws an exception or returns YInputChain.DETECTEDNODES_INVALID.
            result = obj.InvokeMethod_D(1077687294);
        end

        function result = get_loopbackTest(obj)
            % Returns the activation state of the exhaustive chain connectivity test.
            % The connectivity test requires a cable connecting the end of the chain
            % to the loopback test connector.
            %
            % @return either YInputChain.LOOPBACKTEST_OFF or YInputChain.LOOPBACKTEST_ON, according
            % to the activation state of the exhaustive chain connectivity test
            %
            % On failure, throws an exception or returns YInputChain.LOOPBACKTEST_INVALID.
            result = YoctoProxyAPI.EnumLoopbackTest(obj.InvokeMethod_D(-179398158));
        end

        function set_loopbackTest(obj, newVal)
            % Changes the activation state of the exhaustive chain connectivity test.
            % The connectivity test requires a cable connecting the end of the chain
            % to the loopback test connector.
            %
            % If you want the change to be kept after a device reboot,
            % make sure  to call the matching module saveToFlash().
            %
            % @param newval : either YInputChain.LOOPBACKTEST_OFF or YInputChain.LOOPBACKTEST_ON,
            % according to the activation state of the exhaustive chain connectivity test
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-349490652, newVal);
        end

        function result = get.LoopbackTest(obj)
            result = YoctoProxyAPI.EnumLoopbackTest(obj.GetPropInt32(-614787111));
        end

        function set.LoopbackTest(obj, newVal)
            obj.LoopbackTest = newVal;
            obj.SetPropInt32(-614787111, newVal);
        end

        function result = get_refreshRate(obj)
            % Returns the desired refresh rate, measured in Hz.
            % The higher the refresh rate is set, the higher the
            % communication speed on the chain will be.
            %
            % @return an integer corresponding to the desired refresh rate, measured in Hz
            %
            % On failure, throws an exception or returns YInputChain.REFRESHRATE_INVALID.
            result = obj.InvokeMethod_D(-1961964339);
        end

        function set_refreshRate(obj, newVal)
            % Changes the desired refresh rate, measured in Hz.
            % The higher the refresh rate is set, the higher the
            % communication speed on the chain will be.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the desired refresh rate, measured in Hz
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-734440777, newVal);
        end

        function result = get.RefreshRate(obj)
            result = obj.GetPropInt32(511122244);
        end

        function set.RefreshRate(obj, newVal)
            obj.RefreshRate = newVal;
            obj.SetPropInt32(511122244, newVal);
        end

        function result = get_bitChain1(obj)
            % Returns the state of input 1 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 1 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN1_INVALID.
            result = obj.InvokeMethod_S(-1008359006);
        end

        function result = get_bitChain2(obj)
            % Returns the state of input 2 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 2 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN2_INVALID.
            result = obj.InvokeMethod_S(-1046276101);
        end

        function result = get_bitChain3(obj)
            % Returns the state of input 3 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 3 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN3_INVALID.
            result = obj.InvokeMethod_S(-1067352628);
        end

        function result = get_bitChain4(obj)
            % Returns the state of input 4 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 4 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN4_INVALID.
            result = obj.InvokeMethod_S(-986813623);
        end

        function result = get_bitChain5(obj)
            % Returns the state of input 5 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 5 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN5_INVALID.
            result = obj.InvokeMethod_S(-991166082);
        end

        function result = get_bitChain6(obj)
            % Returns the state of input 6 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 6 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN6_INVALID.
            result = obj.InvokeMethod_S(-961888473);
        end

        function result = get_bitChain7(obj)
            % Returns the state of input 7 for all nodes of the input chain,
            % as a hexadecimal string. The node nearest to the controller
            % is the lowest bit of the result.
            %
            % @return a string corresponding to the state of input 7 for all nodes of the input chain,
            %         as a hexadecimal string
            %
            % On failure, throws an exception or returns YInputChain.BITCHAIN7_INVALID.
            result = obj.InvokeMethod_S(-949431024);
        end

        function result = get_watchdogPeriod(obj)
            % Returns the wait time in seconds before triggering an inactivity
            % timeout error.
            %
            % @return an integer corresponding to the wait time in seconds before triggering an inactivity
            %         timeout error
            %
            % On failure, throws an exception or returns YInputChain.WATCHDOGPERIOD_INVALID.
            result = obj.InvokeMethod_D(-1414386645);
        end

        function set_watchdogPeriod(obj, newVal)
            % Changes the wait time in seconds before triggering an inactivity
            % timeout error. Remember to call the saveToFlash() method
            % of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the wait time in seconds before triggering an inactivity
            %         timeout error
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1056394399, newVal);
        end

        function result = get.WatchdogPeriod(obj)
            result = obj.GetPropInt32(1506918392);
        end

        function set.WatchdogPeriod(obj, newVal)
            obj.WatchdogPeriod = newVal;
            obj.SetPropInt32(1506918392, newVal);
        end

        function result = get_chainDiags(obj)
            % Returns the controller state diagnostics. Bit 0 indicates a chain length
            % error, bit 1 indicates an inactivity timeout and bit 2 indicates
            % a loopback test failure.
            %
            % @return an integer corresponding to the controller state diagnostics
            %
            % On failure, throws an exception or returns YInputChain.CHAINDIAGS_INVALID.
            result = obj.InvokeMethod_D(-1109019444);
        end

        function result = resetWatchdog(obj)
            % Resets the application watchdog countdown.
            % If you have setup a non-zero watchdogPeriod, you should
            % call this function on a regular basis to prevent the application
            % inactivity error to be triggered.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-527581151);
        end

        function result = get_lastEvents(obj)
            % Returns a string with last events observed on the digital input chain.
            % This method return only events that are still buffered in the device memory.
            %
            % @return a string with last events observed (one per line).
            %
            % On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_S(1709506988);
        end

        % //--- (end of YInputChain accessors declaration)
    end
end
