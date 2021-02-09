% YFunctionProxy: Common function interface
% 
% This is the parent class for all public objects representing device
% functions documented in the high-level programming API. This abstract
% class does all the real job, but without knowledge of the specific
% function attributes.
% 
% Instantiating a child class of YFunction does not cause any
% communication. The instance simply keeps track of its function
% identifier, and will dynamically bind to a matching device at the time
% it is really being used to read or set an attribute. In order to allow
% true hot-plug replacement of one device by another, the binding stay
% dynamic through the life of the object.
% 
% The YFunction class implements a generic high-level cache for the
% attribute values of the specified function, pre-parsed from the REST
% API string.

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

% //--- (generated code: YFunction declaration)
classdef YFunctionProxy < matlab.System
    % YFunctionProxy: Common function interface
    % 
    % This is the parent class for all public objects representing device functions documented in the
    % high-level programming API. This abstract class does all the real job, but without knowledge of the
    % specific function attributes.
    % 
    % Instantiating a child class of YFunction does not cause any communication. The instance simply
    % keeps track of its function identifier, and will dynamically bind to a matching device at the time
    % it is really being used to read or set an attribute. In order to allow true hot-plug replacement of
    % one device by another, the binding stay dynamic through the life of the object.
    % 
    % The YFunction class implements a generic high-level cache for the attribute values of the specified
    % function, pre-parsed from the REST API string.

    properties (Transient, Nontunable)
        % LogicalName Logical name of the function
        LogicalName (1,:) char
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of generated code: YFunction declaration)
    
    properties (Transient, Nontunable)
        % TargetFunction Logical name or ID of the desired device function
        TargetFunction (1,:) char
    end
    
    properties (Transient, Nontunable, SetAccess = private)
        % ClassName Class of the device function object
        ClassName (1,:) char
        % SerialNumber Immutable serial number of the device
        SerialNumber (1,:) char
        % FunctionId Identifier of the function within the device
        FunctionId (1,:) char
        % HardwareId Unique hardware identifier of the function
        HardwareId (1,:) char
        % FriendlyName Global identifier of the function
        FriendlyName (1,:) char
        % IsOnline Tells if the function is currently reachable
        IsOnline (1,1) logical
        % AdvertisedValue Short string representing the current state
        AdvertisedValue (1,:) char
    end
    
    % System Object support
    properties (Hidden, Nontunable)
        % Requested target function
        reqTargetFunction (1,:) char
        % Number of inputs for stepImpl function
        numInputs (1,1) int32 = 0
        % Number of outputs for stepImpl function
        numOutputs (1,1) int32 = 0
    end
    
    properties (Hidden, Nontunable, SetAccess = protected)
        classHandle (1,1) int32
    end

    properties (Hidden, Transient, Nontunable, SetAccess = protected)
        funcHandle (1,1) int32 = 0
    end

    methods (Hidden, Static, Access = protected)
        function funcHandle = YpaFind(classHandle, name)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ resCode, ~, errmsg, ~, pRes ] = calllib('ypa', 'ypaFind', classHandle, char(name), ...
                blanks(256), SizePtr(256), libpointer('int32Ptr',0));
            if resCode ~= 0
                ME = MException('YFunctionProxy:ypaFind', errmsg);
                throw(ME)
            end
            funcHandle = pRes;
        end
        
        function list = YpaGetSimilarFunctions(classHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaGetSimilarFunctions', classHandle, ...
                blanks(256), SizePtr(256), blanks(4096), SizePtr(4096));
            if resCode ~= 0
                ME = MException('YFunctionProxy:ypaGetSimilarFunctions', errmsg);
                throw(ME)
            end
            list = transpose(regexp(pRes, '\|', 'split'));
        end
    end
    
    methods(Static, Access = protected)
        function header = getHeaderImpl()
            header = matlab.system.display.Header(...
                'YoctoProxyAPI.YFunctionProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'YFunction');
        end
      
        function groups = getPropertyGroupsImpl()
            identGroup = matlab.system.display.Section(...
                'Title','Identification',...
                'PropertyList',{'TargetFunction','HardwareId','FriendlyName'});
            groups = matlab.system.display.SectionGroup(...
                'Title', 'General', ...
                'Sections', identGroup);
        end
        
        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end
        
        function isVisible = showSimulateUsingImpl()
            isVisible = false;
        end
    end

    % System Object support methods
    methods (Hidden, Access = protected)
        % System object icon text
        function icon = getIconImpl(obj)
            % For now, define a string as the icon for the System block
            icon = sprintf('%s\n%s', obj.ClassName, obj.TargetFunction);
        end
        
        % System object setup: assign the handle to the selected target function
        function setupImpl(obj)
            obj.funcHandle = 0;
        end

        % Reassign the handle to the target function
        function resetImpl(obj)
            obj.funcHandle = 0;
        end
        
        % Returns the number of inputs desired for the system object
        function numIn = getNumInputsImpl(obj)
            numIn = obj.numInputs;
        end

        % Returns the number of inputs desired for the system object
        function numOut = getNumOutputsImpl(obj)
            numOut = obj.numOutputs;
        end

        % further support methods for Simulink
        function flag = isOutputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isOutputFixedSizeImpl(~)
            varargout = cell(1,nargout);
            for k = 1:nargout
                varargout{k} = true;
            end            
        end
        
        function flag = isOutputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isOutputComplexImpl(~)
            varargout = cell(1,nargout);
            for k = 1:nargout
                varargout{k} = false;
            end            
        end
        
        function varargout = getOutputSizeImpl(~)
            varargout = cell(1,nargout);
            for k = 1:nargout
                varargout{k} = [1,1];
            end            
        end        
    end
    
    % //--- (generated code: YFunction implementation)
    methods (Hidden)
        function obj = YFunctionProxy()
            % YFunctionProxy For internal use, do not invoke directly.
            % Use FindFunction() instead.
            obj.classHandle = 869823595;
        end
    end

    methods (Static, Hidden)
        function obj = FindFunction(func)
            % FindFunction Retrieve instances of YFunctionProxy
            obj = YoctoProxyAPI.YFunctionProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindFunction to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(869823595);
        end
    end
    % //--- (end of generated code: YFunction implementation)

    % C linkage functions
    methods(Hidden, Access = protected)
        function result = GetPropInt32(obj, propHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaGetPropInt32', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), libpointer('int32Ptr', int32(0)));
                if resCode ~= 0
                    warning(errmsg);
                end
                result = pRes;
            end
        end
        
        function result = GetPropInt64(obj, propHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaGetPropInt64', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), libpointer('int64Ptr', int64(0)));
                if resCode ~= 0
                    warning(errmsg);
                end
                result = pRes;
            end
        end
        
        function result = GetPropDouble(obj, propHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = NaN;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaGetPropDouble', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), libpointer('doublePtr', double(0)));
                if resCode ~= 0
                    warning(errmsg);
                end
                result = pRes;
            end
        end
       
        function result = GetPropString(obj, propHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = '';
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaGetPropStr', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), blanks(512), SizePtr(512));
                if resCode ~= 0
                    warning(errmsg);
                end
                result = pRes;
            end
        end
        
        function SetPropInt32(obj, propHandle, newVal)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle ~= 0
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaSetPropInt32', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), int32(newVal));
                if resCode ~= 0
                    warning(errmsg);
                end
            end
        end
        
        function SetPropInt64(obj, propHandle, newVal)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle ~= 0
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaSetPropInt64', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), int64(newVal));
                if resCode ~= 0
                    warning(errmsg);
                end
            end
        end
        
        function SetPropDouble(obj, propHandle, newVal)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle ~= 0
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaSetPropDouble', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), double(newVal));
                if resCode ~= 0
                    warning(errmsg);
                end
            end
        end
       
        function SetPropString(obj, propHandle, newVal)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle ~= 0
                [ resCode, errmsg, ~, ~ ] = calllib('ypa', 'ypaSetPropStr', obj.funcHandle, propHandle, ...
                    blanks(256), SizePtr(256), newVal);
                if resCode ~= 0
                    warning(errmsg);
                end
            end
        end
        
        function result = InvokeMethod_(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        % //--- (generated code: YFunction yapiwrapper)

        function result = InvokeMethod_S(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_S', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_S', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_D(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_D', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_D', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_d(obj, methodHandle, arg1)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_d', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    int32(arg1));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_d', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Q(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Q', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int64Ptr', int64(0)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Q', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ssb(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Ssb', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2, int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ssb', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Hsb(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Hsb', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2, int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Hsb', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Hs(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Hs', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Hs', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ds(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Ds', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ds', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Bs(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Bs', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Bs', errmsg);
                    throw(ME)
                end
                result = (pRes ~= 0);
            end
        end

        function result = InvokeMethod_xSs(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xSs', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xSs', errmsg);
                    throw(ME)
                end
                result = transpose(regexp(pRes, '\|', 'split'));
            end
        end

        function result = InvokeMethod_Ss(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Ss', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ss', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xS(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xS', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xS', errmsg);
                    throw(ME)
                end
                result = transpose(regexp(pRes, '\|', 'split'));
            end
        end

        function result = InvokeMethod_s(obj, methodHandle, arg1)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_s', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    arg1);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_s', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Dss(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dss', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2, arg3);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dss', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Db(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Db', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Db', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Ddd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddddd(obj, methodHandle, arg2, arg3, arg4, arg5)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Ddddd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), int32(arg4), int32(arg5));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddddd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dddd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dddd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), int32(arg4));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dddd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dddds(obj, methodHandle, arg2, arg3, arg4, arg5)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dddds', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), int32(arg4), arg5);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dddds', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddds(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Ddds', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), arg4);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddds', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddddsd(obj, methodHandle, arg2, arg3, arg4, arg5, arg6)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Ddddsd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), int32(arg4), arg5, int32(arg6));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddddsd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_H(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_H', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_H', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_F(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_F', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('doublePtr', double(0)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_F', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_f(obj, methodHandle, arg1)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_f', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    double(arg1));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_f', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Fss(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Fss', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('doublePtr', double(0)), arg2, arg3);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Fss', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dsxfxf(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dsxfxf', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2, libpointer('doublePtr', double(arg3)), SizeT(length(arg3)), libpointer('doublePtr', double(arg4)), SizeT(length(arg4)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dsxfxf', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_dd(obj, methodHandle, arg1, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_dd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    int32(arg1), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_dd', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Dds(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dds', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), arg3);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dds', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddxd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Ddxd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), libpointer('int32Ptr', int32(arg3)), SizeT(length(arg3)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddxd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Ddxdd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Ddxdd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), libpointer('int32Ptr', int32(arg3)), SizeT(length(arg3)), int32(arg4));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ddxdd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dxdd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dxdd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), libpointer('int32Ptr', int32(arg2)), SizeT(length(arg2)), int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dxdd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Sdd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Sdd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), int32(arg2), int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Sdd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xDdd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount ] = calllib('ypa', 'ypaInvokeMethod_xDdd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2), int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDdd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_Dfd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dfd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), double(arg2), int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dfd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xSsd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xSsd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2, int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xSsd', errmsg);
                    throw(ME)
                end
                result = transpose(regexp(pRes, '\|', 'split'));
            end
        end

        function result = InvokeMethod_Ssd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Ssd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2, int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Ssd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Sdsd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Sdsd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), int32(arg2), arg3, int32(arg4));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Sdsd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xDdxdd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount, ~ ] = calllib('ypa', 'ypaInvokeMethod_xDdxdd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2), libpointer('int32Ptr', int32(arg3)), SizeT(length(arg3)), int32(arg4));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDdxdd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_Dxd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dxd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), libpointer('int32Ptr', int32(arg2)), SizeT(length(arg2)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dxd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dxf(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dxf', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), libpointer('doublePtr', double(arg2)), SizeT(length(arg2)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dxf', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dff(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dff', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), double(arg2), double(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dff', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_q(obj, methodHandle, arg1)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_q', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    int64(arg1));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_q', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Df(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Df', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), double(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Df', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Sd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Sd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Sd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xDd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount ] = calllib('ypa', 'ypaInvokeMethod_xDd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_xDdxd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount, ~ ] = calllib('ypa', 'ypaInvokeMethod_xDdxd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2), libpointer('int32Ptr', int32(arg3)), SizeT(length(arg3)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDdxd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_xDddd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount ] = calllib('ypa', 'ypaInvokeMethod_xDddd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2), int32(arg3), int32(arg4));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDddd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_Dddxd(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dddxd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2), int32(arg3), libpointer('int32Ptr', int32(arg4)), SizeT(length(arg4)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dddxd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xDddxddd(obj, methodHandle, arg2, arg3, arg4, arg5, arg6)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount, ~ ] = calllib('ypa', 'ypaInvokeMethod_xDddxddd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024), int32(arg2), int32(arg3), libpointer('int32Ptr', int32(arg4)), SizeT(length(arg4)), int32(arg5), int32(arg6));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xDddxddd', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_Dxfxf(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~, ~ ] = calllib('ypa', 'ypaInvokeMethod_Dxfxf', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), libpointer('doublePtr', double(arg2)), SizeT(length(arg2)), libpointer('doublePtr', double(arg3)), SizeT(length(arg3)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dxfxf', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_B(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_B', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_B', errmsg);
                    throw(ME)
                end
                result = (pRes ~= 0);
            end
        end

        function result = InvokeMethod_Hff(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Hff', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), double(arg2), double(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Hff', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xH(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount ] = calllib('ypa', 'ypaInvokeMethod_xH', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', zeros(1,1024,'int32')), SizeT(1024));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xH', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_ss(obj, methodHandle, arg1, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_ss', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    arg1, arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_ss', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Dsds(obj, methodHandle, arg2, arg3, arg4)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dsds', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2, int32(arg3), arg4);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dsds', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dsd(obj, methodHandle, arg2, arg3)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dsd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), arg2, int32(arg3));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dsd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_Dq(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Dq', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int64(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Dq', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xV(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xV', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xV', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xUs(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xUs', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), arg2);
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xUs', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xTd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, ~ ] = calllib('ypa', 'ypaInvokeMethod_xTd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    blanks(4096), SizePtr(4096), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xTd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        function result = InvokeMethod_xW(obj, methodHandle)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes, pCount ] = calllib('ypa', 'ypaInvokeMethod_xW', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('YWlanRecordStruct', zeros(1,1024,'int32')), SizeT(1024));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xW', errmsg);
                    throw(ME)
                end
                result = pRes(1:pCount);
            end
        end

        function result = InvokeMethod_xZd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_xZd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xZd', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_xYd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~ ] = calllib('ypa', 'ypaInvokeMethod_xYd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_xYd', errmsg);
                    throw(ME)
                end
                result = 0;
            end
        end

        function result = InvokeMethod_Hd(obj, methodHandle, arg2)
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            if obj.funcHandle == 0
                result = 0;
            else
                [ resCode, errmsg, ~, pRes ] = calllib('ypa', 'ypaInvokeMethod_Hd', ...
                    obj.funcHandle, methodHandle, blanks(256), SizePtr(256), ...
                    libpointer('int32Ptr', int32(0)), int32(arg2));
                if resCode ~= 0
                    ME = MException('YFunctionProxy:InvokeMethod_Hd', errmsg);
                    throw(ME)
                end
                result = pRes;
            end
        end

        % //--- (end of generated code: YFunction yapiwrapper)
        
    end
    
    methods
        function result = get.TargetFunction(obj)
            if isempty(obj.reqTargetFunction)
                result = '(any)';
            else
                result = obj.reqTargetFunction;
            end
        end

        function set.TargetFunction(obj, newVal)
            if strcmp(newVal, '(any)')
                newVal = '';
            end
            obj.reqTargetFunction = newVal;
            obj.funcHandle = YoctoProxyAPI.YFunctionProxy.YpaFind(obj.classHandle, obj.reqTargetFunction);
        end

        function funcHandle = get.funcHandle(obj)
            if obj.funcHandle == 0
                obj.funcHandle = YoctoProxyAPI.YFunctionProxy.YpaFind(obj.classHandle, obj.reqTargetFunction);
            end
            funcHandle = obj.funcHandle;
        end

        function result = get.ClassName(obj)
            result = obj.GetPropString(1191326365);
        end
        
        function result = get.SerialNumber(obj)
            result = obj.GetPropString(1667640262);
        end
        
        function result = get.FunctionId(obj)
            result = obj.GetPropString(-69437597);
        end
        
        function result = get.HardwareId(obj)
            result = obj.GetPropString(-498591861);
        end
        
        function result = get.FriendlyName(obj)
            result = obj.GetPropString(-671461928);
        end
        
        function result = get.IsOnline(obj)
            result = (obj.GetPropInt32(-1507010970) == 1);
        end
        
        function result = get.AdvertisedValue(obj)
            result = obj.GetPropString(1087298174);
        end

        % //--- (generated code: YFunction accessors declaration)

        function result = get_logicalName(obj)
            % Returns the logical name of the function.
            %
            % @return a string corresponding to the logical name of the function
            %
            % On failure, throws an exception or returns YFunction.LOGICALNAME_INVALID.
            result = obj.InvokeMethod_S(1376067556);
        end

        function set_logicalName(obj, newVal)
            % Changes the logical name of the function. You can use yCheckLogicalName()
            % prior to this call to make sure that your parameter is valid.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the logical name of the function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(221413790, newVal);
        end

        function result = get.LogicalName(obj)
            result = obj.GetPropString(-1694618581);
        end

        function set.LogicalName(obj, newVal)
            obj.LogicalName = newVal;
            obj.SetPropString(-1694618581, newVal);
        end

        function result = get_advertisedValue(obj)
            % Returns a short string representing the current state of the function.
            %
            % @return a string corresponding to a short string representing the current state of the function
            %
            % On failure, throws an exception or returns YFunction.ADVERTISEDVALUE_INVALID.
            result = obj.InvokeMethod_S(48074797);
        end

        function result = muteValueCallbacks(obj)
            % Disables the propagation of every new advertised value to the parent hub.
            % You can use this function to save bandwidth and CPU on computers with limited
            % resources, or to prevent unwanted invocations of the HTTP callback.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-3312338);
        end

        function result = unmuteValueCallbacks(obj)
            % Re-enables the propagation of every new advertised value to the parent hub.
            % This function reverts the effect of a previous call to muteValueCallbacks().
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1215838047);
        end

        function result = loadAttribute(obj, attrName)
            % Returns the current value of a single function attribute, as a text string, as quickly as
            % possible but without using the cached value.
            %
            % @param attrName : the name of the requested attribute
            %
            % @return a string with the value of the the attribute
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Ss(-930208480, attrName);
        end

        function result = isReadOnly(obj)
            % Test if the function is readOnly. Return true if the function is write protected
            % or that the function is not available.
            %
            % @return true if the function is readOnly or not online.
            result = obj.InvokeMethod_B(913241503);
        end

        function result = get_serialNumber(obj)
            % Returns the serial number of the module, as set by the factory.
            %
            % @return a string corresponding to the serial number of the module, as set by the factory.
            %
            % On failure, throws an exception or returns YFunction.SERIALNUMBER_INVALID.
            result = obj.InvokeMethod_S(-1800874479);
        end

        % //--- (end of generated code: YFunction accessors declaration)

    end
end

