% YLongitudeProxy: longitude sensor control interface, available for instance in the Yocto-GPS-V2
% 
% The YLongitudeProxy class allows you to read and configure Yoctopuce longitude sensors. It inherits
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


% //--- (YLongitude declaration)
classdef YLongitudeProxy < YoctoProxyAPI.YSensorProxy
    % YLongitudeProxy: longitude sensor control interface, available for instance in the Yocto-GPS-V2
    % 
    % The YLongitudeProxy class allows you to read and configure Yoctopuce longitude sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measures, to register callback functions,
    % and to access the autonomous datalogger.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YLongitude declaration)

    % //--- (YLongitude implementation)
    methods (Hidden)
        function obj = YLongitudeProxy()
            % YLongitudeProxy For internal use as System Object.
            % Use FindLongitude() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 118549960;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindLongitude(func)
            % FindLongitude Retrieve instances of YLongitudeProxy
            obj = YoctoProxyAPI.YLongitudeProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindLongitude to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(118549960);
        end
    end
    % //--- (end of YLongitude implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YLongitudeProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Longitude');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Longitude', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Longitude settings', ...
                'PropertyList', {});
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
        % //--- (YLongitude accessors declaration)

        % //--- (end of YLongitude accessors declaration)
    end
end
