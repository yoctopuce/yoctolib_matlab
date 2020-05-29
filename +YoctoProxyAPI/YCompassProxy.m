% YCompassProxy: compass function control interface, available for instance in the Yocto-3D-V2
% 
% The YCompassProxy class allows you to read and configure Yoctopuce compass functions. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger.

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


% //--- (YCompass declaration)
classdef YCompassProxy < YoctoProxyAPI.YSensorProxy
    % YCompassProxy: compass function control interface, available for instance in the Yocto-3D-V2
    % 
    % The YCompassProxy class allows you to read and configure Yoctopuce compass functions. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger.

    properties (Transient, Nontunable)
        % Bandwidth Measure update frequency, measured in Hz (Yocto-3D-V2 only)
        Bandwidth (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YCompass declaration)

    % //--- (YCompass implementation)
    methods (Hidden)
        function obj = YCompassProxy()
            % YCompassProxy For internal use as System Object.
            % Use FindCompass() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1615088175;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindCompass(func)
            % FindCompass Retrieve instances of YCompassProxy
            obj = YoctoProxyAPI.YCompassProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindCompass to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1615088175);
        end
    end
    % //--- (end of YCompass implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YCompassProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Compass');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Compass', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Compass settings', ...
                'PropertyList', {'Bandwidth'});
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
        % //--- (YCompass accessors declaration)

        function result = get_bandwidth(obj)
            % Returns the measure update frequency, measured in Hz (Yocto-3D-V2 only).
            %
            % @return an integer corresponding to the measure update frequency, measured in Hz (Yocto-3D-V2 only)
            %
            % On failure, throws an exception or returns Y_BANDWIDTH_INVALID.
            result = obj.InvokeMethod_D(1075889934);
        end

        function set_bandwidth(obj, newVal)
            % Changes the measure update frequency, measured in Hz (Yocto-3D-V2 only). When the
            % frequency is lower, the device performs averaging.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the measure update frequency, measured in
            % Hz (Yocto-3D-V2 only)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1253040662, newVal);
        end

        function result = get.Bandwidth(obj)
            result = obj.GetPropInt32(150493132);
        end

        function set.Bandwidth(obj, newVal)
            obj.Bandwidth = newVal;
            obj.SetPropInt32(150493132, newVal);
        end

        function result = get_magneticHeading(obj)
            % Returns the magnetic heading, regardless of the configured bearing.
            %
            % @return a floating point number corresponding to the magnetic heading, regardless of
            % the configured bearing
            %
            % On failure, throws an exception or returns Y_MAGNETICHEADING_INVALID.
            result = obj.InvokeMethod_F(307985188);
        end

        % //--- (end of YCompass accessors declaration)
    end
end
