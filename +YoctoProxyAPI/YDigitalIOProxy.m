% YDigitalIOProxy: digital IO port control interface, available for instance in the Yocto-IO or the
% Yocto-Maxi-IO-V2
% 
% The YDigitalIOProxy class allows you drive a Yoctopuce digital input/output port. It can be used to
% set up the direction of each channel, to read the state of each channel and to switch the state of
% each channel configures as an output. You can work on all channels at once, or one by one. Most
% functions use a binary representation for channels where bit 0 matches channel #0 , bit 1 matches
% channel #1 and so on. If you are not familiar with numbers binary representation, you will find
% more information here: <tt>https://en.wikipedia.org/wiki/Binary_number#Representation</tt>. It is
% also possible to automatically generate short pulses of a determined duration. Electrical behavior
% of each I/O can be modified (open drain and reverse polarity).

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


% //--- (YDigitalIO declaration)
classdef YDigitalIOProxy < YoctoProxyAPI.YFunctionProxy
    % YDigitalIOProxy: digital IO port control interface, available for instance in the Yocto-IO or the
    % Yocto-Maxi-IO-V2
    % 
    % The YDigitalIOProxy class allows you drive a Yoctopuce digital input/output port. It can be used to
    % set up the direction of each channel, to read the state of each channel and to switch the state of
    % each channel configures as an output. You can work on all channels at once, or one by one. Most
    % functions use a binary representation for channels where bit 0 matches channel #0 , bit 1 matches
    % channel #1 and so on. If you are not familiar with numbers binary representation, you will find
    % more information here: <tt>https://en.wikipedia.org/wiki/Binary_number#Representation</tt>. It is
    % also possible to automatically generate short pulses of a determined duration. Electrical behavior
    % of each I/O can be modified (open drain and reverse polarity).

    properties (Transient, Nontunable)
        % PortState Digital IO port state as an integer with each bit
        PortState (1,1) int32
        % PortDirection I/O direction of all channels of the port (bitmap): 0 makes a bit an input, 1 makes it an output
        PortDirection (1,1) int32
        % PortOpenDrain Electrical interface for each bit of the port
        PortOpenDrain (1,1) int32
        % PortPolarity Polarity of all the bits of the port
        PortPolarity (1,1) int32
        % OutputVoltage Voltage source used to drive output bits
        OutputVoltage (1,1) YoctoProxyAPI.EnumOutputVoltage
    end

    properties (Transient, Nontunable, SetAccess = private)
        % PortSize Number of bits (i.e
        PortSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YDigitalIO declaration)

    % //--- (YDigitalIO implementation)
    methods (Hidden)
        function obj = YDigitalIOProxy()
            % YDigitalIOProxy For internal use as System Object.
            % Use FindDigitalIO() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1025204820;
            obj.numInputs = 1;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindDigitalIO(func)
            % FindDigitalIO Retrieve instances of YDigitalIOProxy
            obj = YoctoProxyAPI.YDigitalIOProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindDigitalIO to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1025204820);
        end
    end
    % //--- (end of YDigitalIO implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YDigitalIOProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'DigitalIO');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'DigitalIO', ...
                'PropertyList', {'PortState','PortDirection'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'DigitalIO settings', ...
                'PropertyList', {'PortOpenDrain','PortPolarity','PortSize','OutputVoltage'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(-760978440, varargin{1});
            end
            if nargout >= 1
                varargout{1} = obj.GetPropInt32(-760978440);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int32';
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'PortState';
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'PortState';
        end
    end

    methods
        % //--- (YDigitalIO accessors declaration)

        function result = get_portState(obj)
            % Returns the digital IO port state as an integer with each bit
            % representing a channel.
            % value 0 = 0b00000000 -> all channels are OFF
            % value 1 = 0b00000001 -> channel #0 is ON
            % value 2 = 0b00000010 -> channel #1 is ON
            % value 3 = 0b00000011 -> channels #0 and #1 are ON
            % value 4 = 0b00000100 -> channel #2 is ON
            % and so on...
            %
            % @return an integer corresponding to the digital IO port state as an integer with each bit
            %         representing a channel
            %
            % On failure, throws an exception or returns YDigitalIO.PORTSTATE_INVALID.
            result = obj.InvokeMethod_D(-625075696);
        end

        function set_portState(obj, newVal)
            % Changes the state of all digital IO port's channels at once: the parameter
            % is an integer where each bit represents a channel, with bit 0 matching channel #0.
            % To set all channels to  0 -> 0b00000000 -> parameter = 0
            % To set channel #0 to 1 -> 0b00000001 -> parameter =  1
            % To set channel #1 to  1 -> 0b00000010 -> parameter = 2
            % To set channel #0 and #1 -> 0b00000011 -> parameter =  3
            % To set channel #2 to 1 -> 0b00000100 -> parameter =  4
            % an so on....
            % Only channels configured as outputs will be affecter, according to the value
            % configured using set_portDirection.
            %
            % @param newval : an integer corresponding to the state of all digital IO port's channels
            % at once: the parameter
            %         is an integer where each bit represents a channel, with bit 0 matching channel #0
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(802078964, newVal);
        end

        function result = get.PortState(obj)
            result = obj.GetPropInt32(-760978440);
        end

        function set.PortState(obj, newVal)
            obj.PortState = newVal;
            obj.SetPropInt32(-760978440, newVal);
        end

        function result = get_portDirection(obj)
            % Returns the I/O direction of all channels of the port (bitmap): 0 makes a bit an input,
            % 1 makes it an output.
            %
            % @return an integer corresponding to the I/O direction of all channels of the port
            % (bitmap): 0 makes a bit an input, 1 makes it an output
            %
            % On failure, throws an exception or returns YDigitalIO.PORTDIRECTION_INVALID.
            result = obj.InvokeMethod_D(1444506847);
        end

        function set_portDirection(obj, newVal)
            % Changes the I/O direction of all channels of the port (bitmap): 0 makes a bit an input,
            % 1 makes it an output.
            % Remember to call the saveToFlash() method  to make sure the setting is kept after a reboot.
            %
            % @param newval : an integer corresponding to the I/O direction of all channels of the
            % port (bitmap): 0 makes a bit an input, 1 makes it an output
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1755481345, newVal);
        end

        function result = get.PortDirection(obj)
            result = obj.GetPropInt32(1600523236);
        end

        function set.PortDirection(obj, newVal)
            obj.PortDirection = newVal;
            obj.SetPropInt32(1600523236, newVal);
        end

        function result = get_portOpenDrain(obj)
            % Returns the electrical interface for each bit of the port. For each bit set to 0  the
            % matching I/O works in the regular,
            % intuitive way, for each bit set to 1, the I/O works in reverse mode.
            %
            % @return an integer corresponding to the electrical interface for each bit of the port
            %
            % On failure, throws an exception or returns YDigitalIO.PORTOPENDRAIN_INVALID.
            result = obj.InvokeMethod_D(-233799099);
        end

        function set_portOpenDrain(obj, newVal)
            % Changes the electrical interface for each bit of the port. 0 makes a bit a regular
            % input/output, 1 makes
            % it an open-drain (open-collector) input/output. Remember to call the
            % saveToFlash() method  to make sure the setting is kept after a reboot.
            %
            % @param newval : an integer corresponding to the electrical interface for each bit of the port
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(861181029, newVal);
        end

        function result = get.PortOpenDrain(obj)
            result = obj.GetPropInt32(2025502540);
        end

        function set.PortOpenDrain(obj, newVal)
            obj.PortOpenDrain = newVal;
            obj.SetPropInt32(2025502540, newVal);
        end

        function result = get_portPolarity(obj)
            % Returns the polarity of all the bits of the port.  For each bit set to 0, the matching
            % I/O works the regular,
            % intuitive way; for each bit set to 1, the I/O works in reverse mode.
            %
            % @return an integer corresponding to the polarity of all the bits of the port
            %
            % On failure, throws an exception or returns YDigitalIO.PORTPOLARITY_INVALID.
            result = obj.InvokeMethod_D(-1007038570);
        end

        function set_portPolarity(obj, newVal)
            % Changes the polarity of all the bits of the port: For each bit set to 0, the matching
            % I/O works the regular,
            % intuitive way; for each bit set to 1, the I/O works in reverse mode.
            % Remember to call the saveToFlash() method  to make sure the setting will be kept after a reboot.
            %
            % @param newval : an integer corresponding to the polarity of all the bits of the port:
            % For each bit set to 0, the matching I/O works the regular,
            %         intuitive way; for each bit set to 1, the I/O works in reverse mode
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-576953280, newVal);
        end

        function result = get.PortPolarity(obj)
            result = obj.GetPropInt32(-864581083);
        end

        function set.PortPolarity(obj, newVal)
            obj.PortPolarity = newVal;
            obj.SetPropInt32(-864581083, newVal);
        end

        function result = get_portDiags(obj)
            % Returns the port state diagnostics. Bit 0 indicates a shortcut on output 0, etc.
            % Bit 8 indicates a power failure, and bit 9 signals overheating (overcurrent).
            % During normal use, all diagnostic bits should stay clear.
            %
            % @return an integer corresponding to the port state diagnostics
            %
            % On failure, throws an exception or returns YDigitalIO.PORTDIAGS_INVALID.
            result = obj.InvokeMethod_D(-1651994970);
        end

        function result = get_portSize(obj)
            % Returns the number of bits (i.e. channels)implemented in the I/O port.
            %
            % @return an integer corresponding to the number of bits (i.e
            %
            % On failure, throws an exception or returns YDigitalIO.PORTSIZE_INVALID.
            result = obj.InvokeMethod_D(2089348470);
        end

        function result = get.PortSize(obj)
            result = obj.GetPropInt32(1911860782);
        end

        function result = get_outputVoltage(obj)
            % Returns the voltage source used to drive output bits.
            %
            % @return a value among YDigitalIO.OUTPUTVOLTAGE_USB_5V, YDigitalIO.OUTPUTVOLTAGE_USB_3V
            % and YDigitalIO.OUTPUTVOLTAGE_EXT_V corresponding to the voltage source used to drive output bits
            %
            % On failure, throws an exception or returns YDigitalIO.OUTPUTVOLTAGE_INVALID.
            result = YoctoProxyAPI.EnumOutputVoltage(obj.InvokeMethod_D(723885981));
        end

        function set_outputVoltage(obj, newVal)
            % Changes the voltage source used to drive output bits.
            % Remember to call the saveToFlash() method  to make sure the setting is kept after a reboot.
            %
            % @param newval : a value among YDigitalIO.OUTPUTVOLTAGE_USB_5V,
            % YDigitalIO.OUTPUTVOLTAGE_USB_3V and YDigitalIO.OUTPUTVOLTAGE_EXT_V corresponding to the
            % voltage source used to drive output bits
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-362706499, newVal);
        end

        function result = get.OutputVoltage(obj)
            result = YoctoProxyAPI.EnumOutputVoltage(obj.GetPropInt32(1555385540));
        end

        function set.OutputVoltage(obj, newVal)
            obj.OutputVoltage = newVal;
            obj.SetPropInt32(1555385540, newVal);
        end

        function result = set_bitState(obj, bitno, bitstate)
            % Sets a single bit (i.e. channel) of the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0
            % @param bitstate : the state of the bit (1 or 0)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-2045692564, bitno, bitstate);
        end

        function result = get_bitState(obj, bitno)
            % Returns the state of a single bit (i.e. channel)  of the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0
            %
            % @return the bit state (0 or 1)
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(59978430, bitno);
        end

        function result = toggle_bitState(obj, bitno)
            % Reverts a single bit (i.e. channel) of the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-947704724, bitno);
        end

        function result = set_bitDirection(obj, bitno, bitdirection)
            % Changes  the direction of a single bit (i.e. channel) from the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0
            % @param bitdirection : direction to set, 0 makes the bit an input, 1 makes it an output.
            %         Remember to call the   saveToFlash() method to make sure the setting is kept after a reboot.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(1996830699, bitno, bitdirection);
        end

        function result = get_bitDirection(obj, bitno)
            % Returns the direction of a single bit (i.e. channel) from the I/O port (0 means the bit
            % is an input, 1  an output).
            %
            % @param bitno : the bit number; lowest bit has index 0
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-146326613, bitno);
        end

        function result = set_bitPolarity(obj, bitno, bitpolarity)
            % Changes the polarity of a single bit from the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0.
            % @param bitpolarity : polarity to set, 0 makes the I/O work in regular mode, 1 makes the
            % I/O  works in reverse mode.
            %         Remember to call the   saveToFlash() method to make sure the setting is kept after a reboot.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1512195585, bitno, bitpolarity);
        end

        function result = get_bitPolarity(obj, bitno)
            % Returns the polarity of a single bit from the I/O port (0 means the I/O works in
            % regular mode, 1 means the I/O  works in reverse mode).
            %
            % @param bitno : the bit number; lowest bit has index 0
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-43159685, bitno);
        end

        function result = set_bitOpenDrain(obj, bitno, opendrain)
            % Changes  the electrical interface of a single bit from the I/O port.
            %
            % @param bitno : the bit number; lowest bit has index 0
            % @param opendrain : 0 makes a bit a regular input/output, 1 makes
            %         it an open-drain (open-collector) input/output. Remember to call the
            %         saveToFlash() method to make sure the setting is kept after a reboot.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1155973619, bitno, opendrain);
        end

        function result = get_bitOpenDrain(obj, bitno)
            % Returns the type of electrical interface of a single bit from the I/O port. (0 means
            % the bit is an input, 1  an output).
            %
            % @param bitno : the bit number; lowest bit has index 0
            %
            % @return   0 means the a bit is a regular input/output, 1 means the bit is an open-drain
            %         (open-collector) input/output.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-415676385, bitno);
        end

        function result = pulse(obj, bitno, ms_duration)
            % Triggers a pulse on a single bit for a specified duration. The specified bit
            % will be turned to 1, and then back to 0 after the given duration.
            %
            % @param bitno : the bit number; lowest bit has index 0
            % @param ms_duration : desired pulse duration in milliseconds. Be aware that the device time
            %         resolution is not guaranteed up to the millisecond.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-841230266, bitno, ms_duration);
        end

        function result = delayedPulse(obj, bitno, ms_delay, ms_duration)
            % Schedules a pulse on a single bit for a specified duration. The specified bit
            % will be turned to 1, and then back to 0 after the given duration.
            %
            % @param bitno : the bit number; lowest bit has index 0
            % @param ms_delay : waiting time before the pulse, in milliseconds
            % @param ms_duration : desired pulse duration in milliseconds. Be aware that the device time
            %         resolution is not guaranteed up to the millisecond.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dddd(1525073260, bitno, ms_delay, ms_duration);
        end

        % //--- (end of YDigitalIO accessors declaration)
    end
end
