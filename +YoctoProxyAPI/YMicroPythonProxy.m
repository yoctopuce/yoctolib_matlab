% YMicroPythonProxy: MicroPython interpreter control interface
% 
% The YMicroPythonProxy class provides control of the MicroPython interpreter that can be found on
% some Yoctopuce devices.

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


% //--- (YMicroPython declaration)
classdef YMicroPythonProxy < YoctoProxyAPI.YFunctionProxy
    % YMicroPythonProxy: MicroPython interpreter control interface
    % 
    % The YMicroPythonProxy class provides control of the MicroPython interpreter that can be found on
    % some Yoctopuce devices.

    properties (Transient, Nontunable)
        % StartupScript Name of the script to run when the device is powered on
        StartupScript (1,:) char
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YMicroPython declaration)

    % //--- (YMicroPython implementation)
    methods (Hidden)
        function obj = YMicroPythonProxy()
            % YMicroPythonProxy For internal use as System Object.
            % Use FindMicroPython() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1082736365;
        end
    end

    methods (Static)
        function obj = FindMicroPython(func)
            % FindMicroPython Retrieve instances of YMicroPythonProxy
            obj = YoctoProxyAPI.YMicroPythonProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindMicroPython to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1082736365);
        end
    end
    % //--- (end of YMicroPython implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YMicroPythonProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'MicroPython');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'MicroPython', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'MicroPython settings', ...
                'PropertyList', {'StartupScript'});
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
        % //--- (YMicroPython accessors declaration)

        function result = get_lastMsg(obj)
            % Returns the last message produced by a python script.
            %
            % @return a string corresponding to the last message produced by a python script
            %
            % On failure, throws an exception or returns YMicroPython.LASTMSG_INVALID.
            result = obj.InvokeMethod_S(2062820646);
        end

        function result = get_heapUsage(obj)
            % Returns the percentage of micropython main memory in use,
            % as observed at the end of the last garbage collection.
            %
            % @return an integer corresponding to the percentage of micropython main memory in use,
            %         as observed at the end of the last garbage collection
            %
            % On failure, throws an exception or returns YMicroPython.HEAPUSAGE_INVALID.
            result = obj.InvokeMethod_D(-187227414);
        end

        function result = get_xheapUsage(obj)
            % Returns the percentage of micropython external memory in use,
            % as observed at the end of the last garbage collection.
            %
            % @return an integer corresponding to the percentage of micropython external memory in use,
            %         as observed at the end of the last garbage collection
            %
            % On failure, throws an exception or returns YMicroPython.XHEAPUSAGE_INVALID.
            result = obj.InvokeMethod_D(1612887296);
        end

        function result = get_currentScript(obj)
            % Returns the name of currently active script, if any.
            %
            % @return a string corresponding to the name of currently active script, if any
            %
            % On failure, throws an exception or returns YMicroPython.CURRENTSCRIPT_INVALID.
            result = obj.InvokeMethod_S(-2121681579);
        end

        function set_currentScript(obj, newVal)
            % Stops current running script, and/or selects a script to run immediately in a
            % fresh new environment. If the MicroPython interpreter is busy running a script,
            % this function will abort it immediately and reset the execution environment.
            % If a non-empty string is given as argument, the new script will be started.
            %
            % @param newval : a string
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1087218549, newVal);
        end

        function result = get_startupScript(obj)
            % Returns the name of the script to run when the device is powered on.
            %
            % @return a string corresponding to the name of the script to run when the device is powered on
            %
            % On failure, throws an exception or returns YMicroPython.STARTUPSCRIPT_INVALID.
            result = obj.InvokeMethod_S(-1124912800);
        end

        function set_startupScript(obj, newVal)
            % Changes the script to run when the device is powered on.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the script to run when the device is powered on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(2109155136, newVal);
        end

        function result = get.StartupScript(obj)
            result = obj.GetPropString(-253344446);
        end

        function set.StartupScript(obj, newVal)
            obj.StartupScript = newVal;
            obj.SetPropString(-253344446, newVal);
        end

        function result = get_debugMode(obj)
            % Returns the activation state of micropython debugging interface.
            %
            % @return either YMicroPython.DEBUGMODE_OFF or YMicroPython.DEBUGMODE_ON, according to
            % the activation state of micropython debugging interface
            %
            % On failure, throws an exception or returns YMicroPython.DEBUGMODE_INVALID.
            result = YoctoProxyAPI.EnumDebugMode(obj.InvokeMethod_D(598294949));
        end

        function set_debugMode(obj, newVal)
            % Changes the activation state of micropython debugging interface.
            %
            % @param newval : either YMicroPython.DEBUGMODE_OFF or YMicroPython.DEBUGMODE_ON,
            % according to the activation state of micropython debugging interface
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-690382015, newVal);
        end

        function result = eval(obj, codeName, mpyCode)
            % Submit MicroPython code for execution in the interpreter.
            % If the MicroPython interpreter is busy, this function will
            % block until it becomes available. The code is then uploaded,
            % compiled and executed on the fly, without beeing stored on the device filesystem.
            %
            % There is no implicit reset of the MicroPython interpreter with
            % this function. Use method reset() if you need to start
            % from a fresh environment to run your code.
            %
            % Note that although MicroPython is mostly compatible with recent Python 3.x
            % interpreters, the limited ressources on the device impose some restrictions,
            % in particular regarding the libraries that can be used. Please refer to
            % the documentation for more details.
            %
            % @param codeName : name of the code file (used for error reporting only)
            % @param mpyCode : MicroPython code to compile and execute
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(-1005002161, codeName, mpyCode);
        end

        function result = reset(obj)
            % Stops current execution, and reset the MicroPython interpreter to initial state.
            % All global variables are cleared, and all imports are forgotten.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        function result = get_lastLogs(obj)
            % Returns a string with last logs of the MicroPython interpreter.
            % This method return only logs that are still in the module.
            %
            % @return a string with last MicroPython logs.
            %         On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_S(28952501);
        end

        % //--- (end of YMicroPython accessors declaration)
    end
end
