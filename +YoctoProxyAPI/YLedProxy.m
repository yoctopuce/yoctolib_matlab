% YLedProxy: monochrome LED control interface, available for instance in the Yocto-Buzzer, the
% YoctoBox-Short-Thin-Black-Prox, the YoctoBox-Short-Thin-Transp or the
% YoctoBox-Short-Thin-Transp-Prox
% 
% The YLedProxy class allows you to drive a monocolor LED. You can not only to drive the intensity of
% the LED, but also to have it blink at various preset frequencies.

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


% //--- (YLed declaration)
classdef YLedProxy < YoctoProxyAPI.YFunctionProxy
    % YLedProxy: monochrome LED control interface, available for instance in the Yocto-Buzzer, the
    % YoctoBox-Short-Thin-Black-Prox, the YoctoBox-Short-Thin-Transp or the
    % YoctoBox-Short-Thin-Transp-Prox
    % 
    % The YLedProxy class allows you to drive a monocolor LED. You can not only to drive the intensity of
    % the LED, but also to have it blink at various preset frequencies.

    properties (Transient, Nontunable)
        % Luminosity Current LED intensity (in per cent)
        Luminosity (1,1) int32
        % Blinking Current LED signaling mode
        Blinking (1,1) YoctoProxyAPI.EnumBlinking
        % Power Current LED state
        Power (1,1) YoctoProxyAPI.EnumPower
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YLed declaration)

    % //--- (YLed implementation)
    methods (Hidden)
        function obj = YLedProxy()
            % YLedProxy For internal use as System Object.
            % Use FindLed() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -728459499;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindLed(func)
            % FindLed Retrieve instances of YLedProxy
            obj = YoctoProxyAPI.YLedProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindLed to obtain an object
            % that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-728459499);
        end
    end
    % //--- (end of YLed implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YLedProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Led');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Led', ...
                'PropertyList', {'Blinking','Luminosity'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Led settings', ...
                'PropertyList', {'Power'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(-922969687, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'Blinking';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YLed accessors declaration)

        function result = get_power(obj)
            % Returns the current LED state.
            %
            % @return either YLed.POWER_OFF or YLed.POWER_ON, according to the current LED state
            %
            % On failure, throws an exception or returns YLed.POWER_INVALID.
            result = YoctoProxyAPI.EnumPower(obj.InvokeMethod_D(1304993974));
        end

        function set_power(obj, newVal)
            % Changes the state of the LED.
            %
            % @param newval : either YLed.POWER_OFF or YLed.POWER_ON, according to the state of the LED
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1753823031, newVal);
        end

        function result = get_luminosity(obj)
            % Returns the current LED intensity (in per cent).
            %
            % @return an integer corresponding to the current LED intensity (in per cent)
            %
            % On failure, throws an exception or returns YLed.LUMINOSITY_INVALID.
            result = obj.InvokeMethod_D(-1600964606);
        end

        function set_luminosity(obj, newVal)
            % Changes the current LED intensity (in per cent). Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the current LED intensity (in per cent)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1444189485, newVal);
        end

        function result = get.Luminosity(obj)
            result = obj.GetPropInt32(-43863649);
        end

        function set.Luminosity(obj, newVal)
            obj.Luminosity = newVal;
            obj.SetPropInt32(-43863649, newVal);
        end

        function result = get_blinking(obj)
            % Returns the current LED signaling mode.
            %
            % @return a value among YLed.BLINKING_STILL, YLed.BLINKING_RELAX, YLed.BLINKING_AWARE,
            % YLed.BLINKING_RUN, YLed.BLINKING_CALL and YLed.BLINKING_PANIC corresponding to the
            % current LED signaling mode
            %
            % On failure, throws an exception or returns YLed.BLINKING_INVALID.
            result = YoctoProxyAPI.EnumBlinking(obj.InvokeMethod_D(-1325924355));
        end

        function set_blinking(obj, newVal)
            % Changes the current LED signaling mode.
            %
            % @param newval : a value among YLed.BLINKING_STILL, YLed.BLINKING_RELAX,
            % YLed.BLINKING_AWARE, YLed.BLINKING_RUN, YLed.BLINKING_CALL and YLed.BLINKING_PANIC
            % corresponding to the current LED signaling mode
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-192451518, newVal);
        end

        function result = get.Blinking(obj)
            result = YoctoProxyAPI.EnumBlinking(obj.GetPropInt32(-922969687));
        end

        function set.Blinking(obj, newVal)
            obj.Blinking = newVal;
            obj.SetPropInt32(-922969687, newVal);
        end

        function result = get.Power(obj)
            result = YoctoProxyAPI.EnumPower(obj.GetPropInt32(1783312036));
        end

        function set.Power(obj, newVal)
            obj.Power = newVal;
            obj.SetPropInt32(1783312036, newVal);
        end

        % //--- (end of YLed accessors declaration)
    end
end
