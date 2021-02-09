% YColorLedClusterProxy: RGB LED cluster control interface, available for instance in the
% Yocto-Color-V2 or the Yocto-MaxiBuzzer
% 
% The YColorLedClusterProxy class allows you to drive a color LED cluster. Unlike the
% <tt>ColorLed</tt> class, the YColorLedClusterProxy class allows to handle several LEDs at once.
% Color changes can be done using RGB coordinates as well as HSL coordinates. The module performs all
% conversions form RGB to HSL automatically. It is then self-evident to turn on a LED with a given
% hue and to progressively vary its saturation or lightness. If needed, you can find more information
% on the difference between RGB and HSL in the section following this one.

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


% //--- (YColorLedCluster declaration)
classdef YColorLedClusterProxy < YoctoProxyAPI.YFunctionProxy
    % YColorLedClusterProxy: RGB LED cluster control interface, available for instance in the
    % Yocto-Color-V2 or the Yocto-MaxiBuzzer
    % 
    % The YColorLedClusterProxy class allows you to drive a color LED cluster. Unlike the
    % <tt>ColorLed</tt> class, the YColorLedClusterProxy class allows to handle several LEDs at once.
    % Color changes can be done using RGB coordinates as well as HSL coordinates. The module performs all
    % conversions form RGB to HSL automatically. It is then self-evident to turn on a LED with a given
    % hue and to progressively vary its saturation or lightness. If needed, you can find more information
    % on the difference between RGB and HSL in the section following this one.

    properties (Transient, Nontunable)
        % ActiveLedCount Number of LEDs currently handled by the device
        ActiveLedCount (1,1) int32
        % LedType RGB LED type currently handled by the device
        LedType (1,1) YoctoProxyAPI.EnumLedType
    end

    properties (Transient, Nontunable, SetAccess = private)
        % MaxLedCount Maximum number of LEDs that the device can handle
        MaxLedCount (1,1) int32
        % BlinkSeqMaxCount Maximum number of sequences that the device can handle
        BlinkSeqMaxCount (1,1) int32
        % BlinkSeqMaxSize Maximum length of sequences
        BlinkSeqMaxSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YColorLedCluster declaration)

    % //--- (YColorLedCluster implementation)
    methods (Hidden)
        function obj = YColorLedClusterProxy()
            % YColorLedClusterProxy For internal use as System Object.
            % Use FindColorLedCluster() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -820359136;
        end
    end

    methods (Static)
        function obj = FindColorLedCluster(func)
            % FindColorLedCluster Retrieve instances of YColorLedClusterProxy
            obj = YoctoProxyAPI.YColorLedClusterProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindColorLedCluster to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-820359136);
        end
    end
    % //--- (end of YColorLedCluster implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YColorLedClusterProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'ColorLedCluster');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'ColorLedCluster', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'ColorLedCluster settings', ...
                'PropertyList', {'ActiveLedCount','LedType','MaxLedCount','BlinkSeqMaxCount','BlinkSeqMaxSize'});
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
        % //--- (YColorLedCluster accessors declaration)

        function result = get_activeLedCount(obj)
            % Returns the number of LEDs currently handled by the device.
            %
            % @return an integer corresponding to the number of LEDs currently handled by the device
            %
            % On failure, throws an exception or returns YColorLedCluster.ACTIVELEDCOUNT_INVALID.
            result = obj.InvokeMethod_D(835593059);
        end

        function set_activeLedCount(obj, newVal)
            % Changes the number of LEDs currently handled by the device.
            % Remember to call the matching module
            % saveToFlash() method to save the setting permanently.
            %
            % @param newval : an integer corresponding to the number of LEDs currently handled by the device
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1534377001, newVal);
        end

        function result = get.ActiveLedCount(obj)
            result = obj.GetPropInt32(-375283963);
        end

        function set.ActiveLedCount(obj, newVal)
            obj.ActiveLedCount = newVal;
            obj.SetPropInt32(-375283963, newVal);
        end

        function result = get_ledType(obj)
            % Returns the RGB LED type currently handled by the device.
            %
            % @return either YColorLedCluster.LEDTYPE_RGB or YColorLedCluster.LEDTYPE_RGBW, according
            % to the RGB LED type currently handled by the device
            %
            % On failure, throws an exception or returns YColorLedCluster.LEDTYPE_INVALID.
            result = YoctoProxyAPI.EnumLedType(obj.InvokeMethod_D(-1658295125));
        end

        function set_ledType(obj, newVal)
            % Changes the RGB LED type currently handled by the device.
            % Remember to call the matching module
            % saveToFlash() method to save the setting permanently.
            %
            % @param newval : either YColorLedCluster.LEDTYPE_RGB or YColorLedCluster.LEDTYPE_RGBW,
            % according to the RGB LED type currently handled by the device
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-755466193, newVal);
        end

        function result = get.LedType(obj)
            result = YoctoProxyAPI.EnumLedType(obj.GetPropInt32(669296668));
        end

        function set.LedType(obj, newVal)
            obj.LedType = newVal;
            obj.SetPropInt32(669296668, newVal);
        end

        function result = get_maxLedCount(obj)
            % Returns the maximum number of LEDs that the device can handle.
            %
            % @return an integer corresponding to the maximum number of LEDs that the device can handle
            %
            % On failure, throws an exception or returns YColorLedCluster.MAXLEDCOUNT_INVALID.
            result = obj.InvokeMethod_D(633722818);
        end

        function result = get.MaxLedCount(obj)
            result = obj.GetPropInt32(-1243181488);
        end

        function result = get_blinkSeqMaxCount(obj)
            % Returns the maximum number of sequences that the device can handle.
            %
            % @return an integer corresponding to the maximum number of sequences that the device can handle
            %
            % On failure, throws an exception or returns YColorLedCluster.BLINKSEQMAXCOUNT_INVALID.
            result = obj.InvokeMethod_D(1823846814);
        end

        function result = get.BlinkSeqMaxCount(obj)
            result = obj.GetPropInt32(111688311);
        end

        function result = get_blinkSeqMaxSize(obj)
            % Returns the maximum length of sequences.
            %
            % @return an integer corresponding to the maximum length of sequences
            %
            % On failure, throws an exception or returns YColorLedCluster.BLINKSEQMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1728364737);
        end

        function result = get.BlinkSeqMaxSize(obj)
            result = obj.GetPropInt32(1429993085);
        end

        function result = set_rgbColor(obj, ledIndex, count, rgbValue)
            % Changes the current color of consecutive LEDs in the cluster, using a RGB color.
            % Encoding is done as follows: 0xRRGGBB.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param rgbValue :  new color.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(773766980, ledIndex, count, rgbValue);
        end

        function result = set_rgbColorAtPowerOn(obj, ledIndex, count, rgbValue)
            % Changes the  color at device startup of consecutive LEDs in the cluster, using a RGB color.
            % Encoding is done as follows: 0xRRGGBB. Don't forget to call saveLedsConfigAtPowerOn()
            % to make sure the modification is saved in the device flash memory.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param rgbValue :  new color.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-524749890, ledIndex, count, rgbValue);
        end

        function result = set_hslColorAtPowerOn(obj, ledIndex, count, hslValue)
            % Changes the  color at device startup of consecutive LEDs in the cluster, using a HSL color.
            % Encoding is done as follows: 0xHHSSLL. Don't forget to call saveLedsConfigAtPowerOn()
            % to make sure the modification is saved in the device flash memory.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param hslValue :  new color.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-1632040113, ledIndex, count, hslValue);
        end

        function result = set_hslColor(obj, ledIndex, count, hslValue)
            % Changes the current color of consecutive LEDs in the cluster, using a HSL color.
            % Encoding is done as follows: 0xHHSSLL.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param hslValue :  new color.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-47283651, ledIndex, count, hslValue);
        end

        function result = rgb_move(obj, ledIndex, count, rgbValue, delay)
            % Allows you to modify the current color of a group of adjacent LEDs to another color, in
            % a seamless and
            % autonomous manner. The transition is performed in the RGB space.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param rgbValue :  new color (0xRRGGBB).
            % @param delay    :  transition duration in ms
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(1914208093, ledIndex, count, rgbValue, delay);
        end

        function result = hsl_move(obj, ledIndex, count, hslValue, delay)
            % Allows you to modify the current color of a group of adjacent LEDs  to another color,
            % in a seamless and
            % autonomous manner. The transition is performed in the HSL space. In HSL, hue is a circular
            % value (0..360°). There are always two paths to perform the transition: by increasing
            % or by decreasing the hue. The module selects the shortest transition.
            % If the difference is exactly 180°, the module selects the transition which increases
            % the hue.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param hslValue :  new color (0xHHSSLL).
            % @param delay    :  transition duration in ms
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(1527940856, ledIndex, count, hslValue, delay);
        end

        function result = addRgbMoveToBlinkSeq(obj, seqIndex, rgbValue, delay)
            % Adds an RGB transition to a sequence. A sequence is a transition list, which can
            % be executed in loop by a group of LEDs.  Sequences are persistent and are saved
            % in the device flash memory as soon as the saveBlinkSeq() method is called.
            %
            % @param seqIndex :  sequence index.
            % @param rgbValue :  target color (0xRRGGBB)
            % @param delay    :  transition duration in ms
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-998105439, seqIndex, rgbValue, delay);
        end

        function result = addHslMoveToBlinkSeq(obj, seqIndex, hslValue, delay)
            % Adds an HSL transition to a sequence. A sequence is a transition list, which can
            % be executed in loop by an group of LEDs.  Sequences are persistent and are saved
            % in the device flash memory as soon as the saveBlinkSeq() method is called.
            %
            % @param seqIndex : sequence index.
            % @param hslValue : target color (0xHHSSLL)
            % @param delay    : transition duration in ms
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-1165760944, seqIndex, hslValue, delay);
        end

        function result = addMirrorToBlinkSeq(obj, seqIndex)
            % Adds a mirror ending to a sequence. When the sequence will reach the end of the last
            % transition, its running speed will automatically be reversed so that the sequence plays
            % in the reverse direction, like in a mirror. After the first transition of the sequence
            % is played at the end of the reverse execution, the sequence starts again in
            % the initial direction.
            %
            % @param seqIndex : sequence index.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1501498761, seqIndex);
        end

        function result = addJumpToBlinkSeq(obj, seqIndex, linkSeqIndex)
            % Adds to a sequence a jump to another sequence. When a pixel will reach this jump,
            % it will be automatically relinked to the new sequence, and will run it starting
            % from the beginning.
            %
            % @param seqIndex : sequence index.
            % @param linkSeqIndex : index of the sequence to chain.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-723903890, seqIndex, linkSeqIndex);
        end

        function result = addUnlinkToBlinkSeq(obj, seqIndex)
            % Adds a to a sequence a hard stop code. When a pixel will reach this stop code,
            % instead of restarting the sequence in a loop it will automatically be unlinked
            % from the sequence.
            %
            % @param seqIndex : sequence index.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-958680432, seqIndex);
        end

        function result = linkLedToBlinkSeq(obj, ledIndex, count, seqIndex, offset)
            % Links adjacent LEDs to a specific sequence. These LEDs start to execute
            % the sequence as soon as  startBlinkSeq is called. It is possible to add an offset
            % in the execution: that way we  can have several groups of LED executing the same
            % sequence, with a  temporal offset. A LED cannot be linked to more than one sequence.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param seqIndex :  sequence index.
            % @param offset   :  execution offset in ms.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(1140262926, ledIndex, count, seqIndex, offset);
        end

        function result = linkLedToBlinkSeqAtPowerOn(obj, ledIndex, count, seqIndex, offset)
            % Links adjacent LEDs to a specific sequence at device power-on. Don't forget to configure
            % the sequence auto start flag as well and call saveLedsConfigAtPowerOn(). It is possible
            % to add an offset
            % in the execution: that way we  can have several groups of LEDs executing the same
            % sequence, with a  temporal offset. A LED cannot be linked to more than one sequence.
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param seqIndex :  sequence index.
            % @param offset   :  execution offset in ms.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(-1402551910, ledIndex, count, seqIndex, offset);
        end

        function result = linkLedToPeriodicBlinkSeq(obj, ledIndex, count, seqIndex, periods)
            % Links adjacent LEDs to a specific sequence. These LED start to execute
            % the sequence as soon as  startBlinkSeq is called. This function automatically
            % introduces a shift between LEDs so that the specified number of sequence periods
            % appears on the group of LEDs (wave effect).
            %
            % @param ledIndex :  index of the first affected LED.
            % @param count    :  affected LED count.
            % @param seqIndex :  sequence index.
            % @param periods  :  number of periods to show on LEDs.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(1703773461, ledIndex, count, seqIndex, periods);
        end

        function result = unlinkLedFromBlinkSeq(obj, ledIndex, count)
            % Unlinks adjacent LEDs from a  sequence.
            %
            % @param ledIndex  :  index of the first affected LED.
            % @param count     :  affected LED count.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1707632279, ledIndex, count);
        end

        function result = startBlinkSeq(obj, seqIndex)
            % Starts a sequence execution: every LED linked to that sequence starts to
            % run it in a loop. Note that a sequence with a zero duration can't be started.
            %
            % @param seqIndex :  index of the sequence to start.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(848114819, seqIndex);
        end

        function result = stopBlinkSeq(obj, seqIndex)
            % Stops a sequence execution. If started again, the execution
            % restarts from the beginning.
            %
            % @param seqIndex :  index of the sequence to stop.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(1987500826, seqIndex);
        end

        function result = resetBlinkSeq(obj, seqIndex)
            % Stops a sequence execution and resets its contents. LEDs linked to this
            % sequence are not automatically updated anymore.
            %
            % @param seqIndex :  index of the sequence to reset
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(802470390, seqIndex);
        end

        function result = set_blinkSeqStateAtPowerOn(obj, seqIndex, autostart)
            % Configures a sequence to make it start automatically at device
            % startup. Note that a sequence with a zero duration can't be started.
            % Don't forget to call saveBlinkSeq() to make sure the
            % modification is saved in the device flash memory.
            %
            % @param seqIndex :  index of the sequence to reset.
            % @param autostart : 0 to keep the sequence turned off and 1 to start it automatically.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-660945542, seqIndex, autostart);
        end

        function result = set_blinkSeqSpeed(obj, seqIndex, speed)
            % Changes the execution speed of a sequence. The natural execution speed is 1000 per
            % thousand. If you configure a slower speed, you can play the sequence in slow-motion.
            % If you set a negative speed, you can play the sequence in reverse direction.
            %
            % @param seqIndex :  index of the sequence to start.
            % @param speed :     sequence running speed (-1000...1000).
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1863262182, seqIndex, speed);
        end

        function result = saveLedsConfigAtPowerOn(obj)
            % Saves the LEDs power-on configuration. This includes the start-up color or
            % sequence binding for all LEDs. Warning: if some LEDs are linked to a sequence, the
            % method saveBlinkSeq() must also be called to save the sequence definition.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1233425158);
        end

        function result = saveBlinkSeq(obj, seqIndex)
            % Saves the definition of a sequence. Warning: only sequence steps and flags are saved.
            % to save the LEDs startup bindings, the method saveLedsConfigAtPowerOn()
            % must be called.
            %
            % @param seqIndex :  index of the sequence to start.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(860798917, seqIndex);
        end

        function result = set_rgbColorBuffer(obj, ledIndex, buff)
            % Sends a binary buffer to the LED RGB buffer, as is.
            % First three bytes are RGB components for LED specified as parameter, the
            % next three bytes for the next LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param buff : the binary buffer to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dds(1769065556, ledIndex, buff);
        end

        function result = set_rgbColorArray(obj, ledIndex, rgbList)
            % Sends 24bit RGB colors (provided as a list of integers) to the LED RGB buffer, as is.
            % The first number represents the RGB value of the LED specified as parameter, the second
            % number represents the RGB value of the next LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param rgbList : a list of 24bit RGB codes, in the form 0xRRGGBB
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddxd(1288010864, ledIndex, rgbList);
        end

        function result = rgbArrayOfs_move(obj, ledIndex, rgbList, delay)
            % Sets up a smooth RGB color transition to the specified pixel-by-pixel list of RGB
            % color codes. The first color code represents the target RGB value of the first LED,
            % the next color code represents the target value of the next LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param rgbList : a list of target 24bit RGB codes, in the form 0xRRGGBB
            % @param delay   : transition duration in ms
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddxdd(1662707560, ledIndex, rgbList, delay);
        end

        function result = rgbArray_move(obj, rgbList, delay)
            % Sets up a smooth RGB color transition to the specified pixel-by-pixel list of RGB
            % color codes. The first color code represents the target RGB value of the first LED,
            % the next color code represents the target value of the next LED, etc.
            %
            % @param rgbList : a list of target 24bit RGB codes, in the form 0xRRGGBB
            % @param delay   : transition duration in ms
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxdd(1457534503, rgbList, delay);
        end

        function result = set_hslColorBuffer(obj, ledIndex, buff)
            % Sends a binary buffer to the LED HSL buffer, as is.
            % First three bytes are HSL components for the LED specified as parameter, the
            % next three bytes for the second LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param buff : the binary buffer to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dds(294395354, ledIndex, buff);
        end

        function result = set_hslColorArray(obj, ledIndex, hslList)
            % Sends 24bit HSL colors (provided as a list of integers) to the LED HSL buffer, as is.
            % The first number represents the HSL value of the LED specified as parameter, the second
            % number represents
            % the HSL value of the second LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param hslList : a list of 24bit HSL codes, in the form 0xHHSSLL
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddxd(876129790, ledIndex, hslList);
        end

        function result = hslArray_move(obj, hslList, delay)
            % Sets up a smooth HSL color transition to the specified pixel-by-pixel list of HSL
            % color codes. The first color code represents the target HSL value of the first LED,
            % the second color code represents the target value of the second LED, etc.
            %
            % @param hslList : a list of target 24bit HSL codes, in the form 0xHHSSLL
            % @param delay   : transition duration in ms
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxdd(773711785, hslList, delay);
        end

        function result = hslArrayOfs_move(obj, ledIndex, hslList, delay)
            % Sets up a smooth HSL color transition to the specified pixel-by-pixel list of HSL
            % color codes. The first color code represents the target HSL value of the first LED,
            % the second color code represents the target value of the second LED, etc.
            %
            % @param ledIndex : index of the first LED which should be updated
            % @param hslList : a list of target 24bit HSL codes, in the form 0xHHSSLL
            % @param delay   : transition duration in ms
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddxdd(488316825, ledIndex, hslList, delay);
        end

        function result = get_rgbColorBuffer(obj, ledIndex, count)
            % Returns a binary buffer with content from the LED RGB buffer, as is.
            % First three bytes are RGB components for the first LED in the interval,
            % the next three bytes for the second LED in the interval, etc.
            %
            % @param ledIndex : index of the first LED which should be returned
            % @param count    : number of LEDs which should be returned
            %
            % @return a binary buffer with RGB components of selected LEDs.
            %
            % On failure, throws an exception or returns an empty binary buffer.
            result = obj.InvokeMethod_Sdd(110961959, ledIndex, count);
        end

        function result = get_rgbColorArray(obj, ledIndex, count)
            % Returns a list on 24bit RGB color values with the current colors displayed on
            % the RGB LEDs. The first number represents the RGB value of the first LED,
            % the second number represents the RGB value of the second LED, etc.
            %
            % @param ledIndex : index of the first LED which should be returned
            % @param count    : number of LEDs which should be returned
            %
            % @return a list of 24bit color codes with RGB components of selected LEDs, as 0xRRGGBB.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(-581633643, ledIndex, count);
        end

        function result = get_rgbColorArrayAtPowerOn(obj, ledIndex, count)
            % Returns a list on 24bit RGB color values with the RGB LEDs startup colors.
            % The first number represents the startup RGB value of the first LED,
            % the second number represents the RGB value of the second LED, etc.
            %
            % @param ledIndex : index of the first LED  which should be returned
            % @param count    : number of LEDs which should be returned
            %
            % @return a list of 24bit color codes with RGB components of selected LEDs, as 0xRRGGBB.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(2013897467, ledIndex, count);
        end

        function result = get_linkedSeqArray(obj, ledIndex, count)
            % Returns a list on sequence index for each RGB LED. The first number represents the
            % sequence index for the the first LED, the second number represents the sequence
            % index for the second LED, etc.
            %
            % @param ledIndex : index of the first LED which should be returned
            % @param count    : number of LEDs which should be returned
            %
            % @return a list of integers with sequence index
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(-346457201, ledIndex, count);
        end

        function result = get_blinkSeqSignatures(obj, seqIndex, count)
            % Returns a list on 32 bit signatures for specified blinking sequences.
            % Since blinking sequences cannot be read from the device, this can be used
            % to detect if a specific blinking sequence is already programmed.
            %
            % @param seqIndex : index of the first blinking sequence which should be returned
            % @param count    : number of blinking sequences which should be returned
            %
            % @return a list of 32 bit integer signatures
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(-527316549, seqIndex, count);
        end

        function result = get_blinkSeqStateSpeed(obj, seqIndex, count)
            % Returns a list of integers with the current speed for specified blinking sequences.
            %
            % @param seqIndex : index of the first sequence speed which should be returned
            % @param count    : number of sequence speeds which should be returned
            %
            % @return a list of integers, 0 for sequences turned off and 1 for sequences running
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(1215396793, seqIndex, count);
        end

        function result = get_blinkSeqStateAtPowerOn(obj, seqIndex, count)
            % Returns a list of integers with the "auto-start at power on" flag state for specified
            % blinking sequences.
            %
            % @param seqIndex : index of the first blinking sequence which should be returned
            % @param count    : number of blinking sequences which should be returned
            %
            % @return a list of integers, 0 for sequences turned off and 1 for sequences running
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(2139383686, seqIndex, count);
        end

        function result = get_blinkSeqState(obj, seqIndex, count)
            % Returns a list of integers with the started state for specified blinking sequences.
            %
            % @param seqIndex : index of the first blinking sequence which should be returned
            % @param count    : number of blinking sequences which should be returned
            %
            % @return a list of integers, 0 for sequences turned off and 1 for sequences running
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdd(-1046839097, seqIndex, count);
        end

        % //--- (end of YColorLedCluster accessors declaration)
    end
end
