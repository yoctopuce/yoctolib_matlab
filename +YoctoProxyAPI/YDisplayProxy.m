% YDisplayProxy: display control interface, available for instance in the Yocto-Display, the
% Yocto-MaxiDisplay, the Yocto-MaxiDisplay-G or the Yocto-MiniDisplay
% 
% The YDisplayProxy class allows to drive Yoctopuce displays. Yoctopuce display interface has been
% designed to easily show information and images. The device provides built-in multi-layer rendering.
% Layers can be drawn offline, individually, and freely moved on the display. It can also replay
% recorded sequences (animations).
% 
% In order to draw on the screen, you should use the <tt>display.get_displayLayer</tt> method to
% retrieve the layer(s) on which you want to draw, and then use methods defined in
% <tt>YDisplayLayer</tt> to draw on the layers.

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


% //--- (YDisplay declaration)
classdef YDisplayProxy < YoctoProxyAPI.YFunctionProxy
    % YDisplayProxy: display control interface, available for instance in the Yocto-Display, the
    % Yocto-MaxiDisplay, the Yocto-MaxiDisplay-G or the Yocto-MiniDisplay
    % 
    % The YDisplayProxy class allows to drive Yoctopuce displays. Yoctopuce display interface has been
    % designed to easily show information and images. The device provides built-in multi-layer rendering.
    % Layers can be drawn offline, individually, and freely moved on the display. It can also replay
    % recorded sequences (animations).
    % 
    % In order to draw on the screen, you should use the <tt>display.get_displayLayer</tt> method to
    % retrieve the layer(s) on which you want to draw, and then use methods defined in
    % <tt>YDisplayLayer</tt> to draw on the layers.

    properties (Transient, Nontunable)
        % StartupSeq Name of the sequence to play when the displayed is powered on
        StartupSeq (1,:) char
        % Brightness Luminosity of the  module informative LEDs (from 0 to 100)
        Brightness (1,1) int32
        % Orientation Currently selected display orientation
        Orientation (1,1) YoctoProxyAPI.EnumOrientation
    end

    properties (Transient, Nontunable, SetAccess = private)
        % DisplayWidth Display width, in pixels
        DisplayWidth (1,1) int32
        % DisplayHeight Display height, in pixels
        DisplayHeight (1,1) int32
        % DisplayType Display type: monochrome, gray levels or full color
        DisplayType (1,1) YoctoProxyAPI.EnumDisplayType
        % LayerWidth Width of the layers to draw on, in pixels
        LayerWidth (1,1) int32
        % LayerHeight Height of the layers to draw on, in pixels
        LayerHeight (1,1) int32
        % LayerCount Number of available layers to draw on
        LayerCount (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YDisplay declaration)

    % //--- (YDisplay implementation)
    methods (Hidden)
        function obj = YDisplayProxy()
            % YDisplayProxy For internal use as System Object.
            % Use FindDisplay() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1016313025;
        end
    end

    methods (Static)
        function obj = FindDisplay(func)
            % FindDisplay Retrieve instances of YDisplayProxy
            obj = YoctoProxyAPI.YDisplayProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindDisplay to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1016313025);
        end
    end
    % //--- (end of YDisplay implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YDisplayProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Display');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Display', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Display settings', ...
                'PropertyList', {'StartupSeq','Brightness','Orientation','DisplayWidth','DisplayHeight','DisplayType','LayerWidth','LayerHeight','LayerCount'});
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
        % //--- (YDisplay accessors declaration)

        function result = get_enabled(obj)
            % Returns true if the screen is powered, false otherwise.
            %
            % @return either YDisplay.ENABLED_FALSE or YDisplay.ENABLED_TRUE, according to true if
            % the screen is powered, false otherwise
            %
            % On failure, throws an exception or returns YDisplay.ENABLED_INVALID.
            result = YoctoProxyAPI.EnumEnabled(obj.InvokeMethod_D(587192537));
        end

        function set_enabled(obj, newVal)
            % Changes the power state of the display.
            %
            % @param newval : either YDisplay.ENABLED_FALSE or YDisplay.ENABLED_TRUE, according to
            % the power state of the display
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1831810141, newVal);
        end

        function result = get_startupSeq(obj)
            % Returns the name of the sequence to play when the displayed is powered on.
            %
            % @return a string corresponding to the name of the sequence to play when the displayed is powered on
            %
            % On failure, throws an exception or returns YDisplay.STARTUPSEQ_INVALID.
            result = obj.InvokeMethod_S(227373314);
        end

        function set_startupSeq(obj, newVal)
            % Changes the name of the sequence to play when the displayed is powered on.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the name of the sequence to play when the
            % displayed is powered on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(83174355, newVal);
        end

        function result = get.StartupSeq(obj)
            result = obj.GetPropString(-526620522);
        end

        function set.StartupSeq(obj, newVal)
            obj.StartupSeq = newVal;
            obj.SetPropString(-526620522, newVal);
        end

        function result = get_brightness(obj)
            % Returns the luminosity of the  module informative LEDs (from 0 to 100).
            %
            % @return an integer corresponding to the luminosity of the  module informative LEDs (from 0 to 100)
            %
            % On failure, throws an exception or returns YDisplay.BRIGHTNESS_INVALID.
            result = obj.InvokeMethod_D(-386005521);
        end

        function set_brightness(obj, newVal)
            % Changes the brightness of the display. The parameter is a value between 0 and
            % 100. Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the brightness of the display
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-511289538, newVal);
        end

        function result = get.Brightness(obj)
            result = obj.GetPropInt32(-1775512269);
        end

        function set.Brightness(obj, newVal)
            obj.Brightness = newVal;
            obj.SetPropInt32(-1775512269, newVal);
        end

        function result = get_orientation(obj)
            % Returns the currently selected display orientation.
            %
            % @return a value among YDisplay.ORIENTATION_LEFT, YDisplay.ORIENTATION_UP,
            % YDisplay.ORIENTATION_RIGHT and YDisplay.ORIENTATION_DOWN corresponding to the currently
            % selected display orientation
            %
            % On failure, throws an exception or returns YDisplay.ORIENTATION_INVALID.
            result = YoctoProxyAPI.EnumOrientation(obj.InvokeMethod_D(569319631));
        end

        function set_orientation(obj, newVal)
            % Changes the display orientation. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a value among YDisplay.ORIENTATION_LEFT, YDisplay.ORIENTATION_UP,
            % YDisplay.ORIENTATION_RIGHT and YDisplay.ORIENTATION_DOWN corresponding to the display orientation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(2128133813, newVal);
        end

        function result = get.Orientation(obj)
            result = YoctoProxyAPI.EnumOrientation(obj.GetPropInt32(-1340323199));
        end

        function set.Orientation(obj, newVal)
            obj.Orientation = newVal;
            obj.SetPropInt32(-1340323199, newVal);
        end

        function result = get_displayWidth(obj)
            % Returns the display width, in pixels.
            %
            % @return an integer corresponding to the display width, in pixels
            %
            % On failure, throws an exception or returns YDisplay.DISPLAYWIDTH_INVALID.
            result = obj.InvokeMethod_D(-16878212);
        end

        function result = get.DisplayWidth(obj)
            result = obj.GetPropInt32(-2086327159);
        end

        function result = get_displayHeight(obj)
            % Returns the display height, in pixels.
            %
            % @return an integer corresponding to the display height, in pixels
            %
            % On failure, throws an exception or returns YDisplay.DISPLAYHEIGHT_INVALID.
            result = obj.InvokeMethod_D(-1640661886);
        end

        function result = get.DisplayHeight(obj)
            result = obj.GetPropInt32(-889758533);
        end

        function result = get_displayType(obj)
            % Returns the display type: monochrome, gray levels or full color.
            %
            % @return a value among YDisplay.DISPLAYTYPE_MONO, YDisplay.DISPLAYTYPE_GRAY and
            % YDisplay.DISPLAYTYPE_RGB corresponding to the display type: monochrome, gray levels or full color
            %
            % On failure, throws an exception or returns YDisplay.DISPLAYTYPE_INVALID.
            result = YoctoProxyAPI.EnumDisplayType(obj.InvokeMethod_D(462290817));
        end

        function result = get.DisplayType(obj)
            result = YoctoProxyAPI.EnumDisplayType(obj.GetPropInt32(860800352));
        end

        function result = get_layerWidth(obj)
            % Returns the width of the layers to draw on, in pixels.
            %
            % @return an integer corresponding to the width of the layers to draw on, in pixels
            %
            % On failure, throws an exception or returns YDisplay.LAYERWIDTH_INVALID.
            result = obj.InvokeMethod_D(-2123579753);
        end

        function result = get.LayerWidth(obj)
            result = obj.GetPropInt32(-1953054022);
        end

        function result = get_layerHeight(obj)
            % Returns the height of the layers to draw on, in pixels.
            %
            % @return an integer corresponding to the height of the layers to draw on, in pixels
            %
            % On failure, throws an exception or returns YDisplay.LAYERHEIGHT_INVALID.
            result = obj.InvokeMethod_D(-1449994823);
        end

        function result = get.LayerHeight(obj)
            result = obj.GetPropInt32(1966018115);
        end

        function result = get_layerCount(obj)
            % Returns the number of available layers to draw on.
            %
            % @return an integer corresponding to the number of available layers to draw on
            %
            % On failure, throws an exception or returns YDisplay.LAYERCOUNT_INVALID.
            result = obj.InvokeMethod_D(-1279478134);
        end

        function result = get.LayerCount(obj)
            result = obj.GetPropInt32(-2108308489);
        end

        function result = resetAll(obj)
            % Clears the display screen and resets all display layers to their default state.
            % Using this function in a sequence will kill the sequence play-back. Don't use that
            % function to reset the display at sequence start-up.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1964805322);
        end

        function result = fade(obj, brightness, duration)
            % Smoothly changes the brightness of the screen to produce a fade-in or fade-out
            % effect.
            %
            % @param brightness : the new screen brightness
            % @param duration : duration of the brightness transition, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(862172543, brightness, duration);
        end

        function result = newSequence(obj)
            % Starts to record all display commands into a sequence, for later replay.
            % The name used to store the sequence is specified when calling
            % saveSequence(), once the recording is complete.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1406310871);
        end

        function result = saveSequence(obj, sequenceName)
            % Stops recording display commands and saves the sequence into the specified
            % file on the display internal memory. The sequence can be later replayed
            % using playSequence().
            %
            % @param sequenceName : the name of the newly created sequence
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1378247279, sequenceName);
        end

        function result = playSequence(obj, sequenceName)
            % Replays a display sequence previously recorded using
            % newSequence() and saveSequence().
            %
            % @param sequenceName : the name of the newly created sequence
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-885487796, sequenceName);
        end

        function result = pauseSequence(obj, delay_ms)
            % Waits for a specified delay (in milliseconds) before playing next
            % commands in current sequence. This method can be used while
            % recording a display sequence, to insert a timed wait in the sequence
            % (without any immediate effect). It can also be used dynamically while
            % playing a pre-recorded sequence, to suspend or resume the execution of
            % the sequence. To cancel a delay, call the same method with a zero delay.
            %
            % @param delay_ms : the duration to wait, in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(1154600263, delay_ms);
        end

        function result = stopSequence(obj)
            % Stops immediately any ongoing sequence replay.
            % The display is left as is.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1447496978);
        end

        function result = upload(obj, pathname, content)
            % Uploads an arbitrary file (for instance a GIF file) to the display, to the
            % specified full path name. If a file already exists with the same path name,
            % its content is overwritten.
            %
            % @param pathname : path and name of the new file to create
            % @param content : binary buffer with the content to set
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(2131382702, pathname, content);
        end

        function result = copyLayerContent(obj, srcLayerId, dstLayerId)
            % Copies the whole content of a layer to another layer. The color and transparency
            % of all the pixels from the destination layer are set to match the source pixels.
            % This method only affects the displayed content, but does not change any
            % property of the layer object.
            % Note that layer 0 has no transparency support (it is always completely opaque).
            %
            % @param srcLayerId : the identifier of the source layer (a number in range 0..layerCount-1)
            % @param dstLayerId : the identifier of the destination layer (a number in range 0..layerCount-1)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(492890742, srcLayerId, dstLayerId);
        end

        function result = swapLayerContent(obj, layerIdA, layerIdB)
            % Swaps the whole content of two layers. The color and transparency of all the pixels from
            % the two layers are swapped. This method only affects the displayed content, but does
            % not change any property of the layer objects. In particular, the visibility of each
            % layer stays unchanged. When used between one hidden layer and a visible layer,
            % this method makes it possible to easily implement double-buffering.
            % Note that layer 0 has no transparency support (it is always completely opaque).
            %
            % @param layerIdA : the first layer (a number in range 0..layerCount-1)
            % @param layerIdB : the second layer (a number in range 0..layerCount-1)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1191315960, layerIdA, layerIdB);
        end

        function result = get_displayLayer(obj, layerId)
            % Returns a YDisplayLayer object that can be used to draw on the specified
            % layer. The content is displayed only when the layer is active on the
            % screen (and not masked by other overlapping layers).
            %
            % @param layerId : the identifier of the layer (a number in range 0..layerCount-1)
            %
            % @return an YDisplayLayer object
            %
            % On failure, throws an exception or returns null.
            result = obj.InvokeMethod_Hd(-1569211084, layerId);
        end

        % //--- (end of YDisplay accessors declaration)
    end
end
