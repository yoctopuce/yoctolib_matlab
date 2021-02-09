% YWirelessProxy: wireless LAN interface control interface, available for instance in the
% YoctoHub-Wireless, the YoctoHub-Wireless-SR, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
% 
% The YWireless class provides control over wireless network parameters and status for devices that
% are wireless-enabled. Note that TCP/IP parameters are configured separately, using class
% <tt>YNetwork</tt>.

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


% //--- (YWireless declaration)
classdef YWirelessProxy < YoctoProxyAPI.YFunctionProxy
    % YWirelessProxy: wireless LAN interface control interface, available for instance in the
    % YoctoHub-Wireless, the YoctoHub-Wireless-SR, the YoctoHub-Wireless-g or the YoctoHub-Wireless-n
    % 
    % The YWireless class provides control over wireless network parameters and status for devices that
    % are wireless-enabled. Note that TCP/IP parameters are configured separately, using class
    % <tt>YNetwork</tt>.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
        % LinkQuality Link quality, expressed in percent
        LinkQuality (1,1) int32
        % Ssid Wireless network name (SSID)
        Ssid (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of YWireless declaration)

    % //--- (YWireless implementation)
    methods (Hidden)
        function obj = YWirelessProxy()
            % YWirelessProxy For internal use as System Object.
            % Use FindWireless() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1054526540;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindWireless(func)
            % FindWireless Retrieve instances of YWirelessProxy
            obj = YoctoProxyAPI.YWirelessProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindWireless to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1054526540);
        end
    end
    % //--- (end of YWireless implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YWirelessProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Wireless');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Wireless', ...
                'PropertyList', {'LinkQuality','Ssid'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Wireless settings', ...
                'PropertyList', {});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropInt32(-1385947561);
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int32';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'LinkQuality';
        end
    end

    methods
        % //--- (YWireless accessors declaration)

        function result = get_linkQuality(obj)
            % Returns the link quality, expressed in percent.
            %
            % @return an integer corresponding to the link quality, expressed in percent
            %
            % On failure, throws an exception or returns YWireless.LINKQUALITY_INVALID.
            result = obj.InvokeMethod_D(-1702114621);
        end

        function result = get.LinkQuality(obj)
            result = obj.GetPropInt32(-1385947561);
        end

        function result = get.Ssid(obj)
            result = obj.GetPropString(1353440502);
        end

        function result = get_ssid(obj)
            % Returns the wireless network name (SSID).
            %
            % @return a string corresponding to the wireless network name (SSID)
            %
            % On failure, throws an exception or returns YWireless.SSID_INVALID.
            result = obj.InvokeMethod_S(-826815888);
        end

        function result = get_channel(obj)
            % Returns the 802.11 channel currently used, or 0 when the selected network has not been found.
            %
            % @return an integer corresponding to the 802.11 channel currently used, or 0 when the
            % selected network has not been found
            %
            % On failure, throws an exception or returns YWireless.CHANNEL_INVALID.
            result = obj.InvokeMethod_D(-1801753993);
        end

        function result = get_security(obj)
            % Returns the security algorithm used by the selected wireless network.
            %
            % @return a value among YWireless.SECURITY_UNKNOWN, YWireless.SECURITY_OPEN,
            % YWireless.SECURITY_WEP, YWireless.SECURITY_WPA and YWireless.SECURITY_WPA2
            % corresponding to the security algorithm used by the selected wireless network
            %
            % On failure, throws an exception or returns YWireless.SECURITY_INVALID.
            result = YoctoProxyAPI.EnumSecurity(obj.InvokeMethod_D(769924446));
        end

        function result = get_message(obj)
            % Returns the latest status message from the wireless interface.
            %
            % @return a string corresponding to the latest status message from the wireless interface
            %
            % On failure, throws an exception or returns YWireless.MESSAGE_INVALID.
            result = obj.InvokeMethod_S(739170692);
        end

        function result = get_wlanState(obj)
            % Returns the current state of the wireless interface. The state YWireless.WLANSTATE_DOWN
            % means that the network interface is
            % not connected to a network. The state YWireless.WLANSTATE_SCANNING means that the
            % network interface is scanning available
            % frequencies. During this stage, the device is not reachable, and the network settings
            % are not yet applied. The state
            % YWireless.WLANSTATE_CONNECTED means that the network settings have been successfully
            % applied ant that the device is reachable
            % from the wireless network. If the device is configured to use ad-hoc or Soft AP mode,
            % it means that the wireless network
            % is up and that other devices can join the network. The state
            % YWireless.WLANSTATE_REJECTED means that the network interface has
            % not been able to join the requested network. The description of the error can be obtain
            % with the get_message() method.
            %
            % @return a value among YWireless.WLANSTATE_DOWN, YWireless.WLANSTATE_SCANNING,
            % YWireless.WLANSTATE_CONNECTED and YWireless.WLANSTATE_REJECTED corresponding to the
            % current state of the wireless interface
            %
            % On failure, throws an exception or returns YWireless.WLANSTATE_INVALID.
            result = YoctoProxyAPI.EnumWlanState(obj.InvokeMethod_D(1619322823));
        end

        function result = startWlanScan(obj)
            % Triggers a scan of the wireless frequency and builds the list of available networks.
            % The scan forces a disconnection from the current network. At then end of the process, the
            % the network interface attempts to reconnect to the previous network. During the scan, the wlanState
            % switches to YWireless.WLANSTATE_DOWN, then to YWireless.WLANSTATE_SCANNING. When the
            % scan is completed,
            % get_wlanState() returns either YWireless.WLANSTATE_DOWN or YWireless.WLANSTATE_SCANNING. At this
            % point, the list of detected network can be retrieved with the get_detectedWlans() method.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1723855061);
        end

        function result = joinNetwork(obj, ssid, securityKey)
            % Changes the configuration of the wireless lan interface to connect to an existing
            % access point (infrastructure mode).
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param ssid : the name of the network to connect to
            % @param securityKey : the network key, as a character string
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(613514785, ssid, securityKey);
        end

        function result = adhocNetwork(obj, ssid, securityKey)
            % Changes the configuration of the wireless lan interface to create an ad-hoc
            % wireless network, without using an access point. On the YoctoHub-Wireless-g
            % and YoctoHub-Wireless-n,
            % you should use softAPNetwork() instead, which emulates an access point
            % (Soft AP) which is more efficient and more widely supported than ad-hoc networks.
            %
            % When a security key is specified for an ad-hoc network, the network is protected
            % by a WEP40 key (5 characters or 10 hexadecimal digits) or WEP128 key (13 characters
            % or 26 hexadecimal digits). It is recommended to use a well-randomized WEP128 key
            % using 26 hexadecimal digits to maximize security.
            % Remember to call the saveToFlash() method and then to reboot the module
            % to apply this setting.
            %
            % @param ssid : the name of the network to connect to
            % @param securityKey : the network key, as a character string
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(1042564611, ssid, securityKey);
        end

        function result = softAPNetwork(obj, ssid, securityKey)
            % Changes the configuration of the wireless lan interface to create a new wireless
            % network by emulating a WiFi access point (Soft AP). This function can only be
            % used with the YoctoHub-Wireless-g and the YoctoHub-Wireless-n.
            %
            % On the YoctoHub-Wireless-g, when a security key is specified for a SoftAP network,
            % the network is protected by a WEP40 key (5 characters or 10 hexadecimal digits) or
            % WEP128 key (13 characters or 26 hexadecimal digits). It is recommended to use a
            % well-randomized WEP128 key using 26 hexadecimal digits to maximize security.
            %
            % On the YoctoHub-Wireless-n, when a security key is specified for a SoftAP network,
            % the network will be protected by WPA2.
            %
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param ssid : the name of the network to connect to
            % @param securityKey : the network key, as a character string
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(-1036902186, ssid, securityKey);
        end

        function result = get_detectedWlans(obj)
            % Returns a list of YWlanRecord objects that describe detected Wireless networks.
            % This list is not updated when the module is already connected to an access point
            % (infrastructure mode).
            % To force an update of this list, startWlanScan() must be called.
            % Note that an languages without garbage collections, the returned list must be freed by the caller.
            %
            % @return a list of YWlanRecord objects, containing the SSID, channel,
            %         link quality and the type of security of the wireless network.
            %
            % On failure, throws an exception or returns an empty list.
            result = obj.InvokeMethod_xW(2075795762);
        end

        % //--- (end of YWireless accessors declaration)
    end
end
