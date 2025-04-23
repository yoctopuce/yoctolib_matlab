% YSensorProxy: Sensor function interface.
% 
% The YSensorProxy class is the parent class for all Yoctopuce sensor types. It can be used to read
% the current value and unit of any sensor, read the min/max value, configure autonomous recording
% frequency and access recorded data. It also provide a function to register a callback invoked each
% time the observed value changes, or at a predefined interval. Using this class rather than a
% specific subclass makes it possible to create generic applications that work with any Yoctopuce
% sensor, even those that do not yet exist. Note: The <tt>YAnButton</tt> class is the only analog
% input which does not inherit from YSensorProxy.

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


% //--- (generated code: YSensor declaration)
classdef YSensorProxy < YoctoProxyAPI.YFunctionProxy
    % YSensorProxy: Sensor function interface.
    % 
    % The YSensorProxy class is the parent class for all Yoctopuce sensor types. It can be used to read
    % the current value and unit of any sensor, read the min/max value, configure autonomous recording
    % frequency and access recorded data. It also provides a function to register a callback invoked each
    % time the observed value changes, or at a predefined interval. Using this class rather than a
    % specific subclass makes it possible to create generic applications that work with any Yoctopuce
    % sensor, even those that do not yet exist. Note: The <tt>YAnButton</tt> class is the only analog
    % input which does not inherit from YSensorProxy.

    properties (Transient, Nontunable)
        % LogFrequency Datalogger recording frequency for this function, or "OFF"
        LogFrequency (1,:) char
        % ReportFrequency Timed value notification frequency, or "OFF" if timed
        ReportFrequency (1,:) char
        % AdvMode Measuring mode used for the advertised value pushed to the parent hub
        AdvMode (1,1) YoctoProxyAPI.EnumAdvMode
        % Resolution Resolution of the measured values
        Resolution (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of generated code: YSensor declaration)

    properties (Transient)
        % CurrentValue Last measurement reported by the sensor,
        % according to the update policy specified by UpdateFrequency
        CurrentValue (1,1) double
    end

    properties (Transient, Nontunable)
        % Unit Measuring unit for the sensor
        Unit (1,:) char
        % UpdateFrequency Update policy for the sensor:
        % "auto" for an update at every change
        % "x/s" for an update x time per second with the instant value
        % "x/m" or "x/h" for an update x times per minute (resp. hour) 
        % with the average value over the latest period.
        UpdateFrequency (1,:) char
    end

    % //--- (generated code: YSensor implementation)
    methods (Hidden)
        function obj = YSensorProxy()
            % YSensorProxy For internal use as System Object.
            % Use FindSensor() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1154870650;
        end
    end

    methods (Static)
        function obj = FindSensor(func)
            % FindSensor Retrieve instances of YSensorProxy
            obj = YoctoProxyAPI.YSensorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindSensor to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1154870650);
        end
    end
    % //--- (end of generated code: YSensor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YSensorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Sensor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Sensor', ...
                'PropertyList', {'CurrentValue','Unit'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Sensor settings', ...
                'PropertyList', {'UpdateFrequency','Resolution'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropInt32(1649606143, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'State';
        end

        function [] = getOutputNamesImpl(~)
        end
    end
    
    methods
        % //--- (generated code: YSensor accessors declaration)

        function result = get_unit(obj)
            % Returns the measuring unit for the measure.
            %
            % @return a string corresponding to the measuring unit for the measure
            %
            % On failure, throws an exception or returns YSensor.UNIT_INVALID.
            result = obj.InvokeMethod_S(-1665607378);
        end

        function result = get_currentValue(obj)
            % Returns the current value of the measure, in the specified unit, as a floating point number.
            % Note that a get_currentValue() call will *not* start a measure in the device, it
            % will just return the last measure that occurred in the device. Indeed, internally, each Yoctopuce
            % devices is continuously making measures at a hardware specific frequency.
            %
            % If continuously calling  get_currentValue() leads you to performances issues, then
            % you might consider to switch to callback programming model. Check the "advanced
            % programming" chapter in in your device user manual for more information.
            %
            % @return a floating point number corresponding to the current value of the measure, in
            % the specified unit, as a floating point number
            %
            % On failure, throws an exception or returns YSensor.CURRENTVALUE_INVALID.
            result = obj.InvokeMethod_F(-355429381);
        end

        function set_lowestValue(obj, newVal)
            % Changes the recorded minimal value observed. Can be used to reset the value returned
            % by get_lowestValue().
            %
            % @param newval : a floating point number corresponding to the recorded minimal value observed
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-613758416, newVal);
        end

        function result = get_lowestValue(obj)
            % Returns the minimal value observed for the measure since the device was started.
            % Can be reset to an arbitrary value thanks to set_lowestValue().
            %
            % @return a floating point number corresponding to the minimal value observed for the
            % measure since the device was started
            %
            % On failure, throws an exception or returns YSensor.LOWESTVALUE_INVALID.
            result = obj.InvokeMethod_F(-2074258358);
        end

        function set_highestValue(obj, newVal)
            % Changes the recorded maximal value observed. Can be used to reset the value returned
            % by get_lowestValue().
            %
            % @param newval : a floating point number corresponding to the recorded maximal value observed
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(274579300, newVal);
        end

        function result = get_highestValue(obj)
            % Returns the maximal value observed for the measure since the device was started.
            % Can be reset to an arbitrary value thanks to set_highestValue().
            %
            % @return a floating point number corresponding to the maximal value observed for the
            % measure since the device was started
            %
            % On failure, throws an exception or returns YSensor.HIGHESTVALUE_INVALID.
            result = obj.InvokeMethod_F(238556338);
        end

        function result = get_currentRawValue(obj)
            % Returns the uncalibrated, unrounded raw value returned by the
            % sensor, in the specified unit, as a floating point number.
            %
            % @return a floating point number corresponding to the uncalibrated, unrounded raw value
            % returned by the
            %         sensor, in the specified unit, as a floating point number
            %
            % On failure, throws an exception or returns YSensor.CURRENTRAWVALUE_INVALID.
            result = obj.InvokeMethod_F(1057921848);
        end

        function result = get_logFrequency(obj)
            % Returns the datalogger recording frequency for this function, or "OFF"
            % when measures are not stored in the data logger flash memory.
            %
            % @return a string corresponding to the datalogger recording frequency for this function, or "OFF"
            %         when measures are not stored in the data logger flash memory
            %
            % On failure, throws an exception or returns YSensor.LOGFREQUENCY_INVALID.
            result = obj.InvokeMethod_S(591711072);
        end

        function set_logFrequency(obj, newVal)
            % Changes the datalogger recording frequency for this function.
            % The frequency can be specified as samples per second,
            % as sample per minute (for instance "15/m") or in samples per
            % hour (eg. "4/h"). To disable recording for this function, use
            % the value "OFF". Note that setting the  datalogger recording frequency
            % to a greater value than the sensor native sampling frequency is useless,
            % and even counterproductive: those two frequencies are not related.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the datalogger recording frequency for this function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1025597622, newVal);
        end

        function result = get.LogFrequency(obj)
            result = obj.GetPropString(-64196617);
        end

        function set.LogFrequency(obj, newVal)
            obj.LogFrequency = newVal;
            obj.SetPropString(-64196617, newVal);
        end

        function result = get_reportFrequency(obj)
            % Returns the timed value notification frequency, or "OFF" if timed
            % value notifications are disabled for this function.
            %
            % @return a string corresponding to the timed value notification frequency, or "OFF" if timed
            %         value notifications are disabled for this function
            %
            % On failure, throws an exception or returns YSensor.REPORTFREQUENCY_INVALID.
            result = obj.InvokeMethod_S(-1459322260);
        end

        function set_reportFrequency(obj, newVal)
            % Changes the timed value notification frequency for this function.
            % The frequency can be specified as samples per second,
            % as sample per minute (for instance "15/m") or in samples per
            % hour (e.g. "4/h"). To disable timed value notifications for this
            % function, use the value "OFF". Note that setting the  timed value
            % notification frequency to a greater value than the sensor native
            % sampling frequency is unless, and even counterproductive: those two
            % frequencies are not related.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the timed value notification frequency for this function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-881347341, newVal);
        end

        function result = get.ReportFrequency(obj)
            result = obj.GetPropString(49010739);
        end

        function set.ReportFrequency(obj, newVal)
            obj.ReportFrequency = newVal;
            obj.SetPropString(49010739, newVal);
        end

        function result = get_advMode(obj)
            % Returns the measuring mode used for the advertised value pushed to the parent hub.
            %
            % @return a value among YSensor.ADVMODE_IMMEDIATE, YSensor.ADVMODE_PERIOD_AVG,
            % YSensor.ADVMODE_PERIOD_MIN and YSensor.ADVMODE_PERIOD_MAX corresponding to the
            % measuring mode used for the advertised value pushed to the parent hub
            %
            % On failure, throws an exception or returns YSensor.ADVMODE_INVALID.
            result = YoctoProxyAPI.EnumAdvMode(obj.InvokeMethod_D(1150220092));
        end

        function set_advMode(obj, newVal)
            % Changes the measuring mode used for the advertised value pushed to the parent hub.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a value among YSensor.ADVMODE_IMMEDIATE, YSensor.ADVMODE_PERIOD_AVG,
            % YSensor.ADVMODE_PERIOD_MIN and YSensor.ADVMODE_PERIOD_MAX corresponding to the
            % measuring mode used for the advertised value pushed to the parent hub
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(190716856, newVal);
        end

        function result = get.AdvMode(obj)
            result = YoctoProxyAPI.EnumAdvMode(obj.GetPropInt32(-1940140519));
        end

        function set.AdvMode(obj, newVal)
            obj.AdvMode = newVal;
            obj.SetPropInt32(-1940140519, newVal);
        end

        function set_resolution(obj, newVal)
            % Changes the resolution of the measured physical values. The resolution corresponds to
            % the numerical precision
            % when displaying value. It does not change the precision of the measure itself.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a floating point number corresponding to the resolution of the measured
            % physical values
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(1152952361, newVal);
        end

        function result = get_resolution(obj)
            % Returns the resolution of the measured values. The resolution corresponds to the numerical precision
            % of the measures, which is not always the same as the actual precision of the sensor.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @return a floating point number corresponding to the resolution of the measured values
            %
            % On failure, throws an exception or returns YSensor.RESOLUTION_INVALID.
            result = obj.InvokeMethod_F(1304492792);
        end

        function result = get.Resolution(obj)
            result = obj.GetPropDouble(-1299313574);
        end

        function set.Resolution(obj, newVal)
            obj.Resolution = newVal;
            obj.SetPropDouble(-1299313574, newVal);
        end

        function result = get_sensorState(obj)
            % Returns the sensor state code, which is zero when there is an up-to-date measure
            % available or a positive code if the sensor is not able to provide a measure right now.
            %
            % @return an integer corresponding to the sensor state code, which is zero when there is
            % an up-to-date measure
            %         available or a positive code if the sensor is not able to provide a measure right now
            %
            % On failure, throws an exception or returns YSensor.SENSORSTATE_INVALID.
            result = obj.InvokeMethod_D(562823856);
        end

        function result = isSensorReady(obj)
            % Checks if the sensor is currently able to provide an up-to-date measure.
            % Returns false if the device is unreachable, or if the sensor does not have
            % a current measure to transmit. No exception is raised if there is an error
            % while trying to contact the device hosting $THEFUNCTION$.
            %
            % @return true if the sensor can provide an up-to-date measure, and false otherwise
            result = obj.InvokeMethod_B(31962697);
        end

        function result = get_dataLogger(obj)
            % Returns the YDatalogger object of the device hosting the sensor. This method returns an object
            % that can control global parameters of the data logger. The returned object
            % should not be freed.
            %
            % @return an YDatalogger object, or null on error.
            result = obj.InvokeMethod_H(-1447954056);
        end

        function result = startDataLogger(obj)
            % Starts the data logger on the device. Note that the data logger
            % will only save the measures on this sensor if the logFrequency
            % is not set to "OFF".
            %
            % @return 0 if the call succeeds.
            result = obj.InvokeMethod_D(1135219035);
        end

        function result = stopDataLogger(obj)
            % Stops the datalogger on the device.
            %
            % @return 0 if the call succeeds.
            result = obj.InvokeMethod_D(-901922476);
        end

        function result = get_recordedData(obj, startTime, endTime)
            % Retrieves a YDataSet object holding historical data for this
            % sensor, for a specified time interval. The measures will be
            % retrieved from the data logger, which must have been turned
            % on at the desired time. See the documentation of the YDataSet
            % class for information on how to get an overview of the
            % recorded data, and how to load progressively a large set
            % of measures from the data logger.
            %
            % This function only works if the device uses a recent firmware,
            % as YDataSet objects are not supported by firmwares older than
            % version 13000.
            %
            % @param startTime : the start of the desired measure time interval,
            %         as a Unix timestamp, i.e. the number of seconds since
            %         January 1, 1970 UTC. The special value 0 can be used
            %         to include any measure, without initial limit.
            % @param endTime : the end of the desired measure time interval,
            %         as a Unix timestamp, i.e. the number of seconds since
            %         January 1, 1970 UTC. The special value 0 can be used
            %         to include any measure, without ending limit.
            %
            % @return an instance of YDataSet, providing access to historical
            %         data. Past measures can be loaded progressively
            %         using methods from the YDataSet object.
            result = obj.InvokeMethod_Hff(-86168835, startTime, endTime);
        end

        function result = calibrateFromPoints(obj, rawValues, refValues)
            % Configures error correction data points, in particular to compensate for
            % a possible perturbation of the measure caused by an enclosure. It is possible
            % to configure up to five correction points. Correction points must be provided
            % in ascending order, and be in the range of the sensor. The device will automatically
            % perform a linear interpolation of the error correction between specified
            % points. Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % For more information on advanced capabilities to refine the calibration of
            % sensors, please contact support@yoctopuce.com.
            %
            % @param rawValues : array of floating point numbers, corresponding to the raw
            %         values returned by the sensor for the correction points.
            % @param refValues : array of floating point numbers, corresponding to the corrected
            %         values for the correction points.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(470454055, rawValues, refValues);
        end

        % //--- (end of generated code: YSensor accessors declaration)
        
        function result = get.CurrentValue(obj)
            result = obj.GetPropDouble(1444001205);
        end

        function set.CurrentValue(obj, newVal)
            obj.CurrentValue = newVal;
            obj.SetPropDouble(1444001205, newVal);
        end

        function result = get.Unit(obj)
            result = obj.GetPropString(2089395053);
        end

        function set.Unit(obj, newVal)
            obj.Unit = newVal;
            obj.SetPropString(2089395053, newVal);
        end
        
        function result = get.UpdateFrequency(obj)
            result = obj.GetPropString(-961692945);
        end

        function set.UpdateFrequency(obj, newVal)
            obj.UpdateFrequency = newVal;
            obj.SetPropString(-961692945, newVal);
        end
        
    end
end
