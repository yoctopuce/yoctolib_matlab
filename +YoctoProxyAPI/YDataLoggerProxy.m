% YDataLoggerProxy: DataLogger control interface, available on most Yoctopuce sensors.
% 
% A non-volatile memory for storing ongoing measured data is available on most Yoctopuce sensors.
% Recording can happen automatically, without requiring a permanent connection to a computer. The
% YDataLoggerProxy class controls the global parameters of the internal data logger. Recording
% control (start/stop) as well as data retreival is done at sensor objects level.

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


% //--- (generated code: YDataLogger declaration)
classdef YDataLoggerProxy < YoctoProxyAPI.YFunctionProxy
    % YDataLoggerProxy: DataLogger control interface, available on most Yoctopuce sensors.
    % 
    % A non-volatile memory for storing ongoing measured data is available on most Yoctopuce sensors.
    % Recording can happen automatically, without requiring a permanent connection to a computer. The
    % YDataLoggerProxy class controls the global parameters of the internal data logger. Recording
    % control (start/stop) as well as data retreival is done at sensor objects level.

    properties (Transient, Nontunable)
        % Recording Current activation state of the data logger
        Recording (1,1) YoctoProxyAPI.EnumRecording
        % AutoStart Default activation state of the data logger on power up
        AutoStart (1,1) YoctoProxyAPI.EnumAutoStart
        % BeaconDriven True if the data logger is synchronised with the localization beacon
        BeaconDriven (1,1) YoctoProxyAPI.EnumBeaconDriven
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of generated code: YDataLogger declaration)

    % //--- (generated code: YDataLogger implementation)
    methods (Hidden)
        function obj = YDataLoggerProxy()
            % YDataLoggerProxy For internal use as System Object.
            % Use FindDataLogger() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 336082198;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindDataLogger(func)
            % FindDataLogger Retrieve instances of YDataLoggerProxy
            obj = YoctoProxyAPI.YDataLoggerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindDataLogger to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(336082198);
        end
    end
    % //--- (end of generated code: YDataLogger implementation)

    methods
        % //--- (generated code: YDataLogger accessors declaration)

        function result = get.Recording(obj)
            result = YoctoProxyAPI.EnumRecording(obj.GetPropInt32(966961648));
        end

        function set.Recording(obj, newVal)
            obj.Recording = newVal;
            obj.SetPropInt32(966961648, newVal);
        end

        function result = get.AutoStart(obj)
            result = YoctoProxyAPI.EnumAutoStart(obj.GetPropInt32(-1303422913));
        end

        function set.AutoStart(obj, newVal)
            obj.AutoStart = newVal;
            obj.SetPropInt32(-1303422913, newVal);
        end

        function result = get.BeaconDriven(obj)
            result = YoctoProxyAPI.EnumBeaconDriven(obj.GetPropInt32(-1131542791));
        end

        function set.BeaconDriven(obj, newVal)
            obj.BeaconDriven = newVal;
            obj.SetPropInt32(-1131542791, newVal);
        end

        % //--- (end of generated code: YDataLogger accessors declaration)
    end
end
