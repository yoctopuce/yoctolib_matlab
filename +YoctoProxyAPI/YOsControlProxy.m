% YOsControlProxy: Operating system control interface via the VirtualHub application
% 
% The <tt>YOScontrol</tt> class provides some control over the operating system running a VirtualHub.
% YOsControl is available on VirtualHub software only. This feature must be activated at the
% VirtualHub start up with -o option.

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


% //--- (YOsControl declaration)
classdef YOsControlProxy < YoctoProxyAPI.YFunctionProxy
    % YOsControlProxy: Operating system control interface via the VirtualHub application
    % 
    % The <tt>YOScontrol</tt> class provides some control over the operating system running a VirtualHub.
    % YOsControl is available on VirtualHub software only. This feature must be activated at the
    % VirtualHub start up with -o option.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YOsControl declaration)

    % //--- (YOsControl implementation)
    methods (Hidden)
        function obj = YOsControlProxy()
            % YOsControlProxy For internal use as System Object.
            % Use FindOsControl() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 2063041698;
        end
    end

    methods (Static)
        function obj = FindOsControl(func)
            % FindOsControl Retrieve instances of YOsControlProxy
            obj = YoctoProxyAPI.YOsControlProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindOsControl to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(2063041698);
        end
    end
    % //--- (end of YOsControl implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YOsControlProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'OsControl');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'OsControl', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'OsControl settings', ...
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
        % //--- (YOsControl accessors declaration)

        function result = get_shutdownCountdown(obj)
            % Returns the remaining number of seconds before the OS shutdown, or zero when no
            % shutdown has been scheduled.
            %
            % @return an integer corresponding to the remaining number of seconds before the OS
            % shutdown, or zero when no
            %         shutdown has been scheduled
            %
            % On failure, throws an exception or returns Y_SHUTDOWNCOUNTDOWN_INVALID.
            result = obj.InvokeMethod_D(1163616040);
        end

        function result = shutdown(obj, secBeforeShutDown)
            % Schedules an OS shutdown after a given number of seconds.
            %
            % @param secBeforeShutDown : number of seconds before shutdown
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-215746767, secBeforeShutDown);
        end

        % //--- (end of YOsControl accessors declaration)
    end
end
