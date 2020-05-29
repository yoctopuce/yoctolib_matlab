% YI2cPortProxy: I2C port control interface, available for instance in the Yocto-I2C
% 
% The YI2cPortProxy classe allows you to fully drive a Yoctopuce I2C port. It can be used to send and
% receive data, and to configure communication parameters (baud rate, etc). Note that Yoctopuce I2C
% ports are not exposed as virtual COM ports. They are meant to be used in the same way as all
% Yoctopuce devices.

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


% //--- (YI2cPort declaration)
classdef YI2cPortProxy < YoctoProxyAPI.YFunctionProxy
    % YI2cPortProxy: I2C port control interface, available for instance in the Yocto-I2C
    % 
    % The YI2cPortProxy classe allows you to fully drive a Yoctopuce I2C port. It can be used to send and
    % receive data, and to configure communication parameters (baud rate, etc). Note that Yoctopuce I2C
    % ports are not exposed as virtual COM ports. They are meant to be used in the same way as all
    % Yoctopuce devices.

    properties (Transient, Nontunable)
        % StartupJob Job file to use when the device is powered on
        StartupJob (1,:) char
        % Protocol Type of protocol used to send I2C messages, as a string
        Protocol (1,:) char
        % I2cVoltageLevel Voltage level used on the I2C bus
        I2cVoltageLevel (1,1) YoctoProxyAPI.EnumI2cVoltageLevel
        % I2cMode I2C port communication parameters, as a string such as
        I2cMode (1,:) char
    end

    properties (Transient, Nontunable, SetAccess = private)
        % JobMaxTask Maximum number of tasks in a job that the device can handle
        JobMaxTask (1,1) int32
        % JobMaxSize Maximum size allowed for job files
        JobMaxSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YI2cPort declaration)

    % //--- (YI2cPort implementation)
    methods (Hidden)
        function obj = YI2cPortProxy()
            % YI2cPortProxy For internal use as System Object.
            % Use FindI2cPort() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 423127297;
        end
    end

    methods (Static)
        function obj = FindI2cPort(func)
            % FindI2cPort Retrieve instances of YI2cPortProxy
            obj = YoctoProxyAPI.YI2cPortProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindI2cPort to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(423127297);
        end
    end
    % //--- (end of YI2cPort implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YI2cPortProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'I2cPort');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'I2cPort', ...
                'PropertyList', {'I2cVoltageLevel'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'I2cPort settings', ...
                'PropertyList', {'StartupJob','JobMaxTask','JobMaxSize','Protocol','I2cMode'});
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
        % //--- (YI2cPort accessors declaration)

        function result = get_rxCount(obj)
            % Returns the total number of bytes received since last reset.
            %
            % @return an integer corresponding to the total number of bytes received since last reset
            %
            % On failure, throws an exception or returns Y_RXCOUNT_INVALID.
            result = obj.InvokeMethod_D(316744996);
        end

        function result = get_txCount(obj)
            % Returns the total number of bytes transmitted since last reset.
            %
            % @return an integer corresponding to the total number of bytes transmitted since last reset
            %
            % On failure, throws an exception or returns Y_TXCOUNT_INVALID.
            result = obj.InvokeMethod_D(1643863214);
        end

        function result = get_errCount(obj)
            % Returns the total number of communication errors detected since last reset.
            %
            % @return an integer corresponding to the total number of communication errors detected
            % since last reset
            %
            % On failure, throws an exception or returns Y_ERRCOUNT_INVALID.
            result = obj.InvokeMethod_D(-1720504838);
        end

        function result = get_rxMsgCount(obj)
            % Returns the total number of messages received since last reset.
            %
            % @return an integer corresponding to the total number of messages received since last reset
            %
            % On failure, throws an exception or returns Y_RXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(163009744);
        end

        function result = get_txMsgCount(obj)
            % Returns the total number of messages send since last reset.
            %
            % @return an integer corresponding to the total number of messages send since last reset
            %
            % On failure, throws an exception or returns Y_TXMSGCOUNT_INVALID.
            result = obj.InvokeMethod_D(-427101904);
        end

        function result = get_lastMsg(obj)
            % Returns the latest message fully received (for Line and Frame protocols).
            %
            % @return a string corresponding to the latest message fully received (for Line and Frame protocols)
            %
            % On failure, throws an exception or returns Y_LASTMSG_INVALID.
            result = obj.InvokeMethod_S(2062820646);
        end

        function result = get_currentJob(obj)
            % Returns the name of the job file currently in use.
            %
            % @return a string corresponding to the name of the job file currently in use
            %
            % On failure, throws an exception or returns Y_CURRENTJOB_INVALID.
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
            % On failure, throws an exception or returns Y_STARTUPJOB_INVALID.
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
            % On failure, throws an exception or returns Y_JOBMAXTASK_INVALID.
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
            % On failure, throws an exception or returns Y_JOBMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1527312014);
        end

        function result = get.JobMaxSize(obj)
            result = obj.GetPropInt32(577118636);
        end

        function result = get_protocol(obj)
            % Returns the type of protocol used to send I2C messages, as a string.
            % Possible values are
            % "Line" for messages separated by LF or
            % "Char" for continuous stream of codes.
            %
            % @return a string corresponding to the type of protocol used to send I2C messages, as a string
            %
            % On failure, throws an exception or returns Y_PROTOCOL_INVALID.
            result = obj.InvokeMethod_S(343190072);
        end

        function set_protocol(obj, newVal)
            % Changes the type of protocol used to send I2C messages.
            % Possible values are
            % "Line" for messages separated by LF or
            % "Char" for continuous stream of codes.
            % The suffix "/[wait]ms" can be added to reduce the transmit rate so that there
            % is always at lest the specified number of milliseconds between each message sent.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the type of protocol used to send I2C messages
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

        function result = get_i2cVoltageLevel(obj)
            % Returns the voltage level used on the I2C bus.
            %
            % @return a value among Y_I2CVOLTAGELEVEL_OFF, Y_I2CVOLTAGELEVEL_3V3 and
            % Y_I2CVOLTAGELEVEL_1V8 corresponding to the voltage level used on the I2C bus
            %
            % On failure, throws an exception or returns Y_I2CVOLTAGELEVEL_INVALID.
            result = YoctoProxyAPI.EnumI2cVoltageLevel(obj.InvokeMethod_D(746157149));
        end

        function set_i2cVoltageLevel(obj, newVal)
            % Changes the voltage level used on the I2C bus.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among Y_I2CVOLTAGELEVEL_OFF, Y_I2CVOLTAGELEVEL_3V3 and
            % Y_I2CVOLTAGELEVEL_1V8 corresponding to the voltage level used on the I2C bus
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1309295298, newVal);
        end

        function result = get.I2cVoltageLevel(obj)
            result = YoctoProxyAPI.EnumI2cVoltageLevel(obj.GetPropInt32(1933961956));
        end

        function set.I2cVoltageLevel(obj, newVal)
            obj.I2cVoltageLevel = newVal;
            obj.SetPropInt32(1933961956, newVal);
        end

        function result = get_i2cMode(obj)
            % Returns the I2C port communication parameters, as a string such as
            % "400kbps,2000ms,NoRestart". The string includes the baud rate, the
            % recovery delay after communications errors, and if needed the option
            % NoRestart to use a Stop/Start sequence instead of the
            % Restart state when performing read on the I2C bus.
            %
            % @return a string corresponding to the I2C port communication parameters, as a string such as
            %         "400kbps,2000ms,NoRestart"
            %
            % On failure, throws an exception or returns Y_I2CMODE_INVALID.
            result = obj.InvokeMethod_S(-634742325);
        end

        function set_i2cMode(obj, newVal)
            % Changes the I2C port communication parameters, with a string such as
            % "400kbps,2000ms". The string includes the baud rate, the
            % recovery delay after communications errors, and if needed the option
            % NoRestart to use a Stop/Start sequence instead of the
            % Restart state when performing read on the I2C bus.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the I2C port communication parameters, with a
            % string such as
            %         "400kbps,2000ms"
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1778748081, newVal);
        end

        function result = get.I2cMode(obj)
            result = obj.GetPropString(-849120410);
        end

        function set.I2cMode(obj, newVal)
            obj.I2cMode = newVal;
            obj.SetPropString(-849120410, newVal);
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

        function result = i2cSendBin(obj, slaveAddr, buff)
            % Sends a one-way message (provided as a a binary buffer) to a device on the I2C bus.
            % This function checks and reports communication errors on the I2C bus.
            %
            % @param slaveAddr : the 7-bit address of the slave device (without the direction bit)
            % @param buff : the binary buffer to be sent
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dds(726018167, slaveAddr, buff);
        end

        function result = i2cSendArray(obj, slaveAddr, vector<int>(values))
            % Sends a one-way message (provided as a list of integer) to a device on the I2C bus.
            % This function checks and reports communication errors on the I2C bus.
            %
            % @param slaveAddr : the 7-bit address of the slave device (without the direction bit)
            % @param values : a list of data bytes to be sent
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddxd(-1678174056, slaveAddr, vector<int>(values));
        end

        function result = i2cSendAndReceiveBin(obj, slaveAddr, buff, rcvCount)
            % Sends a one-way message (provided as a a binary buffer) to a device on the I2C bus,
            % then read back the specified number of bytes from device.
            % This function checks and reports communication errors on the I2C bus.
            %
            % @param slaveAddr : the 7-bit address of the slave device (without the direction bit)
            % @param buff : the binary buffer to be sent
            % @param rcvCount : the number of bytes to receive once the data bytes are sent
            %
            % @return a list of bytes with the data received from slave device.
            %
            % On failure, throws an exception or returns an empty binary buffer.
            result = obj.InvokeMethod_Sdsd(112074765, slaveAddr, buff, rcvCount);
        end

        function result = i2cSendAndReceiveArray(obj, slaveAddr, vector<int>(values), rcvCount)
            % Sends a one-way message (provided as a list of integer) to a device on the I2C bus,
            % then read back the specified number of bytes from device.
            % This function checks and reports communication errors on the I2C bus.
            %
            % @param slaveAddr : the 7-bit address of the slave device (without the direction bit)
            % @param values : a list of data bytes to be sent
            % @param rcvCount : the number of bytes to receive once the data bytes are sent
            %
            % @return a list of bytes with the data received from slave device.
            %
            % On failure, throws an exception or returns an empty array.
            result = obj.InvokeMethod_xDdxdd(-544170875, slaveAddr, vector<int>(values), rcvCount);
        end

        function result = writeStr(obj, codes)
            % Sends a text-encoded I2C code stream to the I2C bus, as is.
            % An I2C code stream is a string made of hexadecimal data bytes,
            % but that may also include the I2C state transitions code:
            % "{S}" to emit a start condition,
            % "{R}" for a repeated start condition,
            % "{P}" for a stop condition,
            % "xx" for receiving a data byte,
            % "{A}" to ack a data byte received and
            % "{N}" to nack a data byte received.
            % If a newline ("\n") is included in the stream, the message
            % will be terminated and a newline will also be added to the
            % receive stream.
            %
            % @param codes : the code stream to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(854720421, codes);
        end

        function result = writeLine(obj, codes)
            % Sends a text-encoded I2C code stream to the I2C bus, and terminate
            % the message en relâchant le bus.
            % An I2C code stream is a string made of hexadecimal data bytes,
            % but that may also include the I2C state transitions code:
            % "{S}" to emit a start condition,
            % "{R}" for a repeated start condition,
            % "{P}" for a stop condition,
            % "xx" for receiving a data byte,
            % "{A}" to ack a data byte received and
            % "{N}" to nack a data byte received.
            % At the end of the stream, a stop condition is added if missing
            % and a newline is added to the receive buffer as well.
            %
            % @param codes : the code stream to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(699144722, codes);
        end

        function result = writeByte(obj, code)
            % Sends a single byte to the I2C bus. Depending on the I2C bus state, the byte
            % will be interpreted as an address byte or a data byte.
            %
            % @param code : the byte to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dd(-741971664, code);
        end

        function result = writeHex(obj, hexString)
            % Sends a byte sequence (provided as a hexadecimal string) to the I2C bus.
            % Depending on the I2C bus state, the first byte will be interpreted as an
            % address byte or a data byte.
            %
            % @param hexString : a string of hexadecimal byte codes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(1776112555, hexString);
        end

        function result = writeBin(obj, buff)
            % Sends a binary buffer to the I2C bus, as is.
            % Depending on the I2C bus state, the first byte will be interpreted
            % as an address byte or a data byte.
            %
            % @param buff : the binary buffer to send
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(2026149263, buff);
        end

        function result = writeArray(obj, vector<int>(byteList))
            % Sends a byte sequence (provided as a list of bytes) to the I2C bus.
            % Depending on the I2C bus state, the first byte will be interpreted as an
            % address byte or a data byte.
            %
            % @param byteList : a list of byte codes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxd(1790600172, vector<int>(byteList));
        end

        % //--- (end of YI2cPort accessors declaration)
    end
end
