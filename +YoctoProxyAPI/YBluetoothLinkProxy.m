% YBluetoothLinkProxy: Bluetooth sound controller control interface
% 
% BluetoothLink function provides control over Bluetooth link and status for devices that are
% Bluetooth-enabled.

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


% //--- (YBluetoothLink declaration)
classdef YBluetoothLinkProxy < YoctoProxyAPI.YFunctionProxy
    % YBluetoothLinkProxy: Bluetooth sound controller control interface
    % 
    % BluetoothLink function provides control over Bluetooth link and status for devices that are
    % Bluetooth-enabled.

    properties (Transient, Nontunable)
        % PairingPin N opaque string if a PIN code has been configured in the device to access
        PairingPin (1,:) char
        % RemoteAddress MAC-48 address of the remote device to connect to
        RemoteAddress (1,:) char
        % Mute State of the mute function
        Mute (1,1) YoctoProxyAPI.EnumMute
        % PreAmplifier Audio pre-amplifier volume, in per cents
        PreAmplifier (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % LinkQuality Bluetooth receiver signal strength, in pourcents, or 0 if no connection is established
        LinkQuality (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YBluetoothLink declaration)

    % //--- (YBluetoothLink implementation)
    methods (Hidden)
        function obj = YBluetoothLinkProxy()
            % YBluetoothLinkProxy For internal use as System Object.
            % Use FindBluetoothLink() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 270005284;
        end
    end

    methods (Static)
        function obj = FindBluetoothLink(func)
            % FindBluetoothLink Retrieve instances of YBluetoothLinkProxy
            obj = YoctoProxyAPI.YBluetoothLinkProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindBluetoothLink to obtain
            % an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(270005284);
        end
    end
    % //--- (end of YBluetoothLink implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YBluetoothLinkProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'BluetoothLink');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'BluetoothLink', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'BluetoothLink settings', ...
                'PropertyList', {'PairingPin','RemoteAddress','Mute','PreAmplifier','LinkQuality'});
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
        % //--- (YBluetoothLink accessors declaration)

        function result = get_ownAddress(obj)
            % Returns the MAC-48 address of the bluetooth interface, which is unique on the bluetooth network.
            %
            % @return a string corresponding to the MAC-48 address of the bluetooth interface, which
            % is unique on the bluetooth network
            %
            % On failure, throws an exception or returns Y_OWNADDRESS_INVALID.
            result = obj.InvokeMethod_S(-746092875);
        end

        function result = get_pairingPin(obj)
            % Returns an opaque string if a PIN code has been configured in the device to access
            % the SIM card, or an empty string if none has been configured or if the code provided
            % was rejected by the SIM card.
            %
            % @return a string corresponding to an opaque string if a PIN code has been configured in
            % the device to access
            %         the SIM card, or an empty string if none has been configured or if the code provided
            %         was rejected by the SIM card
            %
            % On failure, throws an exception or returns Y_PAIRINGPIN_INVALID.
            result = obj.InvokeMethod_S(819819591);
        end

        function set_pairingPin(obj, newVal)
            % Changes the PIN code used by the module for bluetooth pairing.
            % Remember to call the saveToFlash() method of the module to save the
            % new value in the device flash.
            %
            % @param newval : a string corresponding to the PIN code used by the module for bluetooth pairing
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(967124630, newVal);
        end

        function result = get.PairingPin(obj)
            result = obj.GetPropString(2018831182);
        end

        function set.PairingPin(obj, newVal)
            obj.PairingPin = newVal;
            obj.SetPropString(2018831182, newVal);
        end

        function result = get_remoteAddress(obj)
            % Returns the MAC-48 address of the remote device to connect to.
            %
            % @return a string corresponding to the MAC-48 address of the remote device to connect to
            %
            % On failure, throws an exception or returns Y_REMOTEADDRESS_INVALID.
            result = obj.InvokeMethod_S(1895368578);
        end

        function set_remoteAddress(obj, newVal)
            % Changes the MAC-48 address defining which remote device to connect to.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the MAC-48 address defining which remote
            % device to connect to
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1313009246, newVal);
        end

        function result = get.RemoteAddress(obj)
            result = obj.GetPropString(119860743);
        end

        function set.RemoteAddress(obj, newVal)
            obj.RemoteAddress = newVal;
            obj.SetPropString(119860743, newVal);
        end

        function result = get_remoteName(obj)
            % Returns the bluetooth name the remote device, if found on the bluetooth network.
            %
            % @return a string corresponding to the bluetooth name the remote device, if found on the
            % bluetooth network
            %
            % On failure, throws an exception or returns Y_REMOTENAME_INVALID.
            result = obj.InvokeMethod_S(-499691144);
        end

        function result = get_mute(obj)
            % Returns the state of the mute function.
            %
            % @return either Y_MUTE_FALSE or Y_MUTE_TRUE, according to the state of the mute function
            %
            % On failure, throws an exception or returns Y_MUTE_INVALID.
            result = YoctoProxyAPI.EnumMute(obj.InvokeMethod_D(1481194633));
        end

        function set_mute(obj, newVal)
            % Changes the state of the mute function. Remember to call the matching module
            % saveToFlash() method to save the setting permanently.
            %
            % @param newval : either Y_MUTE_FALSE or Y_MUTE_TRUE, according to the state of the mute function
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

        function result = get_preAmplifier(obj)
            % Returns the audio pre-amplifier volume, in per cents.
            %
            % @return an integer corresponding to the audio pre-amplifier volume, in per cents
            %
            % On failure, throws an exception or returns Y_PREAMPLIFIER_INVALID.
            result = obj.InvokeMethod_D(-1337737274);
        end

        function set_preAmplifier(obj, newVal)
            % Changes the audio pre-amplifier volume, in per cents.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the audio pre-amplifier volume, in per cents
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1373236208, newVal);
        end

        function result = get.PreAmplifier(obj)
            result = obj.GetPropInt32(-1398814721);
        end

        function set.PreAmplifier(obj, newVal)
            obj.PreAmplifier = newVal;
            obj.SetPropInt32(-1398814721, newVal);
        end

        function result = get_volume(obj)
            % Returns the connected headset volume, in per cents.
            %
            % @return an integer corresponding to the connected headset volume, in per cents
            %
            % On failure, throws an exception or returns Y_VOLUME_INVALID.
            result = obj.InvokeMethod_D(-959302571);
        end

        function set_volume(obj, newVal)
            % Changes the connected headset volume, in per cents.
            %
            % @param newval : an integer corresponding to the connected headset volume, in per cents
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-224214498, newVal);
        end

        function result = get_linkState(obj)
            % Returns the bluetooth link state.
            %
            % @return a value among Y_LINKSTATE_DOWN, Y_LINKSTATE_FREE, Y_LINKSTATE_SEARCH,
            % Y_LINKSTATE_EXISTS, Y_LINKSTATE_LINKED and Y_LINKSTATE_PLAY corresponding to the
            % bluetooth link state
            %
            % On failure, throws an exception or returns Y_LINKSTATE_INVALID.
            result = YoctoProxyAPI.EnumLinkState(obj.InvokeMethod_D(-1675383111));
        end

        function result = get_linkQuality(obj)
            % Returns the bluetooth receiver signal strength, in pourcents, or 0 if no connection is established.
            %
            % @return an integer corresponding to the bluetooth receiver signal strength, in
            % pourcents, or 0 if no connection is established
            %
            % On failure, throws an exception or returns Y_LINKQUALITY_INVALID.
            result = obj.InvokeMethod_D(-1702114621);
        end

        function result = get.LinkQuality(obj)
            result = obj.GetPropInt32(-1385947561);
        end

        function result = connect(obj)
            % Attempt to connect to the previously selected remote device.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(74507780);
        end

        function result = disconnect(obj)
            % Disconnect from the previously selected remote device.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-2078280300);
        end

        % //--- (end of YBluetoothLink accessors declaration)
    end
end
