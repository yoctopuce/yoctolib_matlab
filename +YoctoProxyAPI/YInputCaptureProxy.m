% YInputCaptureProxy: instant snapshot trigger control interface
% 
% The YInputCaptureProxy class allows you to access data samples measured by a Yoctopuce electrical
% sensor. The data capture can be triggered manually, or be configured to detect specific events.

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


% //--- (YInputCapture declaration)
classdef YInputCaptureProxy < YoctoProxyAPI.YFunctionProxy
    % YInputCaptureProxy: instant snapshot trigger control interface
    % 
    % The YInputCaptureProxy class allows you to access data samples measured by a Yoctopuce electrical
    % sensor. The data capture can be triggered manually, or be configured to detect specific events.

    properties (Transient, Nontunable)
        % CondValue Current threshold value for automatic conditional capture
        CondValue (1,1) double
        % NSamples Number of samples that will be captured
        NSamples (1,1) int32
        % CondAlign Relative position of the trigger event within the capture window
        CondAlign (1,1) int32
        % CaptureTypeAtStartup Type of automatic conditional capture
        CaptureTypeAtStartup (1,1) YoctoProxyAPI.EnumCaptureTypeAtStartup
        % CondValueAtStartup Threshold value for automatic conditional
        CondValueAtStartup (1,1) double
    end

    properties (Transient, Nontunable, SetAccess = private)
        % LastCaptureTime Number of elapsed milliseconds between the module power on
        LastCaptureTime (1,1) int64
    end

    properties (Constant)
    end
    % //--- (end of YInputCapture declaration)

    % //--- (YInputCapture implementation)
    methods (Hidden)
        function obj = YInputCaptureProxy()
            % YInputCaptureProxy For internal use as System Object.
            % Use FindInputCapture() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1777674847;
        end
    end

    methods (Static)
        function obj = FindInputCapture(func)
            % FindInputCapture Retrieve instances of YInputCaptureProxy
            obj = YoctoProxyAPI.YInputCaptureProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindInputCapture to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1777674847);
        end
    end
    % //--- (end of YInputCapture implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YInputCaptureProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'InputCapture');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'InputCapture', ...
                'PropertyList', {'CondValue','LastCaptureTime'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'InputCapture settings', ...
                'PropertyList', {'NSamples','CondAlign','CaptureTypeAtStartup','CondValueAtStartup'});
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
        % //--- (YInputCapture accessors declaration)

        function result = get_lastCaptureTime(obj)
            % Returns the number of elapsed milliseconds between the module power on
            % and the last capture (time of trigger), or zero if no capture has been done.
            %
            % @return an integer corresponding to the number of elapsed milliseconds between the module power on
            %         and the last capture (time of trigger), or zero if no capture has been done
            %
            % On failure, throws an exception or returns YInputCapture.LASTCAPTURETIME_INVALID.
            result = obj.InvokeMethod_Q(-1286078231);
        end

        function result = get.LastCaptureTime(obj)
            result = obj.GetPropInt64(-2017387805);
        end

        function result = get.CondValue(obj)
            result = obj.GetPropDouble(1520788386);
        end

        function set.CondValue(obj, newVal)
            obj.CondValue = newVal;
            obj.SetPropDouble(1520788386, newVal);
        end

        function result = get_nSamples(obj)
            % Returns the number of samples that will be captured.
            %
            % @return an integer corresponding to the number of samples that will be captured
            %
            % On failure, throws an exception or returns YInputCapture.NSAMPLES_INVALID.
            result = obj.InvokeMethod_D(-728637219);
        end

        function set_nSamples(obj, newVal)
            % Changes the type of automatic conditional capture.
            % The maximum number of samples depends on the device memory.
            %
            % If you want the change to be kept after a device reboot,
            % make sure  to call the matching module saveToFlash().
            %
            % @param newval : an integer corresponding to the type of automatic conditional capture
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1864273054, newVal);
        end

        function result = get.NSamples(obj)
            result = obj.GetPropInt32(309771811);
        end

        function set.NSamples(obj, newVal)
            obj.NSamples = newVal;
            obj.SetPropInt32(309771811, newVal);
        end

        function result = get_samplingRate(obj)
            % Returns the sampling frequency, in Hz.
            %
            % @return an integer corresponding to the sampling frequency, in Hz
            %
            % On failure, throws an exception or returns YInputCapture.SAMPLINGRATE_INVALID.
            result = obj.InvokeMethod_D(-1981031830);
        end

        function result = get_captureType(obj)
            % Returns the type of automatic conditional capture.
            %
            % @return a value among YInputCapture.CAPTURETYPE_NONE, YInputCapture.CAPTURETYPE_TIMED,
            % YInputCapture.CAPTURETYPE_V_MAX, YInputCapture.CAPTURETYPE_V_MIN,
            % YInputCapture.CAPTURETYPE_I_MAX, YInputCapture.CAPTURETYPE_I_MIN,
            % YInputCapture.CAPTURETYPE_P_MAX, YInputCapture.CAPTURETYPE_P_MIN,
            % YInputCapture.CAPTURETYPE_V_AVG_MAX, YInputCapture.CAPTURETYPE_V_AVG_MIN,
            % YInputCapture.CAPTURETYPE_V_RMS_MAX, YInputCapture.CAPTURETYPE_V_RMS_MIN,
            % YInputCapture.CAPTURETYPE_I_AVG_MAX, YInputCapture.CAPTURETYPE_I_AVG_MIN,
            % YInputCapture.CAPTURETYPE_I_RMS_MAX, YInputCapture.CAPTURETYPE_I_RMS_MIN,
            % YInputCapture.CAPTURETYPE_P_AVG_MAX, YInputCapture.CAPTURETYPE_P_AVG_MIN,
            % YInputCapture.CAPTURETYPE_PF_MIN and YInputCapture.CAPTURETYPE_DPF_MIN corresponding to
            % the type of automatic conditional capture
            %
            % On failure, throws an exception or returns YInputCapture.CAPTURETYPE_INVALID.
            result = YoctoProxyAPI.EnumCaptureType(obj.InvokeMethod_D(-1563263740));
        end

        function set_captureType(obj, newVal)
            % Changes the type of automatic conditional capture.
            %
            % @param newval : a value among YInputCapture.CAPTURETYPE_NONE,
            % YInputCapture.CAPTURETYPE_TIMED, YInputCapture.CAPTURETYPE_V_MAX,
            % YInputCapture.CAPTURETYPE_V_MIN, YInputCapture.CAPTURETYPE_I_MAX,
            % YInputCapture.CAPTURETYPE_I_MIN, YInputCapture.CAPTURETYPE_P_MAX,
            % YInputCapture.CAPTURETYPE_P_MIN, YInputCapture.CAPTURETYPE_V_AVG_MAX,
            % YInputCapture.CAPTURETYPE_V_AVG_MIN, YInputCapture.CAPTURETYPE_V_RMS_MAX,
            % YInputCapture.CAPTURETYPE_V_RMS_MIN, YInputCapture.CAPTURETYPE_I_AVG_MAX,
            % YInputCapture.CAPTURETYPE_I_AVG_MIN, YInputCapture.CAPTURETYPE_I_RMS_MAX,
            % YInputCapture.CAPTURETYPE_I_RMS_MIN, YInputCapture.CAPTURETYPE_P_AVG_MAX,
            % YInputCapture.CAPTURETYPE_P_AVG_MIN, YInputCapture.CAPTURETYPE_PF_MIN and
            % YInputCapture.CAPTURETYPE_DPF_MIN corresponding to the type of automatic conditional capture
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-35265666, newVal);
        end

        function set_condValue(obj, newVal)
            % Changes current threshold value for automatic conditional capture.
            %
            % @param newval : a floating point number corresponding to current threshold value for
            % automatic conditional capture
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-2120967161, newVal);
        end

        function result = get_condValue(obj)
            % Returns current threshold value for automatic conditional capture.
            %
            % @return a floating point number corresponding to current threshold value for automatic
            % conditional capture
            %
            % On failure, throws an exception or returns YInputCapture.CONDVALUE_INVALID.
            result = obj.InvokeMethod_F(1961117411);
        end

        function result = get_condAlign(obj)
            % Returns the relative position of the trigger event within the capture window.
            % When the value is 50%, the capture is centered on the event.
            %
            % @return an integer corresponding to the relative position of the trigger event within
            % the capture window
            %
            % On failure, throws an exception or returns YInputCapture.CONDALIGN_INVALID.
            result = obj.InvokeMethod_D(-1163367980);
        end

        function set_condAlign(obj, newVal)
            % Changes the relative position of the trigger event within the capture window.
            % The new value must be between 10% (on the left) and 90% (on the right).
            % When the value is 50%, the capture is centered on the event.
            %
            % If you want the change to be kept after a device reboot,
            % make sure  to call the matching module saveToFlash().
            %
            % @param newval : an integer corresponding to the relative position of the trigger event
            % within the capture window
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1339601712, newVal);
        end

        function result = get.CondAlign(obj)
            result = obj.GetPropInt32(-1813865635);
        end

        function set.CondAlign(obj, newVal)
            obj.CondAlign = newVal;
            obj.SetPropInt32(-1813865635, newVal);
        end

        function result = get_captureTypeAtStartup(obj)
            % Returns the type of automatic conditional capture
            % applied at device power on.
            %
            % @return a value among YInputCapture.CAPTURETYPEATSTARTUP_NONE,
            % YInputCapture.CAPTURETYPEATSTARTUP_TIMED, YInputCapture.CAPTURETYPEATSTARTUP_V_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_MIN, YInputCapture.CAPTURETYPEATSTARTUP_P_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_P_MIN, YInputCapture.CAPTURETYPEATSTARTUP_V_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_V_RMS_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_RMS_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_RMS_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_RMS_MIN, YInputCapture.CAPTURETYPEATSTARTUP_P_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_P_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_PF_MIN
            % and YInputCapture.CAPTURETYPEATSTARTUP_DPF_MIN corresponding to the type of automatic
            % conditional capture
            %         applied at device power on
            %
            % On failure, throws an exception or returns YInputCapture.CAPTURETYPEATSTARTUP_INVALID.
            result = YoctoProxyAPI.EnumCaptureTypeAtStartup(obj.InvokeMethod_D(813022526));
        end

        function set_captureTypeAtStartup(obj, newVal)
            % Changes the type of automatic conditional capture
            % applied at device power on.
            %
            % If you want the change to be kept after a device reboot,
            % make sure  to call the matching module saveToFlash().
            %
            % @param newval : a value among YInputCapture.CAPTURETYPEATSTARTUP_NONE,
            % YInputCapture.CAPTURETYPEATSTARTUP_TIMED, YInputCapture.CAPTURETYPEATSTARTUP_V_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_MIN, YInputCapture.CAPTURETYPEATSTARTUP_P_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_P_MIN, YInputCapture.CAPTURETYPEATSTARTUP_V_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_V_RMS_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_V_RMS_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_I_RMS_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_I_RMS_MIN, YInputCapture.CAPTURETYPEATSTARTUP_P_AVG_MAX,
            % YInputCapture.CAPTURETYPEATSTARTUP_P_AVG_MIN, YInputCapture.CAPTURETYPEATSTARTUP_PF_MIN
            % and YInputCapture.CAPTURETYPEATSTARTUP_DPF_MIN corresponding to the type of automatic
            % conditional capture
            %         applied at device power on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1948430256, newVal);
        end

        function result = get.CaptureTypeAtStartup(obj)
            result = YoctoProxyAPI.EnumCaptureTypeAtStartup(obj.GetPropInt32(439726280));
        end

        function set.CaptureTypeAtStartup(obj, newVal)
            obj.CaptureTypeAtStartup = newVal;
            obj.SetPropInt32(439726280, newVal);
        end

        function set_condValueAtStartup(obj, newVal)
            % Changes current threshold value for automatic conditional
            % capture applied at device power on.
            %
            % If you want the change to be kept after a device reboot,
            % make sure  to call the matching module saveToFlash().
            %
            % @param newval : a floating point number corresponding to current threshold value for
            % automatic conditional
            %         capture applied at device power on
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(2125005270, newVal);
        end

        function result = get_condValueAtStartup(obj)
            % Returns the threshold value for automatic conditional
            % capture applied at device power on.
            %
            % @return a floating point number corresponding to the threshold value for automatic conditional
            %         capture applied at device power on
            %
            % On failure, throws an exception or returns YInputCapture.CONDVALUEATSTARTUP_INVALID.
            result = obj.InvokeMethod_F(1403699324);
        end

        function result = get.CondValueAtStartup(obj)
            result = obj.GetPropDouble(-1659506434);
        end

        function set.CondValueAtStartup(obj, newVal)
            obj.CondValueAtStartup = newVal;
            obj.SetPropDouble(-1659506434, newVal);
        end

        function result = get_lastCapture(obj)
            % Returns all details about the last automatic input capture.
            %
            % @return an YInputCaptureData object including
            %         data series and all related meta-information.
            %         On failure, throws an exception or returns an capture object.
            result = obj.InvokeMethod_C(1887979478);
        end

        function result = get_immediateCapture(obj, msDuration)
            % Returns a new immediate capture of the device inputs.
            %
            % @param msDuration : duration of the capture window,
            %         in milliseconds (eg. between 20 and 1000).
            %
            % @return an YInputCaptureData object including
            %         data series for the specified duration.
            %         On failure, throws an exception or returns an capture object.
            result = obj.InvokeMethod_Cd(-1913116172, msDuration);
        end

        % //--- (end of YInputCapture accessors declaration)
    end
end
