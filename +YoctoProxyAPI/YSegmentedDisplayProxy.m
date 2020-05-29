% YSegmentedDisplayProxy: segmented display control interface
% 
% The <tt>SegmentedDisplay</tt> class allows you to drive segmented displays.

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


% //--- (YSegmentedDisplay declaration)
classdef YSegmentedDisplayProxy < YoctoProxyAPI.YFunctionProxy
    % YSegmentedDisplayProxy: segmented display control interface
    % 
    % The <tt>SegmentedDisplay</tt> class allows you to drive segmented displays.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YSegmentedDisplay declaration)

    % //--- (YSegmentedDisplay implementation)
    methods (Hidden)
        function obj = YSegmentedDisplayProxy()
            % YSegmentedDisplayProxy For internal use as System Object.
            % Use FindSegmentedDisplay() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1913115059;
        end
    end

    methods (Static)
        function obj = FindSegmentedDisplay(func)
            % FindSegmentedDisplay Retrieve instances of YSegmentedDisplayProxy
            obj = YoctoProxyAPI.YSegmentedDisplayProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindSegmentedDisplay to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1913115059);
        end
    end
    % //--- (end of YSegmentedDisplay implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YSegmentedDisplayProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'SegmentedDisplay');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'SegmentedDisplay', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'SegmentedDisplay settings', ...
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
        % //--- (YSegmentedDisplay accessors declaration)

        function result = get_displayedText(obj)
            % Returns the text currently displayed on the screen.
            %
            % @return a string corresponding to the text currently displayed on the screen
            %
            % On failure, throws an exception or returns Y_DISPLAYEDTEXT_INVALID.
            result = obj.InvokeMethod_S(1272944122);
        end

        function set_displayedText(obj, newVal)
            % Changes the text currently displayed on the screen.
            %
            % @param newval : a string corresponding to the text currently displayed on the screen
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1969519654, newVal);
        end

        % //--- (end of YSegmentedDisplay accessors declaration)
    end
end
