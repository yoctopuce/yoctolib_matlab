% YMessageBoxProxy: SMS message box interface control interface, available for instance in the
% YoctoHub-GSM-2G, the YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA or the YoctoHub-GSM-4G
% 
% The YMessageBoxProxy class provides SMS sending and receiving capability for GSM-enabled Yoctopuce
% devices.

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


% //--- (YMessageBox declaration)
classdef YMessageBoxProxy < YoctoProxyAPI.YFunctionProxy
    % YMessageBoxProxy: SMS message box interface control interface, available for instance in the
    % YoctoHub-GSM-2G, the YoctoHub-GSM-3G-EU, the YoctoHub-GSM-3G-NA or the YoctoHub-GSM-4G
    % 
    % The YMessageBoxProxy class provides SMS sending and receiving capability for GSM-enabled Yoctopuce
    % devices.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
        % SlotsInUse Number of message storage slots currently in use
        SlotsInUse (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YMessageBox declaration)

    % //--- (YMessageBox implementation)
    methods (Hidden)
        function obj = YMessageBoxProxy()
            % YMessageBoxProxy For internal use as System Object.
            % Use FindMessageBox() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1250089747;
        end
    end

    methods (Static)
        function obj = FindMessageBox(func)
            % FindMessageBox Retrieve instances of YMessageBoxProxy
            obj = YoctoProxyAPI.YMessageBoxProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindMessageBox to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1250089747);
        end
    end
    % //--- (end of YMessageBox implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YMessageBoxProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'MessageBox');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'MessageBox', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'MessageBox settings', ...
                'PropertyList', {'SlotsInUse'});
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
        % //--- (YMessageBox accessors declaration)

        function result = get_slotsInUse(obj)
            % Returns the number of message storage slots currently in use.
            %
            % @return an integer corresponding to the number of message storage slots currently in use
            %
            % On failure, throws an exception or returns YMessageBox.SLOTSINUSE_INVALID.
            result = obj.InvokeMethod_D(1249889257);
        end

        function result = get.SlotsInUse(obj)
            result = obj.GetPropInt32(1241773948);
        end

        function result = get_slotsCount(obj)
            % Returns the total number of message storage slots on the SIM card.
            %
            % @return an integer corresponding to the total number of message storage slots on the SIM card
            %
            % On failure, throws an exception or returns YMessageBox.SLOTSCOUNT_INVALID.
            result = obj.InvokeMethod_D(1527066115);
        end

        function result = get_pduSent(obj)
            % Returns the number of SMS units sent so far.
            %
            % @return an integer corresponding to the number of SMS units sent so far
            %
            % On failure, throws an exception or returns YMessageBox.PDUSENT_INVALID.
            result = obj.InvokeMethod_D(-806819334);
        end

        function set_pduSent(obj, newVal)
            % Changes the value of the outgoing SMS units counter.
            %
            % @param newval : an integer corresponding to the value of the outgoing SMS units counter
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2143812226, newVal);
        end

        function result = get_pduReceived(obj)
            % Returns the number of SMS units received so far.
            %
            % @return an integer corresponding to the number of SMS units received so far
            %
            % On failure, throws an exception or returns YMessageBox.PDURECEIVED_INVALID.
            result = obj.InvokeMethod_D(1086857769);
        end

        function set_pduReceived(obj, newVal)
            % Changes the value of the incoming SMS units counter.
            %
            % @param newval : an integer corresponding to the value of the incoming SMS units counter
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(536853587, newVal);
        end

        function result = clearPduCounters(obj)
            % Clear the SMS units counters.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1103123865);
        end

        function result = sendTextMessage(obj, recipient, message)
            % Sends a regular text SMS, with standard parameters. This function can send messages
            % of more than 160 characters, using SMS concatenation. ISO-latin accented characters
            % are supported. For sending messages with special unicode characters such as asian
            % characters and emoticons, use newMessage to create a new message and define
            % the content of using methods addText and addUnicodeData.
            %
            % @param recipient : a text string with the recipient phone number, either as a
            %         national number, or in international format starting with a plus sign
            % @param message : the text to be sent in the message
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(-1747837246, recipient, message);
        end

        function result = sendFlashMessage(obj, recipient, message)
            % Sends a Flash SMS (class 0 message). Flash messages are displayed on the handset
            % immediately and are usually not saved on the SIM card. This function can send messages
            % of more than 160 characters, using SMS concatenation. ISO-latin accented characters
            % are supported. For sending messages with special unicode characters such as asian
            % characters and emoticons, use newMessage to create a new message and define
            % the content of using methods addText et addUnicodeData.
            %
            % @param recipient : a text string with the recipient phone number, either as a
            %         national number, or in international format starting with a plus sign
            % @param message : the text to be sent in the message
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(130508145, recipient, message);
        end

        function result = newMessage(obj, recipient)
            % Creates a new empty SMS message, to be configured and sent later on.
            %
            % @param recipient : a text string with the recipient phone number, either as a
            %         national number, or in international format starting with a plus sign
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Hs(1818764463, recipient);
        end

        function result = get_messages(obj)
            % Returns the list of messages received and not deleted. This function
            % will automatically decode concatenated SMS.
            %
            % @return an YSms object list.
            %
            % On failure, throws an exception or returns an empty list.
            result = obj.InvokeMethod_xH(-1658398096);
        end

        % //--- (end of YMessageBox accessors declaration)
    end
end
