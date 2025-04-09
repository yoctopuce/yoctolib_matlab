% YSdi12PortProxy: SDI12 port control interface
% 
% The YSdi12PortProxy class allows you to fully drive a Yoctopuce SDI12 port. It can be used to send
% and receive data, and to configure communication parameters (baud rate, bit count, parity, flow
% control and protocol). Note that Yoctopuce SDI12 ports are not exposed as virtual COM ports. They
% are meant to be used in the same way as all Yoctopuce devices.

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


% //--- (YSdi12Port declaration)
classdef YSdi12PortProxy < YoctoProxyAPI.YFunctionProxy
    % YSdi12PortProxy: SDI12 port control interface
    % 
    % The YSdi12PortProxy class allows you to fully drive a Yoctopuce SDI12 port. It can be used to send
    % and receive data, and to configure communication parameters (baud rate, bit count, parity, flow
    % control and protocol). Note that Yoctopuce SDI12 ports are not exposed as virtual COM ports. They
    % are meant to be used in the same way as all Yoctopuce devices.

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
    % //--- (end of YSdi12Port declaration)

    % //--- (YSdi12Port implementation)
    methods (Hidden)
        function obj = YSdi12PortProxy()
            % YSdi12PortProxy For internal use as System Object.
            % Use FindSdi12Port() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 830069866;
        end
    end

    methods (Static)
        function obj = FindSdi12Port(func)
            % FindSdi12Port Retrieve instances of YSdi12PortProxy
            obj = YoctoProxyAPI.YSdi12PortProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindSdi12Port to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(830069866);
        end
    end
    % //--- (end of YSdi12Port implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YSdi12PortProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Sdi12Port');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Sdi12Port', ...
                'PropertyList', {'VoltageLevel'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Sdi12Port settings', ...
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
        % //--- (YSdi12Port accessors declaration)

        function result = get_rxCount(obj)
            % Returns the total number of bytes received since last reset.
            %
            % @return an integer corresponding to the total number of bytes received since last reset
            %
            % On failure, throws an exception or returns YSdi12Port.RXCOUNT_INVALID.
            result = obj.InvokeMethod_D(316744996);
        end

        function result = get_txCount(obj)
            % Returns the total number of bytes transmitted since last reset.
            %
            % @return an integer corresponding to the total number of bytes transmitted since last reset
            %
            % On failure, throws an exception or returns YSdi12Port.TXCOUNT_INVALID.
            result = obj.InvokeMethod_D(1643863214);
        end

        function result = get_errCount(obj)
            % Returns the total number of communication errors detected since last reset.
            %
            % @return an integer corresponding to the total number of communication errors detected
            % since last reset
            %
            % On failure, throws an exception or returns YSdi12Port.ERRCOUNT_INVALID.
            result = obj.InvokeMethod_D(-1720504838);
        end

        function result = get_rxMsgCount(obj)
            % Returns the total number of messages received since last reset.
            %
            % @return an integer corresponding to the total number of messages received since last reset
            %
            % On failure, throws an exception or returns YSdi12Port.RXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(163009744);
        end

        function result = get_txMsgCount(obj)
            % Returns the total number of messages send since last reset.
            %
            % @return an integer corresponding to the total number of messages send since last reset
            %
            % On failure, throws an exception or returns YSdi12Port.TXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(-427101904);
        end

        function result = get_lastMsg(obj)
            % Returns the latest message fully received.
            %
            % @return a string corresponding to the latest message fully received
            %
            % On failure, throws an exception or returns YSdi12Port.LASTMSG_INVALID.
            result = obj.InvokeMethod_S(2062820646);
        end

        function result = get_currentJob(obj)
            % Returns the name of the job file currently in use.
            %
            % @return a string corresponding to the name of the job file currently in use
            %
            % On failure, throws an exception or returns YSdi12Port.CURRENTJOB_INVALID.
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
            % On failure, throws an exception or returns YSdi12Port.STARTUPJOB_INVALID.
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
            % On failure, throws an exception or returns YSdi12Port.JOBMAXTASK_INVALID.
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
            % On failure, throws an exception or returns YSdi12Port.JOBMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1527312014);
        end

        function result = get.JobMaxSize(obj)
            result = obj.GetPropInt32(577118636);
        end

        function result = get_protocol(obj)
            % Returns the type of protocol used over the serial line, as a string.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
            % "Char" for a continuous ASCII stream or
            % "Byte" for a continuous binary stream.
            %
            % @return a string corresponding to the type of protocol used over the serial line, as a string
            %
            % On failure, throws an exception or returns YSdi12Port.PROTOCOL_INVALID.
            result = obj.InvokeMethod_S(343190072);
        end

        function set_protocol(obj, newVal)
            % Changes the type of protocol used over the serial line.
            % Possible values are "Line" for ASCII messages separated by CR and/or LF,
            % "Frame:[timeout]ms" for binary messages separated by a delay time,
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
            % @return a value among YSdi12Port.VOLTAGELEVEL_OFF, YSdi12Port.VOLTAGELEVEL_TTL3V,
            % YSdi12Port.VOLTAGELEVEL_TTL3VR, YSdi12Port.VOLTAGELEVEL_TTL5V,
            % YSdi12Port.VOLTAGELEVEL_TTL5VR, YSdi12Port.VOLTAGELEVEL_RS232,
            % YSdi12Port.VOLTAGELEVEL_RS485, YSdi12Port.VOLTAGELEVEL_TTL1V8 and
            % YSdi12Port.VOLTAGELEVEL_SDI12 corresponding to the voltage level used on the serial line
            %
            % On failure, throws an exception or returns YSdi12Port.VOLTAGELEVEL_INVALID.
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
            % @param newval : a value among YSdi12Port.VOLTAGELEVEL_OFF,
            % YSdi12Port.VOLTAGELEVEL_TTL3V, YSdi12Port.VOLTAGELEVEL_TTL3VR,
            % YSdi12Port.VOLTAGELEVEL_TTL5V, YSdi12Port.VOLTAGELEVEL_TTL5VR,
            % YSdi12Port.VOLTAGELEVEL_RS232, YSdi12Port.VOLTAGELEVEL_RS485,
            % YSdi12Port.VOLTAGELEVEL_TTL1V8 and YSdi12Port.VOLTAGELEVEL_SDI12 corresponding to the
            % voltage type used on the serial line
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
            % "1200,7E1,Simplex". The string includes the baud rate, the number of data bits,
            % the parity, and the number of stop bits. The suffix "Simplex" denotes
            % the fact that transmission in both directions is multiplexed on the
            % same transmission line.
            %
            % @return a string corresponding to the serial port communication parameters, as a string such as
            %         "1200,7E1,Simplex"
            %
            % On failure, throws an exception or returns YSdi12Port.SERIALMODE_INVALID.
            result = obj.InvokeMethod_S(960644897);
        end

        function set_serialMode(obj, newVal)
            % Changes the serial port communication parameters, with a string such as
            % "1200,7E1,Simplex". The string includes the baud rate, the number of data bits,
            % the parity, and the number of stop bits. The suffix "Simplex" denotes
            % the fact that transmission in both directions is multiplexed on the
            % same transmission line.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the serial port communication parameters,
            % with a string such as
            %         "1200,7E1,Simplex"
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

        function result = querySdi12(obj, sensorAddr, cmd, maxWait)
            % Sends a SDI-12 query to the bus, and reads the sensor immediate reply.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param sensorAddr : the sensor address, as a string
            % @param cmd : the SDI12 query to send (without address and exclamation point)
            % @param maxWait : the maximum timeout to wait for a reply from sensor, in millisecond
            %
            % @return the reply returned by the sensor, without newline, as a string.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Sssd(-128632125, sensorAddr, cmd, maxWait);
        end

        function result = discoverSingleSensor(obj)
            % Sends a discovery command to the bus, and reads the sensor information reply.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            % This function work when only one sensor is connected.
            %
            % @return the reply returned by the sensor, as a YSdi12SensorInfo object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_R(1299005087);
        end

        function result = discoverAllSensors(obj)
            % Sends a discovery command to the bus, and reads all sensors information reply.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @return all the information from every connected sensor, as an array of YSdi12SensorInfo object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_xR(1064563653);
        end

        function result = readSensor(obj, sensorAddr, measCmd, maxWait)
            % Sends a mesurement command to the SDI-12 bus, and reads the sensor immediate reply.
            % The supported commands are:
            % M: Measurement start control
            % M1...M9: Additional measurement start command
            % D: Measurement reading control
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param sensorAddr : the sensor address, as a string
            % @param measCmd : the SDI12 query to send (without address and exclamation point)
            % @param maxWait : the maximum timeout to wait for a reply from sensor, in millisecond
            %
            % @return the reply returned by the sensor, without newline, as a list of float.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_xFssd(-1770406624, sensorAddr, measCmd, maxWait);
        end

        function result = changeAddress(obj, oldAddress, newAddress)
            % Changes the address of the selected sensor, and returns the sensor information with the new address.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param oldAddress : Actual sensor address, as a string
            % @param newAddress : New sensor address, as a string
            %
            % @return the sensor address and information , as a YSdi12SensorInfo object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Rss(654451080, oldAddress, newAddress);
        end

        function result = getSensorInformation(obj, sensorAddr)
            % Sends a information command to the bus, and reads sensors information selected.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param sensorAddr : Sensor address, as a string
            %
            % @return the reply returned by the sensor, as a YSdi12Port object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Rs(1111250120, sensorAddr);
        end

        function result = readConcurrentMeasurements(obj, sensorAddr)
            % Sends a information command to the bus, and reads sensors information selected.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param sensorAddr : Sensor address, as a string
            %
            % @return the reply returned by the sensor, as a YSdi12Port object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_xFs(-1973324862, sensorAddr);
        end

        function result = requestConcurrentMeasurements(obj, sensorAddr)
            % Sends a information command to the bus, and reads sensors information selected.
            % This function is intended to be used when the serial port is configured for 'SDI-12' protocol.
            %
            % @param sensorAddr : Sensor address, as a string
            %
            % @return the reply returned by the sensor, as a YSdi12Port object.
            %
            % On failure, throws an exception or returns an empty string.
            result = obj.InvokeMethod_Ds(94668784, sensorAddr);
        end

        function result = snoopMessagesEx(obj, maxWait, maxMsg)
            % Retrieves messages (both direction) in the SDI12 port buffer, starting at current position.
            %
            % If no message is found, the search waits for one up to the specified maximum timeout
            % (in milliseconds).
            %
            % @param maxWait : the maximum number of milliseconds to wait for a message if none is found
            %         in the receive buffer.
            % @param maxMsg : the maximum number of messages to be returned by the function; up to 254.
            %
            % @return an array of YSdi12SnoopingRecord objects containing the messages found, if any.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xXdd(-608541492, maxWait, maxMsg);
        end

        function result = snoopMessages(obj, maxWait)
            % Retrieves messages (both direction) in the SDI12 port buffer, starting at current position.
            %
            % If no message is found, the search waits for one up to the specified maximum timeout
            % (in milliseconds).
            %
            % @param maxWait : the maximum number of milliseconds to wait for a message if none is found
            %         in the receive buffer.
            %
            % @return an array of YSdi12SnoopingRecord objects containing the messages found, if any.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xXd(-1891888875, maxWait);
        end

        % //--- (end of YSdi12Port accessors declaration)
    end
end
