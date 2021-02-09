% YAudioInProxy: audio input control interface
% 
% The YAudioInProxy class allows you to configure the volume of an audio input.

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


% //--- (YAudioIn declaration)
classdef YAudioInProxy < YoctoProxyAPI.YFunctionProxy
    % YAudioInProxy: audio input control interface
    % 
    % The YAudioInProxy class allows you to configure the volume of an audio input.

    properties (Transient, Nontunable)
        % Volume Udio input gain, in per cents
        Volume (1,1) int32
        % Mute State of the mute function
        Mute (1,1) YoctoProxyAPI.EnumMute
    end

    properties (Transient, Nontunable, SetAccess = private)
        % Signal Detected input signal level
        Signal (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YAudioIn declaration)

    % //--- (YAudioIn implementation)
    methods (Hidden)
        function obj = YAudioInProxy()
            % YAudioInProxy For internal use as System Object.
            % Use FindAudioIn() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -967221045;
        end
    end

    methods (Static)
        function obj = FindAudioIn(func)
            % FindAudioIn Retrieve instances of YAudioInProxy
            obj = YoctoProxyAPI.YAudioInProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindAudioIn to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-967221045);
        end
    end
    % //--- (end of YAudioIn implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YAudioInProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'AudioIn');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'AudioIn', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'AudioIn settings', ...
                'PropertyList', {'Volume','Mute','Signal'});
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
        % //--- (YAudioIn accessors declaration)

        function result = get_volume(obj)
            % Returns audio input gain, in per cents.
            %
            % @return an integer corresponding to audio input gain, in per cents
            %
            % On failure, throws an exception or returns YAudioIn.VOLUME_INVALID.
            result = obj.InvokeMethod_D(-959302571);
        end

        function set_volume(obj, newVal)
            % Changes audio input gain, in per cents.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to audio input gain, in per cents
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-224214498, newVal);
        end

        function result = get.Volume(obj)
            result = obj.GetPropInt32(-1103705880);
        end

        function set.Volume(obj, newVal)
            obj.Volume = newVal;
            obj.SetPropInt32(-1103705880, newVal);
        end

        function result = get_mute(obj)
            % Returns the state of the mute function.
            %
            % @return either YAudioIn.MUTE_FALSE or YAudioIn.MUTE_TRUE, according to the state of the
            % mute function
            %
            % On failure, throws an exception or returns YAudioIn.MUTE_INVALID.
            result = YoctoProxyAPI.EnumMute(obj.InvokeMethod_D(1481194633));
        end

        function set_mute(obj, newVal)
            % Changes the state of the mute function. Remember to call the matching module
            % saveToFlash() method to save the setting permanently.
            %
            % @param newval : either YAudioIn.MUTE_FALSE or YAudioIn.MUTE_TRUE, according to the
            % state of the mute function
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1298283987, newVal);
        end

        function result = get.Mute(obj)
            result = YoctoProxyAPI.EnumMute(obj.GetPropInt32(1821105250));
        end

        function set.Mute(obj, newVal)
            obj.Mute = newVal;
            obj.SetPropInt32(1821105250, newVal);
        end

        function result = get_volumeRange(obj)
            % Returns the supported volume range. The low value of the
            % range corresponds to the minimal audible value. To
            % completely mute the sound, use set_mute()
            % instead of the set_volume().
            %
            % @return a string corresponding to the supported volume range
            %
            % On failure, throws an exception or returns YAudioIn.VOLUMERANGE_INVALID.
            result = obj.InvokeMethod_S(1831727627);
        end

        function result = get_signal(obj)
            % Returns the detected input signal level.
            %
            % @return an integer corresponding to the detected input signal level
            %
            % On failure, throws an exception or returns YAudioIn.SIGNAL_INVALID.
            result = obj.InvokeMethod_D(-720183956);
        end

        function result = get.Signal(obj)
            result = obj.GetPropInt32(1939902659);
        end

        function result = get_noSignalFor(obj)
            % Returns the number of seconds elapsed without detecting a signal.
            %
            % @return an integer corresponding to the number of seconds elapsed without detecting a signal
            %
            % On failure, throws an exception or returns YAudioIn.NOSIGNALFOR_INVALID.
            result = obj.InvokeMethod_D(1187454913);
        end

        % //--- (end of YAudioIn accessors declaration)
    end
end
