% YDisplayLayerProxy: Interface for drawing into display layers, obtained by calling
% <tt>display.get_displayLayer</tt>.
% 
% Each <tt>DisplayLayer</tt> represents an image layer containing objects to display (bitmaps, text,
% etc.). The content is displayed only when the layer is active on the screen (and not masked by
% other overlapping layers).

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


% //--- (YDisplayLayer declaration)
classdef YDisplayLayerProxy < matlab.System
    % YDisplayLayerProxy: Interface for drawing into display layers, obtained by calling
    % <tt>display.get_displayLayer</tt>.
    % 
    % Each <tt>DisplayLayer</tt> represents an image layer containing objects to display (bitmaps, text,
    % etc.). The content is displayed only when the layer is active on the screen (and not masked by
    % other overlapping layers).

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YDisplayLayer declaration)

    methods
        % //--- (YDisplayLayer accessors declaration)

        function result = reset(obj)
            % Reverts the layer to its initial state (fully transparent, default settings).
            % Reinitializes the drawing pointer to the upper left position,
            % and selects the most visible pen color. If you only want to erase the layer
            % content, use the method clear() instead.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        function result = clear(obj)
            % Erases the whole content of the layer (makes it fully transparent).
            % This method does not change any other attribute of the layer.
            % To reinitialize the layer attributes to defaults settings, use the method
            % reset() instead.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1851042224);
        end

        function result = selectColorPen(obj, color)
            % Selects the pen color for all subsequent drawing functions,
            % including text drawing. The pen color is provided as an RGB value.
            % For grayscale or monochrome displays, the value is
            % automatically converted to the proper range.
            %
            % @param color : the desired pen color, as a 24-bit RGB value
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1095032318, color);
        end

        function result = selectGrayPen(obj, graylevel)
            % Selects the pen gray level for all subsequent drawing functions,
            % including text drawing. The gray level is provided as a number between
            % 0 (black) and 255 (white, or whichever the lightest color is).
            % For monochrome displays (without gray levels), any value
            % lower than 128 is rendered as black, and any value equal
            % or above to 128 is non-black.
            %
            % @param graylevel : the desired gray level, from 0 to 255
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(929213302, graylevel);
        end

        function result = selectEraser(obj)
            % Selects an eraser instead of a pen for all subsequent drawing functions,
            % except for bitmap copy functions. Any point drawn using the eraser
            % becomes transparent (as when the layer is empty), showing the other
            % layers beneath it.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1084062661);
        end

        function result = setAntialiasingMode(obj, mode)
            % Enables or disables anti-aliasing for drawing oblique lines and circles.
            % Anti-aliasing provides a smoother aspect when looked from far enough,
            % but it can add fuzziness when the display is looked from very close.
            % At the end of the day, it is your personal choice.
            % Anti-aliasing is enabled by default on grayscale and color displays,
            % but you can disable it if you prefer. This setting has no effect
            % on monochrome displays.
            %
            % @param mode : true to enable anti-aliasing, false to
            %         disable it.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Db(224682164, mode);
        end

        function result = drawPixel(obj, x, y)
            % Draws a single pixel at the specified position.
            %
            % @param x : the distance from left of layer, in pixels
            % @param y : the distance from top of layer, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1169780541, x, y);
        end

        function result = drawRect(obj, x1, y1, x2, y2)
            % Draws an empty rectangle at a specified position.
            %
            % @param x1 : the distance from left of layer to the left border of the rectangle, in pixels
            % @param y1 : the distance from top of layer to the top border of the rectangle, in pixels
            % @param x2 : the distance from left of layer to the right border of the rectangle, in pixels
            % @param y2 : the distance from top of layer to the bottom border of the rectangle, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(-140158414, x1, y1, x2, y2);
        end

        function result = drawBar(obj, x1, y1, x2, y2)
            % Draws a filled rectangular bar at a specified position.
            %
            % @param x1 : the distance from left of layer to the left border of the rectangle, in pixels
            % @param y1 : the distance from top of layer to the top border of the rectangle, in pixels
            % @param x2 : the distance from left of layer to the right border of the rectangle, in pixels
            % @param y2 : the distance from top of layer to the bottom border of the rectangle, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(-80922497, x1, y1, x2, y2);
        end

        function result = drawCircle(obj, x, y, r)
            % Draws an empty circle at a specified position.
            %
            % @param x : the distance from left of layer to the center of the circle, in pixels
            % @param y : the distance from top of layer to the center of the circle, in pixels
            % @param r : the radius of the circle, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(-876321690, x, y, r);
        end

        function result = drawDisc(obj, x, y, r)
            % Draws a filled disc at a given position.
            %
            % @param x : the distance from left of layer to the center of the disc, in pixels
            % @param y : the distance from top of layer to the center of the disc, in pixels
            % @param r : the radius of the disc, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(958373775, x, y, r);
        end

        function result = selectFont(obj, fontname)
            % Selects a font to use for the next text drawing functions, by providing the name of the
            % font file. You can use a built-in font as well as a font file that you have previously
            % uploaded to the device built-in memory. If you experience problems selecting a font
            % file, check the device logs for any error message such as missing font file or bad font
            % file format.
            %
            % @param fontname : the font file name, embedded fonts are 8x8.yfm, Small.yfm,
            % Medium.yfm, Large.yfm (not available on Yocto-MiniDisplay).
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1097833423, fontname);
        end

        function result = drawText(obj, x, y, anchor, text)
            % Draws a text string at the specified position. The point of the text that is aligned
            % to the specified pixel position is called the anchor point, and can be chosen among
            % several options. Text is rendered from left to right, without implicit wrapping.
            %
            % @param x : the distance from left of layer to the text anchor point, in pixels
            % @param y : the distance from top of layer to the text anchor point, in pixels
            % @param anchor : the text anchor point, chosen among the YDisplayLayer.ALIGN enumeration:
            %         YDisplayLayer.ALIGN_TOP_LEFT,         YDisplayLayer.ALIGN_CENTER_LEFT,
            %         YDisplayLayer.ALIGN_BASELINE_LEFT,    YDisplayLayer.ALIGN_BOTTOM_LEFT,
            %         YDisplayLayer.ALIGN_TOP_CENTER,       YDisplayLayer.ALIGN_CENTER,
            %         YDisplayLayer.ALIGN_BASELINE_CENTER,  YDisplayLayer.ALIGN_BOTTOM_CENTER,
            %         YDisplayLayer.ALIGN_TOP_DECIMAL,      YDisplayLayer.ALIGN_CENTER_DECIMAL,
            %         YDisplayLayer.ALIGN_BASELINE_DECIMAL, YDisplayLayer.ALIGN_BOTTOM_DECIMAL,
            %         YDisplayLayer.ALIGN_TOP_RIGHT,        YDisplayLayer.ALIGN_CENTER_RIGHT,
            %         YDisplayLayer.ALIGN_BASELINE_RIGHT,   YDisplayLayer.ALIGN_BOTTOM_RIGHT.
            % @param text : the text string to draw
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd?s(32900688, x, y, anchor, text);
        end

        function result = drawImage(obj, x, y, imagename)
            % Draws a GIF image at the specified position. The GIF image must have been previously
            % uploaded to the device built-in memory. If you experience problems using an image
            % file, check the device logs for any error message such as missing image file or bad
            % image file format.
            %
            % @param x : the distance from left of layer to the left of the image, in pixels
            % @param y : the distance from top of layer to the top of the image, in pixels
            % @param imagename : the GIF file name
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddds(370191290, x, y, imagename);
        end

        function result = drawBitmap(obj, x, y, w, bitmap, bgcol)
            % Draws a bitmap at the specified position. The bitmap is provided as a binary object,
            % where each pixel maps to a bit, from left to right and from top to bottom.
            % The most significant bit of each byte maps to the leftmost pixel, and the least
            % significant bit maps to the rightmost pixel. Bits set to 1 are drawn using the
            % layer selected pen color. Bits set to 0 are drawn using the specified background
            % gray level, unless -1 is specified, in which case they are not drawn at all
            % (as if transparent).
            %
            % @param x : the distance from left of layer to the left of the bitmap, in pixels
            % @param y : the distance from top of layer to the top of the bitmap, in pixels
            % @param w : the width of the bitmap, in pixels
            % @param bitmap : a binary object
            % @param bgcol : the background gray level to use for zero bits (0 = black,
            %         255 = white), or -1 to leave the pixels unchanged
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddsd(-1735211966, x, y, w, bitmap, bgcol);
        end

        function result = moveTo(obj, x, y)
            % Moves the drawing pointer of this layer to the specified position.
            %
            % @param x : the distance from left of layer, in pixels
            % @param y : the distance from top of layer, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-734606879, x, y);
        end

        function result = lineTo(obj, x, y)
            % Draws a line from current drawing pointer position to the specified position.
            % The specified destination pixel is included in the line. The pointer position
            % is then moved to the end point of the line.
            %
            % @param x : the distance from left of layer to the end point of the line, in pixels
            % @param y : the distance from top of layer to the end point of the line, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-407834165, x, y);
        end

        function result = consoleOut(obj, text)
            % Outputs a message in the console area, and advances the console pointer accordingly.
            % The console pointer position is automatically moved to the beginning
            % of the next line when a newline character is met, or when the right margin
            % is hit. When the new text to display extends below the lower margin, the
            % console area is automatically scrolled up.
            %
            % @param text : the message to display
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(903822282, text);
        end

        function result = setConsoleMargins(obj, x1, y1, x2, y2)
            % Sets up display margins for the consoleOut function.
            %
            % @param x1 : the distance from left of layer to the left margin, in pixels
            % @param y1 : the distance from top of layer to the top margin, in pixels
            % @param x2 : the distance from left of layer to the right margin, in pixels
            % @param y2 : the distance from top of layer to the bottom margin, in pixels
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddddd(647879025, x1, y1, x2, y2);
        end

        function result = setConsoleBackground(obj, bgcol)
            % Sets up the background color used by the clearConsole function and by
            % the console scrolling feature.
            %
            % @param bgcol : the background gray level to use when scrolling (0 = black,
            %         255 = white), or -1 for transparent
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-1476542037, bgcol);
        end

        function result = setConsoleWordWrap(obj, wordwrap)
            % Sets up the wrapping behavior used by the consoleOut function.
            %
            % @param wordwrap : true to wrap only between words,
            %         false to wrap on the last column anyway.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Db(1453409307, wordwrap);
        end

        function result = clearConsole(obj)
            % Blanks the console area within console margins, and resets the console pointer
            % to the upper left corner of the console.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1230104791);
        end

        function result = setLayerPosition(obj, x, y, scrollTime)
            % Sets the position of the layer relative to the display upper left corner.
            % When smooth scrolling is used, the display offset of the layer is
            % automatically updated during the next milliseconds to animate the move of the layer.
            %
            % @param x : the distance from left of display to the upper left corner of the layer
            % @param y : the distance from top of display to the upper left corner of the layer
            % @param scrollTime : number of milliseconds to use for smooth scrolling, or
            %         0 if the scrolling should be immediate.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(861752922, x, y, scrollTime);
        end

        function result = hide(obj)
            % Hides the layer. The state of the layer is preserved but the layer is not displayed
            % on the screen until the next call to unhide(). Hiding the layer can positively
            % affect the drawing speed, since it postpones the rendering until all operations are
            % completed (double-buffering).
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(2005767205);
        end

        function result = unhide(obj)
            % Shows the layer. Shows the layer again after a hide command.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1672199517);
        end

        function result = get_display(obj)
            % Gets parent YDisplay. Returns the parent YDisplay object of the current YDisplayLayer.
            %
            % @return an YDisplay object
            result = obj.InvokeMethod_H(322175147);
        end

        function result = get_displayWidth(obj)
            % Returns the display width, in pixels.
            %
            % @return an integer corresponding to the display width, in pixels
            %
            % On failure, throws an exception or returns Y_DISPLAYWIDTH_INVALID.
            result = obj.InvokeMethod_D(-16878212);
        end

        function result = get_displayHeight(obj)
            % Returns the display height, in pixels.
            %
            % @return an integer corresponding to the display height, in pixels
            %
            % On failure, throws an exception or returns Y_DISPLAYHEIGHT_INVALID.
            result = obj.InvokeMethod_D(-1640661886);
        end

        function result = get_layerWidth(obj)
            % Returns the width of the layers to draw on, in pixels.
            %
            % @return an integer corresponding to the width of the layers to draw on, in pixels
            %
            % On failure, throws an exception or returns Y_LAYERWIDTH_INVALID.
            result = obj.InvokeMethod_D(-2123579753);
        end

        function result = get_layerHeight(obj)
            % Returns the height of the layers to draw on, in pixels.
            %
            % @return an integer corresponding to the height of the layers to draw on, in pixels
            %
            % On failure, throws an exception or returns Y_LAYERHEIGHT_INVALID.
            result = obj.InvokeMethod_D(-1449994823);
        end

        % //--- (end of YDisplayLayer accessors declaration)
    end
end
