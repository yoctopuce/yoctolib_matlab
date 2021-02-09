% YDaisyChainProxy: Module chain configuration interface
% 
% The YDaisyChainProxy class can be used to verify that devices that are daisy-chained directly from
% device to device, without a hub, are detected properly.

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


% //--- (YDaisyChain declaration)
classdef YDaisyChainProxy < YoctoProxyAPI.YFunctionProxy
    % YDaisyChainProxy: Module chain configuration interface
    % 
    % The YDaisyChainProxy class can be used to verify that devices that are daisy-chained directly from
    % device to device, without a hub, are detected properly.

    properties (Transient, Nontunable)
        % RequiredChildCount Number of child nodes expected in normal conditions
        RequiredChildCount (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YDaisyChain declaration)

    % //--- (YDaisyChain implementation)
    methods (Hidden)
        function obj = YDaisyChainProxy()
            % YDaisyChainProxy For internal use as System Object.
            % Use FindDaisyChain() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1221871689;
        end
    end

    methods (Static)
        function obj = FindDaisyChain(func)
            % FindDaisyChain Retrieve instances of YDaisyChainProxy
            obj = YoctoProxyAPI.YDaisyChainProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindDaisyChain to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1221871689);
        end
    end
    % //--- (end of YDaisyChain implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YDaisyChainProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'DaisyChain');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'DaisyChain', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'DaisyChain settings', ...
                'PropertyList', {'RequiredChildCount'});
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
        % //--- (YDaisyChain accessors declaration)

        function result = get_daisyState(obj)
            % Returns the state of the daisy-link between modules.
            %
            % @return a value among YDaisyChain.DAISYSTATE_READY, YDaisyChain.DAISYSTATE_IS_CHILD,
            % YDaisyChain.DAISYSTATE_FIRMWARE_MISMATCH, YDaisyChain.DAISYSTATE_CHILD_MISSING and
            % YDaisyChain.DAISYSTATE_CHILD_LOST corresponding to the state of the daisy-link between modules
            %
            % On failure, throws an exception or returns YDaisyChain.DAISYSTATE_INVALID.
            result = YoctoProxyAPI.EnumDaisyState(obj.InvokeMethod_D(-1455339687));
        end

        function result = get_childCount(obj)
            % Returns the number of child nodes currently detected.
            %
            % @return an integer corresponding to the number of child nodes currently detected
            %
            % On failure, throws an exception or returns YDaisyChain.CHILDCOUNT_INVALID.
            result = obj.InvokeMethod_D(-1950607263);
        end

        function result = get_requiredChildCount(obj)
            % Returns the number of child nodes expected in normal conditions.
            %
            % @return an integer corresponding to the number of child nodes expected in normal conditions
            %
            % On failure, throws an exception or returns YDaisyChain.REQUIREDCHILDCOUNT_INVALID.
            result = obj.InvokeMethod_D(-273398591);
        end

        function set_requiredChildCount(obj, newVal)
            % Changes the number of child nodes expected in normal conditions.
            % If the value is zero, no check is performed. If it is non-zero, the number
            % child nodes is checked on startup and the status will change to error if
            % the count does not match. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the number of child nodes expected in normal conditions
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1028160149, newVal);
        end

        function result = get.RequiredChildCount(obj)
            result = obj.GetPropInt32(-1652825674);
        end

        function set.RequiredChildCount(obj, newVal)
            obj.RequiredChildCount = newVal;
            obj.SetPropInt32(-1652825674, newVal);
        end

        % //--- (end of YDaisyChain accessors declaration)
    end
end
