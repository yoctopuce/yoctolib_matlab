% YWeighScaleProxy: weighing scale sensor control interface, available for instance in the
% Yocto-Bridge or the Yocto-MaxiBridge
% 
% The YWeighScaleProxy class provides a weight measurement from a ratiometric sensor. It can be used
% to control the bridge excitation parameters, in order to avoid measure shifts caused by temperature
% variation in the electronics, and can also automatically apply an additional correction factor
% based on temperature to compensate for offsets in the load cell itself.

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


% //--- (YWeighScale declaration)
classdef YWeighScaleProxy < YoctoProxyAPI.YSensorProxy
    % YWeighScaleProxy: weighing scale sensor control interface, available for instance in the
    % Yocto-Bridge or the Yocto-MaxiBridge
    % 
    % The YWeighScaleProxy class provides a weight measurement from a ratiometric sensor. It can be used
    % to control the bridge excitation parameters, in order to avoid measure shifts caused by temperature
    % variation in the electronics, and can also automatically apply an additional correction factor
    % based on temperature to compensate for offsets in the load cell itself.

    properties (Transient, Nontunable)
        % Excitation Current load cell bridge excitation method
        Excitation (1,1) YoctoProxyAPI.EnumExcitation
        % TempAvgAdaptRatio Averaged temperature update rate, in per mille
        TempAvgAdaptRatio (1,1) double
        % TempChgAdaptRatio Temperature change update rate, in per mille
        TempChgAdaptRatio (1,1) double
        % ZeroTracking Zero tracking threshold value
        ZeroTracking (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YWeighScale declaration)

    % //--- (YWeighScale implementation)
    methods (Hidden)
        function obj = YWeighScaleProxy()
            % YWeighScaleProxy For internal use as System Object.
            % Use FindWeighScale() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 536971517;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindWeighScale(func)
            % FindWeighScale Retrieve instances of YWeighScaleProxy
            obj = YoctoProxyAPI.YWeighScaleProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindWeighScale to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(536971517);
        end
    end
    % //--- (end of YWeighScale implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YWeighScaleProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'WeighScale');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'WeighScale', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'WeighScale settings', ...
                'PropertyList', {'Excitation','TempAvgAdaptRatio','TempChgAdaptRatio','ZeroTracking'});
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
        % //--- (YWeighScale accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the weight.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the measuring unit for the weight
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_excitation(obj)
            % Returns the current load cell bridge excitation method.
            %
            % @return a value among Y_EXCITATION_OFF, Y_EXCITATION_DC and Y_EXCITATION_AC
            % corresponding to the current load cell bridge excitation method
            %
            % On failure, throws an exception or returns Y_EXCITATION_INVALID.
            result = YoctoProxyAPI.EnumExcitation(obj.InvokeMethod_D(-698909622));
        end

        function set_excitation(obj, newVal)
            % Changes the current load cell bridge excitation method.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among Y_EXCITATION_OFF, Y_EXCITATION_DC and Y_EXCITATION_AC
            % corresponding to the current load cell bridge excitation method
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-550556005, newVal);
        end

        function result = get.Excitation(obj)
            result = YoctoProxyAPI.EnumExcitation(obj.GetPropInt32(1342015048));
        end

        function set.Excitation(obj, newVal)
            obj.Excitation = newVal;
            obj.SetPropInt32(1342015048, newVal);
        end

        function set_tempAvgAdaptRatio(obj, newVal)
            % Changes the averaged temperature update rate, in per mille.
            % The purpose of this adaptation ratio is to model the thermal inertia of the load cell.
            % The averaged temperature is updated every 10 seconds, by applying this adaptation rate
            % to the difference between the measures ambient temperature and the current compensation
            % temperature. The standard rate is 0.2 per mille, and the maximal rate is 65 per mille.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a floating point number corresponding to the averaged temperature
            % update rate, in per mille
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-320670229, newVal);
        end

        function result = get_tempAvgAdaptRatio(obj)
            % Returns the averaged temperature update rate, in per mille.
            % The purpose of this adaptation ratio is to model the thermal inertia of the load cell.
            % The averaged temperature is updated every 10 seconds, by applying this adaptation rate
            % to the difference between the measures ambient temperature and the current compensation
            % temperature. The standard rate is 0.2 per mille, and the maximal rate is 65 per mille.
            %
            % @return a floating point number corresponding to the averaged temperature update rate, in per mille
            %
            % On failure, throws an exception or returns Y_TEMPAVGADAPTRATIO_INVALID.
            result = obj.InvokeMethod_F(-693964036);
        end

        function result = get.TempAvgAdaptRatio(obj)
            result = obj.GetPropDouble(-556076344);
        end

        function set.TempAvgAdaptRatio(obj, newVal)
            obj.TempAvgAdaptRatio = newVal;
            obj.SetPropDouble(-556076344, newVal);
        end

        function set_tempChgAdaptRatio(obj, newVal)
            % Changes the temperature change update rate, in per mille.
            % The temperature change is updated every 10 seconds, by applying this adaptation rate
            % to the difference between the measures ambient temperature and the current temperature used for
            % change compensation. The standard rate is 0.6 per mille, and the maximal rate is 65 per mille.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a floating point number corresponding to the temperature change update
            % rate, in per mille
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-380818026, newVal);
        end

        function result = get_tempChgAdaptRatio(obj)
            % Returns the temperature change update rate, in per mille.
            % The temperature change is updated every 10 seconds, by applying this adaptation rate
            % to the difference between the measures ambient temperature and the current temperature used for
            % change compensation. The standard rate is 0.6 per mille, and the maximal rate is 65 per mille.
            %
            % @return a floating point number corresponding to the temperature change update rate, in per mille
            %
            % On failure, throws an exception or returns Y_TEMPCHGADAPTRATIO_INVALID.
            result = obj.InvokeMethod_F(-754111871);
        end

        function result = get.TempChgAdaptRatio(obj)
            result = obj.GetPropDouble(1538226529);
        end

        function set.TempChgAdaptRatio(obj, newVal)
            obj.TempChgAdaptRatio = newVal;
            obj.SetPropDouble(1538226529, newVal);
        end

        function result = get_compTempAvg(obj)
            % Returns the current averaged temperature, used for thermal compensation.
            %
            % @return a floating point number corresponding to the current averaged temperature, used
            % for thermal compensation
            %
            % On failure, throws an exception or returns Y_COMPTEMPAVG_INVALID.
            result = obj.InvokeMethod_F(855390688);
        end

        function result = get_compTempChg(obj)
            % Returns the current temperature variation, used for thermal compensation.
            %
            % @return a floating point number corresponding to the current temperature variation,
            % used for thermal compensation
            %
            % On failure, throws an exception or returns Y_COMPTEMPCHG_INVALID.
            result = obj.InvokeMethod_F(-117814740);
        end

        function result = get_compensation(obj)
            % Returns the current current thermal compensation value.
            %
            % @return a floating point number corresponding to the current current thermal compensation value
            %
            % On failure, throws an exception or returns Y_COMPENSATION_INVALID.
            result = obj.InvokeMethod_F(-1922871604);
        end

        function set_zeroTracking(obj, newVal)
            % Changes the zero tracking threshold value. When this threshold is larger than
            % zero, any measure under the threshold will automatically be ignored and the
            % zero compensation will be updated.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a floating point number corresponding to the zero tracking threshold value
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(51810600, newVal);
        end

        function result = get_zeroTracking(obj)
            % Returns the zero tracking threshold value. When this threshold is larger than
            % zero, any measure under the threshold will automatically be ignored and the
            % zero compensation will be updated.
            %
            % @return a floating point number corresponding to the zero tracking threshold value
            %
            % On failure, throws an exception or returns Y_ZEROTRACKING_INVALID.
            result = obj.InvokeMethod_F(494091006);
        end

        function result = get.ZeroTracking(obj)
            result = obj.GetPropDouble(-917206389);
        end

        function set.ZeroTracking(obj, newVal)
            obj.ZeroTracking = newVal;
            obj.SetPropDouble(-917206389, newVal);
        end

        function result = tare(obj)
            % Adapts the load cell signal bias (stored in the corresponding genericSensor)
            % so that the current signal corresponds to a zero weight. Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1184568647);
        end

        function result = setupSpan(obj, currWeight, maxWeight)
            % Configures the load cell span parameters (stored in the corresponding genericSensor)
            % so that the current signal corresponds to the specified reference weight.
            %
            % @param currWeight : reference weight presently on the load cell.
            % @param maxWeight : maximum weight to be expected on the load cell.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dff(-1218190639, currWeight, maxWeight);
        end

        function result = set_offsetAvgCompensationTable(obj, tempValues, compValues)
            % Records a weight offset thermal compensation table, in order to automatically correct the
            % measured weight based on the averaged compensation temperature.
            % The weight correction will be applied by linear interpolation between specified points.
            %
            % @param tempValues : array of floating point numbers, corresponding to all averaged
            %         temperatures for which an offset correction is specified.
            % @param compValues : array of floating point numbers, corresponding to the offset correction
            %         to apply for each of the temperature included in the first
            %         argument, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(-1100997934, tempValues, compValues);
        end

        function result = set_offsetChgCompensationTable(obj, tempValues, compValues)
            % Records a weight offset thermal compensation table, in order to automatically correct the
            % measured weight based on the variation of temperature.
            % The weight correction will be applied by linear interpolation between specified points.
            %
            % @param tempValues : array of floating point numbers, corresponding to temperature
            %         variations for which an offset correction is specified.
            % @param compValues : array of floating point numbers, corresponding to the offset correction
            %         to apply for each of the temperature variation included in the first
            %         argument, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(-1259501118, tempValues, compValues);
        end

        function result = set_spanAvgCompensationTable(obj, tempValues, compValues)
            % Records a weight span thermal compensation table, in order to automatically correct the
            % measured weight based on the compensation temperature.
            % The weight correction will be applied by linear interpolation between specified points.
            %
            % @param tempValues : array of floating point numbers, corresponding to all averaged
            %         temperatures for which a span correction is specified.
            % @param compValues : array of floating point numbers, corresponding to the span correction
            %         (in percents) to apply for each of the temperature included in the first
            %         argument, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(-1314931078, tempValues, compValues);
        end

        function result = set_spanChgCompensationTable(obj, tempValues, compValues)
            % Records a weight span thermal compensation table, in order to automatically correct the
            % measured weight based on the variation of temperature.
            % The weight correction will be applied by linear interpolation between specified points.
            %
            % @param tempValues : array of floating point numbers, corresponding to all variations of
            %         temperatures for which a span correction is specified.
            % @param compValues : array of floating point numbers, corresponding to the span correction
            %         (in percents) to apply for each of the temperature variation included
            %         in the first argument, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dxfxf(-1156436630, tempValues, compValues);
        end

        % //--- (end of YWeighScale accessors declaration)
    end
end
