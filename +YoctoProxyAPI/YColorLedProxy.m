% YColorLedProxy: RGB LED control interface, available for instance in the Yocto-Color-V2, the
% Yocto-MaxiBuzzer or the Yocto-PowerColor
% 
% The <tt>ColorLed</tt> class allows you to drive a color LED. The color can be specified using RGB
% coordinates as well as HSL coordinates. The module performs all conversions form RGB to HSL
% automatically. It is then self-evident to turn on a LED with a given hue and to progressively vary
% its saturation or lightness. If needed, you can find more information on the difference between RGB
% and HSL in the section following this one.

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


% //--- (YColorLed declaration)
classdef YColorLedProxy < YoctoProxyAPI.YFunctionProxy
    % YColorLedProxy: RGB LED control interface, available for instance in the Yocto-Color-V2, the
    % Yocto-MaxiBuzzer or the Yocto-PowerColor
    % 
    % The <tt>ColorLed</tt> class allows you to drive a color LED. The color can be specified using RGB
    % coordinates as well as HSL coordinates. The module performs all conversions form RGB to HSL
    % automatically. It is then self-evident to turn on a LED with a given hue and to progressively vary
    % its saturation or lightness. If needed, you can find more information on the difference between RGB
    % and HSL in the section following this one.

    properties (Transient, Nontunable)
        % RgbColor Current RGB color of the LED
        RgbColor (1,1) int32
        % HslColor Current HSL color of the LED
        HslColor (1,1) int32
        % RgbColorAtPowerOn Configured color to be displayed when the module is turned on
        RgbColorAtPowerOn (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % BlinkSeqMaxSize Maximum length of the blinking sequence
        BlinkSeqMaxSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YColorLed declaration)

    % //--- (YColorLed implementation)
    methods (Hidden)
        function obj = YColorLedProxy()
            % YColorLedProxy For internal use as System Object.
            % Use FindColorLed() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 830025670;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindColorLed(func)
            % FindColorLed Retrieve instances of YColorLedProxy
            obj = YoctoProxyAPI.YColorLedProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindColorLed to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(830025670);
        end
    end
    % //--- (end of YColorLed implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YColorLedProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'ColorLed');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'ColorLed', ...
                'PropertyList', {'RgbColor','HslColor'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'ColorLed settings', ...
                'PropertyList', {'RgbColorAtPowerOn','BlinkSeqMaxSize'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(414803736, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'RgbColor';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YColorLed accessors declaration)

        function result = get_rgbColor(obj)
            % Returns the current RGB color of the LED.
            %
            % @return an integer corresponding to the current RGB color of the LED
            %
            % On failure, throws an exception or returns Y_RGBCOLOR_INVALID.
            result = obj.InvokeMethod_D(388788058);
        end

        function set_rgbColor(obj, newVal)
            % Changes the current color of the LED, using an RGB color. Encoding is done as follows: 0xRRGGBB.
            %
            % @param newval : an integer corresponding to the current color of the LED, using an RGB color
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1398602981, newVal);
        end

        function result = get.RgbColor(obj)
            result = obj.GetPropInt32(414803736);
        end

        function set.RgbColor(obj, newVal)
            obj.RgbColor = newVal;
            obj.SetPropInt32(414803736, newVal);
        end

        function result = get.HslColor(obj)
            result = obj.GetPropInt32(1549374294);
        end

        function set.HslColor(obj, newVal)
            obj.HslColor = newVal;
            obj.SetPropInt32(1549374294, newVal);
        end

        function result = get_hslColor(obj)
            % Returns the current HSL color of the LED.
            %
            % @return an integer corresponding to the current HSL color of the LED
            %
            % On failure, throws an exception or returns Y_HSLCOLOR_INVALID.
            result = obj.InvokeMethod_D(-1022984396);
        end

        function set_hslColor(obj, newVal)
            % Changes the current color of the LED, using a color HSL. Encoding is done as follows: 0xHHSSLL.
            %
            % @param newval : an integer corresponding to the current color of the LED, using a color HSL
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2022249333, newVal);
        end

        function rgbMove(obj, rgb_target, ms_duration)
            % Performs a smooth transition in the RGB color space between the current color and a target color.
            %
            % @param rgb_target  : desired RGB color at the end of the transition
            % @param ms_duration : duration of the transition, in millisecond
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_dd(826322815, rgb_target, ms_duration);
        end

        function hslMove(obj, hsl_target, ms_duration)
            % Performs a smooth transition in the HSL color space between the current color and a target color.
            %
            % @param hsl_target  : desired HSL color at the end of the transition
            % @param ms_duration : duration of the transition, in millisecond
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_dd(-445989103, hsl_target, ms_duration);
        end

        function result = get_rgbColorAtPowerOn(obj)
            % Returns the configured color to be displayed when the module is turned on.
            %
            % @return an integer corresponding to the configured color to be displayed when the
            % module is turned on
            %
            % On failure, throws an exception or returns Y_RGBCOLORATPOWERON_INVALID.
            result = obj.InvokeMethod_D(-825082946);
        end

        function set_rgbColorAtPowerOn(obj, newVal)
            % Changes the color that the LED displays by default when the module is turned on.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the color that the LED displays by default
            % when the module is turned on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-191742807, newVal);
        end

        function result = get.RgbColorAtPowerOn(obj)
            result = obj.GetPropInt32(-2025352269);
        end

        function set.RgbColorAtPowerOn(obj, newVal)
            obj.RgbColorAtPowerOn = newVal;
            obj.SetPropInt32(-2025352269, newVal);
        end

        function result = get_blinkSeqSize(obj)
            % Returns the current length of the blinking sequence.
            %
            % @return an integer corresponding to the current length of the blinking sequence
            %
            % On failure, throws an exception or returns Y_BLINKSEQSIZE_INVALID.
            result = obj.InvokeMethod_D(-777471876);
        end

        function result = get_blinkSeqMaxSize(obj)
            % Returns the maximum length of the blinking sequence.
            %
            % @return an integer corresponding to the maximum length of the blinking sequence
            %
            % On failure, throws an exception or returns Y_BLINKSEQMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1728364737);
        end

        function result = get.BlinkSeqMaxSize(obj)
            result = obj.GetPropInt32(1429993085);
        end

        function result = get_blinkSeqSignature(obj)
            % Return the blinking sequence signature. Since blinking
            % sequences cannot be read from the device, this can be used
            % to detect if a specific blinking sequence is already
            % programmed.
            %
            % @return an integer
            %
            % On failure, throws an exception or returns Y_BLINKSEQSIGNATURE_INVALID.
            result = obj.InvokeMethod_D(1674038915);
        end

        function result = addHslMoveToBlinkSeq(obj, HSLcolor, msDelay)
            % Add a new transition to the blinking sequence, the move will
            % be performed in the HSL space.
            %
            % @param HSLcolor : desired HSL color when the transition is completed
            % @param msDelay : duration of the color transition, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1555703222, HSLcolor, msDelay);
        end

        function result = addRgbMoveToBlinkSeq(obj, RGBcolor, msDelay)
            % Adds a new transition to the blinking sequence, the move is
            % performed in the RGB space.
            %
            % @param RGBcolor : desired RGB color when the transition is completed
            % @param msDelay : duration of the color transition, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-331454021, RGBcolor, msDelay);
        end

        function result = startBlinkSeq(obj)
            % Starts the preprogrammed blinking sequence. The sequence is
            % run in a loop until it is stopped by stopBlinkSeq or an explicit
            % change.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1513230446);
        end

        function result = stopBlinkSeq(obj)
            % Stops the preprogrammed blinking sequence.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1510934014);
        end

        function result = resetBlinkSeq(obj)
            % Resets the preprogrammed blinking sequence.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1263599234);
        end

        % //--- (end of YColorLed accessors declaration)
    end
end
