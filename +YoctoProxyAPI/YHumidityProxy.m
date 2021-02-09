% YHumidityProxy: humidity sensor control interface, available for instance in the Yocto-CO2-V2, the
% Yocto-Meteo-V2 or the Yocto-VOC-V3
% 
% The YHumidityProxy class allows you to read and configure Yoctopuce humidity sensors. It inherits
% from <tt>YSensor</tt> class the core functions to read measurements, to register callback
% functions, and to access the autonomous datalogger.

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


% //--- (YHumidity declaration)
classdef YHumidityProxy < YoctoProxyAPI.YSensorProxy
    % YHumidityProxy: humidity sensor control interface, available for instance in the Yocto-CO2-V2, the
    % Yocto-Meteo-V2 or the Yocto-VOC-V3
    % 
    % The YHumidityProxy class allows you to read and configure Yoctopuce humidity sensors. It inherits
    % from <tt>YSensor</tt> class the core functions to read measurements, to register callback
    % functions, and to access the autonomous datalogger.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YHumidity declaration)

    % //--- (YHumidity implementation)
    methods (Hidden)
        function obj = YHumidityProxy()
            % YHumidityProxy For internal use as System Object.
            % Use FindHumidity() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -1869998700;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindHumidity(func)
            % FindHumidity Retrieve instances of YHumidityProxy
            obj = YoctoProxyAPI.YHumidityProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindHumidity to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1869998700);
        end
    end
    % //--- (end of YHumidity implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YHumidityProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Humidity');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'Humidity', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Humidity settings', ...
                'PropertyList', {});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropDouble(1444001205);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'double';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'CurrentValue';
        end
    end

    methods
        % //--- (YHumidity accessors declaration)

        function set_unit(obj, newVal)
            % Changes the primary unit for measuring humidity. That unit is a string.
            % If that strings starts with the letter 'g', the primary measured value is the absolute
            % humidity, in g/m3. Otherwise, the primary measured value will be the relative humidity
            % (RH), in per cents.
            %
            % Remember to call the saveToFlash() method of the module if the modification
            % must be kept.
            %
            % @param newval : a string corresponding to the primary unit for measuring humidity
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_relHum(obj)
            % Returns the current relative humidity, in per cents.
            %
            % @return a floating point number corresponding to the current relative humidity, in per cents
            %
            % On failure, throws an exception or returns YHumidity.RELHUM_INVALID.
            result = obj.InvokeMethod_F(-890677710);
        end

        function result = get_absHum(obj)
            % Returns the current absolute humidity, in grams per cubic meter of air.
            %
            % @return a floating point number corresponding to the current absolute humidity, in
            % grams per cubic meter of air
            %
            % On failure, throws an exception or returns YHumidity.ABSHUM_INVALID.
            result = obj.InvokeMethod_F(268103226);
        end

        % //--- (end of YHumidity accessors declaration)
    end
end
