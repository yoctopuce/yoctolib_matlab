% YQtProxy: Base interface to access quaternion components, available for instance in the Yocto-3D-V2
% 
% The YQtProxy class provides direct access to the 3D attitude estimation provided by Yoctopuce
% inertial sensors. The four instances of YQtProxy provide direct access to the individual quaternion
% components representing the orientation. It is usually not needed to use the YQtProxy class
% directly, as the <tt>YGyro</tt> class provides a more convenient higher-level interface.

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


% //--- (YQt declaration)
classdef YQtProxy < YoctoProxyAPI.YSensorProxy
    % YQtProxy: Base interface to access quaternion components, available for instance in the Yocto-3D-V2
    % 
    % The YQtProxy class provides direct access to the 3D attitude estimation provided by Yoctopuce
    % inertial sensors. The four instances of YQtProxy provide direct access to the individual quaternion
    % components representing the orientation. It is usually not needed to use the YQtProxy class
    % directly, as the <tt>YGyro</tt> class provides a more convenient higher-level interface.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YQt declaration)

    % //--- (YQt implementation)
    methods (Hidden)
        function obj = YQtProxy()
            % YQtProxy For internal use as System Object.
            % Use FindQt() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1257124913;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindQt(func)
            % FindQt Retrieve instances of YQtProxy
            obj = YoctoProxyAPI.YQtProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindQt to obtain an object
            % that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1257124913);
        end
    end
    % //--- (end of YQt implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YQtProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Qt');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Qt', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Qt settings', ...
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
        % //--- (YQt accessors declaration)

        % //--- (end of YQt accessors declaration)
    end
end
