% YFirmwareUpdateProxy: Firmware update process control interface, returned by
% <tt>module.updateFirmware</tt> method.
% 
% The YFirmwareUpdateProxy class let you control the firmware update of a Yoctopuce module. This
% class should not be instantiate directly, but instances should be retrieved using the
% <tt>YModule</tt> method <tt>module.updateFirmware</tt>.

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


% //--- (YFirmwareUpdate declaration)
classdef YFirmwareUpdateProxy < matlab.System
    % YFirmwareUpdateProxy: Firmware update process control interface, returned by
    % <tt>module.updateFirmware</tt> method.
    % 
    % The YFirmwareUpdateProxy class let you control the firmware update of a Yoctopuce module. This
    % class should not be instantiate directly, but instances should be retrieved using the
    % <tt>YModule</tt> method <tt>module.updateFirmware</tt>.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YFirmwareUpdate declaration)

    methods
        % //--- (YFirmwareUpdate accessors declaration)

        function result = GetAllBootLoaders(obj)
            % Returns a list of all the modules in "firmware update" mode. Only devices
            % connected over USB are listed. For devices connected to a YoctoHub, you
            % must connect yourself to the YoctoHub web interface.
            %
            % @return an array of strings containing the serial numbers of devices in "firmware update" mode.
            result = obj.InvokeMethod_xS(649060993);
        end

        function result = CheckFirmware(obj, serial, path, minrelease)
            % Test if the byn file is valid for this module. It is possible to pass a directory instead of a file.
            % In that case, this method returns the path of the most recent appropriate byn file. This method will
            % ignore any firmware older than minrelease.
            %
            % @param serial : the serial number of the module to update
            % @param path : the path of a byn file or a directory that contains byn files
            % @param minrelease : a positive integer
            %
            % @return : the path of the byn file to use, or an empty string if no byn files matches
            % the requirement
            %
            % On failure, returns a string that starts with "error:".
            result = obj.InvokeMethod_Sssd(-1957478924, serial, path, minrelease);
        end

        function result = get_progress(obj)
            % Returns the progress of the firmware update, on a scale from 0 to 100. When the object is
            % instantiated, the progress is zero. The value is updated during the firmware update process until
            % the value of 100 is reached. The 100 value means that the firmware update was completed
            % successfully. If an error occurs during the firmware update, a negative value is returned, and the
            % error message can be retrieved with get_progressMessage.
            %
            % @return an integer in the range 0 to 100 (percentage of completion)
            %         or a negative error code in case of failure.
            result = obj.InvokeMethod_D(-64208605);
        end

        function result = get_progressMessage(obj)
            % Returns the last progress message of the firmware update process. If an error occurs during the
            % firmware update process, the error message is returned
            %
            % @return a string  with the latest progress message, or the error message.
            result = obj.InvokeMethod_S(194914835);
        end

        function result = startUpdate(obj)
            % Starts the firmware update process. This method starts the firmware update process in
            % background. This method
            % returns immediately. You can monitor the progress of the firmware update with the get_progress()
            % and get_progressMessage() methods.
            %
            % @return an integer in the range 0 to 100 (percentage of completion),
            %         or a negative error code in case of failure.
            %
            % On failure returns a negative error code.
            result = obj.InvokeMethod_D(-1041914131);
        end

        % //--- (end of YFirmwareUpdate accessors declaration)
    end
end
