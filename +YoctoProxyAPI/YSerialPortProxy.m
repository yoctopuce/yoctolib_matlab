% YSerialPortProxy: serial port control interface, available for instance in the Yocto-RS232, the
% Yocto-RS485-V2 or the Yocto-Serial
% 
% The YSerialPortProxy class allows you to fully drive a Yoctopuce serial port. It can be used to
% send and receive data, and to configure communication parameters (baud rate, bit count, parity,
% flow control and protocol). Note that Yoctopuce serial ports are not exposed as virtual COM ports.
% They are meant to be used in the same way as all Yoctopuce devices.

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


% //--- (YSerialPort declaration)
classdef YSerialPortProxy < YoctoProxyAPI.YFunctionProxy
    % YSerialPortProxy: serial port control interface, available for instance in the Yocto-RS232, the
    % Yocto-RS485-V2 or the Yocto-Serial
    % 
    % The YSerialPortProxy class allows you to fully drive a Yoctopuce serial port. It can be used to
    % send and receive data, and to configure communication parameters (baud rate, bit count, parity,
    % flow control and protocol). Note that Yoctopuce serial ports are not exposed as virtual COM ports.
    % They are meant to be used in the same way as all Yoctopuce devices.

    properties (Transient, Nontunable)
        % StartupJob Job file to use when the device is powered on
        StartupJob (1,:) char
        % Protocol Type of protocol used over the serial line, as a string
        Protocol (1,:) char
        % VoltageLevel Voltage level used on the serial line
        VoltageLevel (1,1) YoctoProxyAPI.EnumVoltageLevel
        % SerialMode Serial port communication parameters, as a string such as
        SerialMode (1,:) char
    end

    properties (Transient, Nontunable, SetAccess = private)
        % JobMaxTask Maximum number of tasks in a job that the device can handle
        JobMaxTask (1,1) int32
        % JobMaxSize Maximum size allowed for job files
        JobMaxSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YSerialPort declaration)

    % //--- (YSerialPort implementation)
    methods (Hidden)
        function obj = YSerialPortProxy()
            % YSerialPortProxy For internal use as System Object.
            % Use FindSerialPort() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 176907600;
        end
    end

    methods (Static)
        function obj = FindSerialPort(func)
            % FindSerialPort Retrieve instances of YSerialPortProxy
            obj = YoctoProxyAPI.YSerialPortProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindSerialPort to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(176907600);
        end
    end
    % //--- (end of YSerialPort implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YSerialPortProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'SerialPort');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'SerialPort', ...
                'PropertyList', {'VoltageLevel'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'SerialPort settings', ...
                'PropertyList', {'StartupJob','JobMaxTask','JobMaxSize','Protocol','SerialMode'});
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
        % //--- (YSerialPort accessors declaration)

        function result = get_rxCount(obj)
            % Returns the total number of bytes received since last reset.
            %
            % @return an integer corresponding to the total number of bytes received since last reset
            %
            % On failure, throws an exception or returns YSerialPort.RXCOUNT_INVALID.
            result = obj.InvokeMethod_D(316744996);
        end

        function result = get_txCount(obj)
            % Returns the total number of bytes transmitted since last reset.
            %
            % @return an integer corresponding to the total number of bytes transmitted since last reset
            %
            % On failure, throws an exception or returns YSerialPort.TXCOUNT_INVALID.
            result = obj.InvokeMethod_D(1643863214);
        end

        function result = get_errCount(obj)
            % Returns the total number of communication errors detected since last reset.
            %
            % @return an integer corresponding to the total number of communication errors detected
            % since last reset
            %
            % On failure, throws an exception or returns YSerialPort.ERRCOUNT_INVALID.
            result = obj.InvokeMethod_D(-1720504838);
        end

        function result = get_rxMsgCount(obj)
            % Returns the total number of messages received since last reset.
            %
            % @return an integer corresponding to the total number of messages received since last reset
            %
            % On failure, throws an exception or returns YSerialPort.RXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(163009744);
        end

        function result = get_txMsgCount(obj)
            % Returns the total number of messages send since last reset.
            %
            % @return an integer corresponding to the total number of messages send since last reset
            %
            % On failure, throws an exception or returns YSerialPort.TXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(-427101904);
        end

        function result = get_lastMsg(obj)
            % Returns the latest message fully received (for Line, Frame and Modbus protocols).
            %
            % @return a string corresponding to the latest message fully received (for Line, Frame
            % and Modbus protocols)
            %
            % On failure, throws an exception or returns YSerialPort.LASTMSG_INVALID.
            result = obj.InvokeMethod_S(2062820646);
        end

        function result = get_currentJob(obj)
            % Returns the name of the job file currently in use.
            %
            % @return a string corresponding to the name of the job file currently in use
            %
            % On failure, throws an exception or returns YSerialPort.CURRENTJOB_INVALID.
            result = obj.InvokeMethod_S(1593232124);
        end

        function set_currentJob(obj, newVal)
            % Selects a job file to run immediately. If an empty string is
            % given as argument, stops running current job file.
            %
            % @param newval : a string
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1468962861, newVal);
        end

        function result = get_startupJob(obj)
            % Returns the job file to use when the device is powered on.
            %
            % @return a string corresponding to the job file to use when the device is powered on
            %
            % On failure, throws an exception or returns YSerialPort.STARTUPJOB_INVALID.
            result = obj.InvokeMethod_S(295729596);
        end

        function set_startupJob(obj, newVal)
            % Changes the job to use when the device is powered on.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the job to use when the device is powered on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(416820077, newVal);
        end

        function result = get.StartupJob(obj)
            result = obj.GetPropString(-1925555907);
        end

        function set.StartupJob(obj, newVal)
            obj.StartupJob = newVal;
            obj.SetPropString(-1925555907, newVal);
        end

        function result = get_jobMaxTask(obj)
            % Returns the maximum number of tasks in a job that the device can handle.
            %
            % @return an integer corresponding to the maximum number of tasks in a job that the device can handle
            %
            % On failure, throws an exception or returns YSerialPort.JOBMAXTASK_INVALID.
            result = obj.InvokeMethod_D(-32241525);
        end

        function result = get.JobMaxTask(obj)
            result = obj.GetPropInt32(-2015830301);
        end

        function result = get_jobMaxSize(obj)
            % Returns maximum size allowed for job files.
            %
            % @return an integer corresponding to maximum size allowed for job files
            %
            % On failure, throws an exception or returns YSerialPort.JOBMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1527312014);
        end

        function result = get.JobMaxSize(obj)
            result = obj.GetPropInt32(577118636);
        end

        function result = get_protocol(obj)
            % Returns the type of protocol used over the serial line, as a string.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "StxEtx" for ASCII messages delimited by STX/ETX codes,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
            % "Modbus-ASCII" for MODBUS messages in ASCII mode,
            % "Modbus-RTU" for MODBUS messages in RTU mode,
            % "Wiegand-ASCII" for Wiegand messages in ASCII mode,
            % "Wiegand-26","Wiegand-34", etc for Wiegand messages in byte mode,
            % "Char" for a continuous ASCII stream or
            % "Byte" for a continuous binary stream.
            %
            % @return a string corresponding to the type of protocol used over the serial line, as a string
            %
            % On failure, throws an exception or returns YSerialPort.PROTOCOL_INVALID.
            result = obj.InvokeMethod_S(343190072);
        end

        function set_protocol(obj, newVal)
            % Changes the type of protocol used over the serial line.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "StxEtx" for ASCII messages delimited by STX/ETX codes,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
            % "Modbus-ASCII" for MODBUS messages in ASCII mode,
            % "Modbus-RTU" for MODBUS messages in RTU mode,
            % "Wiegand-ASCII" for Wiegand messages in ASCII mode,
            % "Wiegand-26","Wiegand-34", etc for Wiegand messages in byte mode,
            % "Char" for a continuous ASCII stream or
            % "Byte" for a continuous binary stream.
            % The suffix "/[wait]ms" can be added to reduce the transmit rate so that there
            % is always at lest the specified number of milliseconds between each bytes sent.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the type of protocol used over the serial line
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1342454151, newVal);
        end

        function result = get.Protocol(obj)
            result = obj.GetPropString(834067994);
        end

        function set.Protocol(obj, newVal)
            obj.Protocol = newVal;
            obj.SetPropString(834067994, newVal);
        end

        function result = get_voltageLevel(obj)
            % Returns the voltage level used on the serial line.
            %
            % @return a value among YSerialPort.VOLTAGELEVEL_OFF, YSerialPort.VOLTAGELEVEL_TTL3V,
            % YSerialPort.VOLTAGELEVEL_TTL3VR, YSerialPort.VOLTAGELEVEL_TTL5V,
            % YSerialPort.VOLTAGELEVEL_TTL5VR, YSerialPort.VOLTAGELEVEL_RS232,
            % YSerialPort.VOLTAGELEVEL_RS485 and YSerialPort.VOLTAGELEVEL_TTL1V8 corresponding to the
            % voltage level used on the serial line
            %
            % On failure, throws an exception or returns YSerialPort.VOLTAGELEVEL_INVALID.
            result = YoctoProxyAPI.EnumVoltageLevel(obj.InvokeMethod_D(1576391098));
        end

        function set_voltageLevel(obj, newVal)
            % Changes the voltage type used on the serial line. Valid
            % values  will depend on the Yoctopuce device model featuring
            % the serial port feature.  Check your device documentation
            % to find out which values are valid for that specific model.
            % Trying to set an invalid value will have no effect.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YSerialPort.VOLTAGELEVEL_OFF,
            % YSerialPort.VOLTAGELEVEL_TTL3V, YSerialPort.VOLTAGELEVEL_TTL3VR,
            % YSerialPort.VOLTAGELEVEL_TTL5V, YSerialPort.VOLTAGELEVEL_TTL5VR,
            % YSerialPort.VOLTAGELEVEL_RS232, YSerialPort.VOLTAGELEVEL_RS485 and
            % YSerialPort.VOLTAGELEVEL_TTL1V8 corresponding to the voltage type used on the serial line
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1133541996, newVal);
        end

        function result = get.VoltageLevel(obj)
            result = YoctoProxyAPI.EnumVoltageLevel(obj.GetPropInt32(-1706330633));
        end

        function set.VoltageLevel(obj, newVal)
            obj.VoltageLevel = newVal;
            obj.SetPropInt32(-1706330633, newVal);
        end

        function result = get_serialMode(obj)
            % Returns the serial port communication parameters, as a string such as
            % "9600,8N1". The string includes the baud rate, the number of data bits,
            % the parity, and the number of stop bits. An optional suffix is included
            % if flow control is active: "CtsRts" for hardware handshake, "XOnXOff"
            % for logical flow control and "Simplex" for acquiring a shared bus using
            % the RTS line (as used by some RS485 adapters for instance).
            %
            % @return a string corresponding to the serial port communication parameters, as a string such as
            %         "9600,8N1"
            %
            % On failure, throws an exception or returns YSerialPort.SERIALMODE_INVALID.
            result = obj.InvokeMethod_S(960644897);
        end

        function set_serialMode(obj, newVal)
            % Changes the serial port communication parameters, with a string such as
            % "9600,8N1". The string includes the baud rate, the number of data bits,
            % the parity, and the number of stop bits. An optional suffix can be added
            % to enable flow control: "CtsRts" for hardware handshake, "XOnXOff"
            % for logical flow control and "Simplex" for acquiring a shared bus using
            % the RTS line (as used by some RS485 adapters for instance).
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the serial port communication parameters,
            % with a string such as
            %         "9600,8N1"
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(809113072, newVal);
        end

        function result = get.SerialMode(obj)
            result = obj.GetPropString(-556761289);
        end

        function set.SerialMode(obj, newVal)
            obj.SerialMode = newVal;
            obj.SetPropString(-556761289, newVal);
        end

        function result = readLine(obj)
            % Reads a single line (or message) from the receive buffer, starting at current stream position.
            % This function is intended to be used when the serial port is configured for a message protocol,
            % such as 'Line' mode or frame protocols.
            %
            % If data at current stream position is not available anymore in the receive buffer,
            % the function returns the oldest available line and moves the stream position just after.
            % If no new full line is received, the function returns an empty line.
            %
            % @return a string with a single line of text
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_S(-765057298);
        end

        function result = readMessages(obj, pattern, maxWait)
            % Searches for incoming messages in the serial port receive buffer matching a given pattern,
            % starting at current position. This function will only compare and return printable characters
            % in the message strings. Binary protocols are handled as hexadecimal strings.
            %
            % The search returns all messages matching the expression provided as argument in the buffer.
            % If no matching message is found, the search waits for one up to the specified maximum timeout
            % (in milliseconds).
            %
            % @param pattern : a limited regular expression describing the expected message format,
            %         or an empty string if all messages should be returned (no filtering).
            %         When using binary protocols, the format applies to the hexadecimal
            %         representation of the message.
            % @param maxWait : the maximum number of milliseconds to wait for a message if none is found
            %         in the receive buffer.
            %
            % @return an array of strings containing the messages found, if any.
            %         Binary messages are converted to hexadecimal representation.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xSsd(-1781240167, pattern, maxWait);
        end

        function result = read_seek(obj, absPos)
            % Changes the current internal stream position to the specified value. This function
            % does not affect the device, it only changes the value stored in the API object
            % for the next read operations.
            %
            % @param absPos : the absolute position index for next read operations.
            %
            % @return nothing.
            result = obj.InvokeMethod_Dd(-1595070625, absPos);
        end

        function result = read_tell(obj)
            % Returns the current absolute stream position pointer of the API object.
            %
            % @return the absolute position index for next read operations.
            result = obj.InvokeMethod_D(-1913831915);
        end

        function result = read_avail(obj)
            % Returns the number of bytes available to read in the input buffer starting from the
            % current absolute stream position pointer of the API object.
            %
            % @return the number of bytes available to read
            result = obj.InvokeMethod_D(1041368157);
        end

        function result = queryLine(obj, query, maxWait)
            % Sends a text line query to the serial port, and reads the reply, if any.
            % This function is intended to be used when the serial port is configured for 'Line' protocol.
            %
            % @param query : the line query to send (without CR/LF)
            % @param maxWait : the maximum number of milliseconds to wait for a reply.
            %
            % @return the next text line received after sending the text query, as a string.
            %         Additional lines can be obtained by calling readLine or readMessages.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Ssd(-341227556, query, maxWait);
        end

        function result = queryHex(obj, hexString, maxWait)
            % Sends a binary message to the serial port, and reads the reply, if any.
            % This function is intended to be used when the serial port is configured for
            % Frame-based protocol.
            %
            % @param hexString : the message to send, coded in hexadecimal
            % @param maxWait : the maximum number of milliseconds to wait for a reply.
            %
            % @return the next frame received after sending the message, as a hex string.
            %         Additional frames can be obtained by calling readHex or readMessages.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Ssd(1156404489, hexString, maxWait);
        end

        function result = uploadJob(obj, jobfile, jsonDef)
            % Saves the job definition string (JSON data) into a job file.
            % The job file can be later enabled using selectJob().
            %
            % @param jobfile : name of the job file to save on the device filesystem
            % @param jsonDef : a string containing a JSON definition of the job
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(985066379, jobfile, jsonDef);
        end

        function result = selectJob(obj, jobfile)
            % Load and start processing the specified job file. The file must have
            % been previously created using the user interface or uploaded on the
            % device filesystem using the uploadJob() function.
            %
            % @param jobfile : name of the job file (on the device filesystem)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1936070288, jobfile);
        end

        function result = reset(obj)
            % Clears the serial port buffer and resets counters to zero.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(323098917);
        end

        function result = writeByte(obj, code)
            % Sends a single byte to the serial port.
            %
            % @param code : the byte to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-741971664, code);
        end

        function result = writeStr(obj, text)
            % Sends an ASCII string to the serial port, as is.
            %
            % @param text : the text string to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(854720421, text);
        end

        function result = writeBin(obj, buff)
            % Sends a binary buffer to the serial port, as is.
            %
            % @param buff : the binary buffer to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(2026149263, buff);
        end

        function result = writeArray(obj, byteList)
            % Sends a byte sequence (provided as a list of bytes) to the serial port.
            %
            % @param byteList : a list of byte codes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxd(1790600172, byteList);
        end

        function result = writeHex(obj, hexString)
            % Sends a byte sequence (provided as a hexadecimal string) to the serial port.
            %
            % @param hexString : a string of hexadecimal byte codes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(1776112555, hexString);
        end

        function result = writeLine(obj, text)
            % Sends an ASCII string to the serial port, followed by a line break (CR LF).
            %
            % @param text : the text string to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(699144722, text);
        end

        function result = readByte(obj)
            % Reads one byte from the receive buffer, starting at current stream position.
            % If data at current stream position is not available anymore in the receive buffer,
            % or if there is no data available yet, the function returns YAPI_NO_MORE_DATA.
            %
            % @return the next byte
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(888922656);
        end

        function result = readStr(obj, nChars)
            % Reads data from the receive buffer as a string, starting at current stream position.
            % If data at current stream position is not available anymore in the receive buffer, the
            % function performs a short read.
            %
            % @param nChars : the maximum number of characters to read
            %
            % @return a string with receive buffer contents
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Sd(-1616009231, nChars);
        end

        function result = readBin(obj, nChars)
            % Reads data from the receive buffer as a binary buffer, starting at current stream position.
            % If data at current stream position is not available anymore in the receive buffer, the
            % function performs a short read.
            %
            % @param nChars : the maximum number of bytes to read
            %
            % @return a binary object with receive buffer contents
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Sd(-711406117, nChars);
        end

        function result = readArray(obj, nChars)
            % Reads data from the receive buffer as a list of bytes, starting at current stream position.
            % If data at current stream position is not available anymore in the receive buffer, the
            % function performs a short read.
            %
            % @param nChars : the maximum number of bytes to read
            %
            % @return a sequence of bytes with receive buffer contents
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDd(1346137617, nChars);
        end

        function result = readHex(obj, nBytes)
            % Reads data from the receive buffer as a hexadecimal string, starting at current stream position.
            % If data at current stream position is not available anymore in the receive buffer, the
            % function performs a short read.
            %
            % @param nBytes : the maximum number of bytes to read
            %
            % @return a string with receive buffer contents, encoded in hexadecimal
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Sd(-998175745, nBytes);
        end

        function result = set_RTS(obj, val)
            % Manually sets the state of the RTS line. This function has no effect when
            % hardware handshake is enabled, as the RTS line is driven automatically.
            %
            % @param val : 1 to turn RTS on, 0 to turn RTS off
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-104811964, val);
        end

        function result = get_CTS(obj)
            % Reads the level of the CTS line. The CTS line is usually driven by
            % the RTS signal of the connected serial device.
            %
            % @return 1 if the CTS line is high, 0 if the CTS line is low.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-626264431);
        end

        function result = snoopMessages(obj, maxWait)
            % Retrieves messages (both direction) in the serial port buffer, starting at current position.
            % This function will only compare and return printable characters in the message strings.
            % Binary protocols are handled as hexadecimal strings.
            %
            % If no message is found, the search waits for one up to the specified maximum timeout
            % (in milliseconds).
            %
            % @param maxWait : the maximum number of milliseconds to wait for a message if none is found
            %         in the receive buffer.
            %
            % @return an array of YSnoopingRecord objects containing the messages found, if any.
            %         Binary messages are converted to hexadecimal representation.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xTd(596205081, maxWait);
        end

        function result = writeStxEtx(obj, text)
            % Sends an ASCII string to the serial port, preceeded with an STX code and
            % followed by an ETX code.
            %
            % @param text : the text string to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(864615277, text);
        end

        function result = writeMODBUS(obj, hexString)
            % Sends a MODBUS message (provided as a hexadecimal string) to the serial port.
            % The message must start with the slave address. The MODBUS CRC/LRC is
            % automatically added by the function. This function does not wait for a reply.
            %
            % @param hexString : a hexadecimal message string, including device address but no CRC/LRC
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(1987706032, hexString);
        end

        function result = queryMODBUS(obj, slaveNo, pduBytes)
            % Sends a message to a specified MODBUS slave connected to the serial port, and reads the
            % reply, if any. The message is the PDU, provided as a vector of bytes.
            %
            % @param slaveNo : the address of the slave MODBUS device to query
            % @param pduBytes : the message to send (PDU), as a vector of bytes. The first byte of the
            %         PDU is the MODBUS function code.
            %
            % @return the received reply, as a vector of bytes.
            %
            % On failure, throws an exception or returns an empty array (or a MODBUS error reply).
            result = obj.InvokeMethod_xDdxd(-1992142193, slaveNo, pduBytes);
        end

        function result = modbusReadBits(obj, slaveNo, pduAddr, nBits)
            % Reads one or more contiguous internal bits (or coil status) from a MODBUS serial device.
            % This method uses the MODBUS function code 0x01 (Read Coils).
            %
            % @param slaveNo : the address of the slave MODBUS device to query
            % @param pduAddr : the relative address of the first bit/coil to read (zero-based)
            % @param nBits : the number of bits/coils to read
            %
            % @return a vector of integers, each corresponding to one bit.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDddd(2063452108, slaveNo, pduAddr, nBits);
        end

        function result = modbusReadInputBits(obj, slaveNo, pduAddr, nBits)
            % Reads one or more contiguous input bits (or discrete inputs) from a MODBUS serial device.
            % This method uses the MODBUS function code 0x02 (Read Discrete Inputs).
            %
            % @param slaveNo : the address of the slave MODBUS device to query
            % @param pduAddr : the relative address of the first bit/input to read (zero-based)
            % @param nBits : the number of bits/inputs to read
            %
            % @return a vector of integers, each corresponding to one bit.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDddd(1036353830, slaveNo, pduAddr, nBits);
        end

        function result = modbusReadRegisters(obj, slaveNo, pduAddr, nWords)
            % Reads one or more contiguous internal registers (holding registers) from a MODBUS serial device.
            % This method uses the MODBUS function code 0x03 (Read Holding Registers).
            %
            % @param slaveNo : the address of the slave MODBUS device to query
            % @param pduAddr : the relative address of the first holding register to read (zero-based)
            % @param nWords : the number of holding registers to read
            %
            % @return a vector of integers, each corresponding to one 16-bit register value.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDddd(1149279978, slaveNo, pduAddr, nWords);
        end

        function result = modbusReadInputRegisters(obj, slaveNo, pduAddr, nWords)
            % Reads one or more contiguous input registers (read-only registers) from a MODBUS serial device.
            % This method uses the MODBUS function code 0x04 (Read Input Registers).
            %
            % @param slaveNo : the address of the slave MODBUS device to query
            % @param pduAddr : the relative address of the first input register to read (zero-based)
            % @param nWords : the number of input registers to read
            %
            % @return a vector of integers, each corresponding to one 16-bit input value.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDddd(232467359, slaveNo, pduAddr, nWords);
        end

        function result = modbusWriteBit(obj, slaveNo, pduAddr, value)
            % Sets a single internal bit (or coil) on a MODBUS serial device.
            % This method uses the MODBUS function code 0x05 (Write Single Coil).
            %
            % @param slaveNo : the address of the slave MODBUS device to drive
            % @param pduAddr : the relative address of the bit/coil to set (zero-based)
            % @param value : the value to set (0 for OFF state, non-zero for ON state)
            %
            % @return the number of bits/coils affected on the device (1)
            %
            % On failure, throws an exception or returns zero.
            result = obj.InvokeMethod_Dddd(-1157259743, slaveNo, pduAddr, value);
        end

        function result = modbusWriteBits(obj, slaveNo, pduAddr, bits)
            % Sets several contiguous internal bits (or coils) on a MODBUS serial device.
            % This method uses the MODBUS function code 0x0f (Write Multiple Coils).
            %
            % @param slaveNo : the address of the slave MODBUS device to drive
            % @param pduAddr : the relative address of the first bit/coil to set (zero-based)
            % @param bits : the vector of bits to be set (one integer per bit)
            %
            % @return the number of bits/coils affected on the device
            %
            % On failure, throws an exception or returns zero.
            result = obj.InvokeMethod_Dddxd(-687482287, slaveNo, pduAddr, bits);
        end

        function result = modbusWriteRegister(obj, slaveNo, pduAddr, value)
            % Sets a single internal register (or holding register) on a MODBUS serial device.
            % This method uses the MODBUS function code 0x06 (Write Single Register).
            %
            % @param slaveNo : the address of the slave MODBUS device to drive
            % @param pduAddr : the relative address of the register to set (zero-based)
            % @param value : the 16 bit value to set
            %
            % @return the number of registers affected on the device (1)
            %
            % On failure, throws an exception or returns zero.
            result = obj.InvokeMethod_Dddd(1789190180, slaveNo, pduAddr, value);
        end

        function result = modbusWriteRegisters(obj, slaveNo, pduAddr, values)
            % Sets several contiguous internal registers (or holding registers) on a MODBUS serial device.
            % This method uses the MODBUS function code 0x10 (Write Multiple Registers).
            %
            % @param slaveNo : the address of the slave MODBUS device to drive
            % @param pduAddr : the relative address of the first internal register to set (zero-based)
            % @param values : the vector of 16 bit values to set
            %
            % @return the number of registers affected on the device
            %
            % On failure, throws an exception or returns zero.
            result = obj.InvokeMethod_Dddxd(500147086, slaveNo, pduAddr, values);
        end

        function result = modbusWriteAndReadRegisters(obj, slaveNo, pduWriteAddr, values, pduReadAddr, nReadWords)
            % Sets several contiguous internal registers (holding registers) on a MODBUS serial device,
            % then performs a contiguous read of a set of (possibly different) internal registers.
            % This method uses the MODBUS function code 0x17 (Read/Write Multiple Registers).
            %
            % @param slaveNo : the address of the slave MODBUS device to drive
            % @param pduWriteAddr : the relative address of the first internal register to set (zero-based)
            % @param values : the vector of 16 bit values to set
            % @param pduReadAddr : the relative address of the first internal register to read (zero-based)
            % @param nReadWords : the number of 16 bit values to read
            %
            % @return a vector of integers, each corresponding to one 16-bit register value read.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDddxddd(-1609629652, slaveNo, pduWriteAddr, values, pduReadAddr, nReadWords);
        end

        % //--- (end of YSerialPort accessors declaration)
    end
end
