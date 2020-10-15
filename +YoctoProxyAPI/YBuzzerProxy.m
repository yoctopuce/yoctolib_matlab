% YBuzzerProxy: buzzer control interface, available for instance in the Yocto-Buzzer or the
% Yocto-MaxiBuzzer
% 
% The YBuzzerProxy class allows you to drive a buzzer. You can choose the frequency and the volume at
% which the buzzer must sound. You can also pre-program a play sequence.

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


% //--- (YBuzzer declaration)
classdef YBuzzerProxy < YoctoProxyAPI.YFunctionProxy
    % YBuzzerProxy: buzzer control interface, available for instance in the Yocto-Buzzer or the
    % Yocto-MaxiBuzzer
    % 
    % The YBuzzerProxy class allows you to drive a buzzer. You can choose the frequency and the volume at
    % which the buzzer must sound. You can also pre-program a play sequence.

    properties (Transient, Nontunable)
        % Frequency Frequency of the signal sent to the buzzer/speaker
        Frequency (1,1) double
        % Volume Volume of the signal sent to the buzzer/speaker
        Volume (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % PlaySeqMaxSize Maximum length of the playing sequence
        PlaySeqMaxSize (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YBuzzer declaration)

    % //--- (YBuzzer implementation)
    methods (Hidden)
        function obj = YBuzzerProxy()
            % YBuzzerProxy For internal use as System Object.
            % Use FindBuzzer() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 956647415;
            obj.numInputs = 1;
        end
    end

    methods (Static)
        function obj = FindBuzzer(func)
            % FindBuzzer Retrieve instances of YBuzzerProxy
            obj = YoctoProxyAPI.YBuzzerProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindBuzzer to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(956647415);
        end
    end
    % //--- (end of YBuzzer implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YBuzzerProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Buzzer');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Buzzer', ...
                'PropertyList', {'Frequency','Volume'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Buzzer settings', ...
                'PropertyList', {'PlaySeqMaxSize'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(obj, varargin)
            if nargin >= 1
                obj.SetPropDouble(-1534182736, varargin{1});
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [name1] = getInputNamesImpl(~)
            name1 = 'Frequency';
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YBuzzer accessors declaration)

        function set_frequency(obj, newVal)
            % Changes the frequency of the signal sent to the buzzer. A zero value stops the buzzer.
            %
            % @param newval : a floating point number corresponding to the frequency of the signal
            % sent to the buzzer
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-338166865, newVal);
        end

        function result = get_frequency(obj)
            % Returns the  frequency of the signal sent to the buzzer/speaker.
            %
            % @return a floating point number corresponding to the  frequency of the signal sent to
            % the buzzer/speaker
            %
            % On failure, throws an exception or returns Y_FREQUENCY_INVALID.
            result = obj.InvokeMethod_F(514269515);
        end

        function result = get.Frequency(obj)
            result = obj.GetPropDouble(-1534182736);
        end

        function set.Frequency(obj, newVal)
            obj.Frequency = newVal;
            obj.SetPropDouble(-1534182736, newVal);
        end

        function result = get_volume(obj)
            % Returns the volume of the signal sent to the buzzer/speaker.
            %
            % @return an integer corresponding to the volume of the signal sent to the buzzer/speaker
            %
            % On failure, throws an exception or returns Y_VOLUME_INVALID.
            result = obj.InvokeMethod_D(-959302571);
        end

        function set_volume(obj, newVal)
            % Changes the volume of the signal sent to the buzzer/speaker. Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the volume of the signal sent to the buzzer/speaker
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

        function result = get_playSeqSize(obj)
            % Returns the current length of the playing sequence.
            %
            % @return an integer corresponding to the current length of the playing sequence
            %
            % On failure, throws an exception or returns Y_PLAYSEQSIZE_INVALID.
            result = obj.InvokeMethod_D(-1452664099);
        end

        function result = get_playSeqMaxSize(obj)
            % Returns the maximum length of the playing sequence.
            %
            % @return an integer corresponding to the maximum length of the playing sequence
            %
            % On failure, throws an exception or returns Y_PLAYSEQMAXSIZE_INVALID.
            result = obj.InvokeMethod_D(-1457883673);
        end

        function result = get.PlaySeqMaxSize(obj)
            result = obj.GetPropInt32(690799168);
        end

        function result = get_playSeqSignature(obj)
            % Returns the playing sequence signature. As playing
            % sequences cannot be read from the device, this can be used
            % to detect if a specific playing sequence is already
            % programmed.
            %
            % @return an integer corresponding to the playing sequence signature
            %
            % On failure, throws an exception or returns Y_PLAYSEQSIGNATURE_INVALID.
            result = obj.InvokeMethod_D(-1137764101);
        end

        function result = addFreqMoveToPlaySeq(obj, freq, msDelay)
            % Adds a new frequency transition to the playing sequence.
            %
            % @param freq    : desired frequency when the transition is completed, in Hz
            % @param msDelay : duration of the frequency transition, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1172786252, freq, msDelay);
        end

        function result = addPulseToPlaySeq(obj, freq, msDuration)
            % Adds a pulse to the playing sequence.
            %
            % @param freq : pulse frequency, in Hz
            % @param msDuration : pulse duration, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(576765521, freq, msDuration);
        end

        function result = addVolMoveToPlaySeq(obj, volume, msDuration)
            % Adds a new volume transition to the playing sequence. Frequency stays untouched:
            % if frequency is at zero, the transition has no effect.
            %
            % @param volume    : desired volume when the transition is completed, as a percentage.
            % @param msDuration : duration of the volume transition, in milliseconds.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(779706383, volume, msDuration);
        end

        function result = addNotesToPlaySeq(obj, notes)
            % Adds notes to the playing sequence. Notes are provided as text words, separated by
            % spaces. The pitch is specified using the usual letter from A to G. The duration is
            % specified as the divisor of a whole note: 4 for a fourth, 8 for an eight note, etc.
            % Some modifiers are supported: # and b to alter a note pitch,
            % ' and , to move to the upper/lower octave, . to enlarge
            % the note duration.
            %
            % @param notes : notes to be played, as a text string.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1417042561, notes);
        end

        function result = startPlaySeq(obj)
            % Starts the preprogrammed playing sequence. The sequence
            % runs in loop until it is stopped by stopPlaySeq or an explicit
            % change. To play the sequence only once, use oncePlaySeq().
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1240697977);
        end

        function result = stopPlaySeq(obj)
            % Stops the preprogrammed playing sequence and sets the frequency to zero.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2072801120);
        end

        function result = resetPlaySeq(obj)
            % Resets the preprogrammed playing sequence and sets the frequency to zero.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-628903813);
        end

        function result = oncePlaySeq(obj)
            % Starts the preprogrammed playing sequence and run it once only.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2021895561);
        end

        function result = savePlaySeq(obj)
            % Saves the preprogrammed playing sequence to flash memory.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(83147438);
        end

        function result = reloadPlaySeq(obj)
            % Reloads the preprogrammed playing sequence from the flash memory.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1757310773);
        end

        function result = pulse(obj, frequency, duration)
            % Activates the buzzer for a short duration.
            %
            % @param frequency : pulse frequency, in hertz
            % @param duration : pulse duration in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-841230266, frequency, duration);
        end

        function result = freqMove(obj, frequency, duration)
            % Makes the buzzer frequency change over a period of time.
            %
            % @param frequency : frequency to reach, in hertz. A frequency under 25Hz stops the buzzer.
            % @param duration :  pulse duration in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(647901388, frequency, duration);
        end

        function result = volumeMove(obj, volume, duration)
            % Makes the buzzer volume change over a period of time, frequency  stays untouched.
            %
            % @param volume : volume to reach in %
            % @param duration : change duration in milliseconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ddd(-1775642985, volume, duration);
        end

        function result = playNotes(obj, notes)
            % Immediately play a note sequence. Notes are provided as text words, separated by
            % spaces. The pitch is specified using the usual letter from A to G. The duration is
            % specified as the divisor of a whole note: 4 for a fourth, 8 for an eight note, etc.
            % Some modifiers are supported: # and b to alter a note pitch,
            % ' and , to move to the upper/lower octave, . to enlarge
            % the note duration.
            %
            % @param notes : notes to be played, as a text string.
            %
            % @return 0 if the call succeeds.
            %         On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-1534079259, notes);
        end

        % //--- (end of YBuzzer accessors declaration)
    end
end
