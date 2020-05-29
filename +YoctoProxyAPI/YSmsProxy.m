% YSmsProxy: SMS message sent or received, returned by <tt>messageBox.get_messages</tt> or
% <tt>messageBox.newMessage</tt>
% 
% YSmsProxy objects are used to describe an SMS message, received or to be sent. These objects are
% used in particular in conjunction with the <tt>YMessageBox</tt> class.

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


% //--- (YSms declaration)
classdef YSmsProxy < matlab.System
    % YSmsProxy: SMS message sent or received, returned by <tt>messageBox.get_messages</tt> or
    % <tt>messageBox.newMessage</tt>
    % 
    % YSmsProxy objects are used to describe an SMS message, received or to be sent. These objects are
    % used in particular in conjunction with the <tt>YMessageBox</tt> class.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YSms declaration)

    methods
        % //--- (YSms accessors declaration)

        function result = get_textData(obj)
            % Returns the content of the message.
            %
            % @return  a string with the content of the message.
            result = obj.InvokeMethod_S(992737424);
        end

        function result = addText(obj, val)
            % Add a regular text to the SMS. This function support messages
            % of more than 160 characters. ISO-latin accented characters
            % are supported. For messages with special unicode characters such as asian
            % characters and emoticons, use the  addUnicodeData method.
            %
            % @param val : the text to be sent in the message
            %
            % @return 0 when the call succeeds.
            result = obj.InvokeMethod_Ds(270824787, val);
        end

        function result = addUnicodeData(obj, val)
            % Add a unicode text to the SMS. This function support messages
            % of more than 160 characters, using SMS concatenation.
            %
            % @param val : an array of special unicode characters
            %
            % @return 0 when the call succeeds.
            result = obj.InvokeMethod_Dxd(1577720391, val);
        end

        function result = send(obj)
            % Sends the SMS to the recipient. Messages of more than 160 characters are supported
            % using SMS concatenation.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1257045713);
        end

        % //--- (end of YSms accessors declaration)
    end
end
