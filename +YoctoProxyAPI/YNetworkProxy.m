% YNetworkProxy: network interface control interface, available for instance in the
% YoctoHub-Ethernet, the YoctoHub-GSM-4G, the YoctoHub-Wireless-SR or the YoctoHub-Wireless-n
% 
% YNetworkProxy objects provide access to TCP/IP parameters of Yoctopuce devices that include a
% built-in network interface.

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


% //--- (YNetwork declaration)
classdef YNetworkProxy < YoctoProxyAPI.YFunctionProxy
    % YNetworkProxy: network interface control interface, available for instance in the
    % YoctoHub-Ethernet, the YoctoHub-GSM-4G, the YoctoHub-Wireless-SR or the YoctoHub-Wireless-n
    % 
    % YNetworkProxy objects provide access to TCP/IP parameters of Yoctopuce devices that include a
    % built-in network interface.

    properties (Transient, Nontunable)
        % PrimaryDNS IP address of the primary name server to be used by the module
        PrimaryDNS (1,:) char
        % SecondaryDNS IP address of the secondary name server to be used by the module
        SecondaryDNS (1,:) char
        % NtpServer IP address of the NTP server to be used by the device
        NtpServer (1,:) char
        % UserPassword Hash string if a password has been set for "user" user,
        UserPassword (1,:) char
        % AdminPassword Hash string if a password has been set for user "admin",
        AdminPassword (1,:) char
        % HttpPort TCP port used to serve the hub web UI
        HttpPort (1,1) int32
        % DefaultPage HTML page to serve for the URL "/"" of the hub
        DefaultPage (1,:) char
        % Discoverable Activation state of the multicast announce protocols to allow easy
        Discoverable (1,1) YoctoProxyAPI.EnumDiscoverable
        % WwwWatchdogDelay Allowed downtime of the WWW link (in seconds) before triggering an automated
        WwwWatchdogDelay (1,1) int32
        % CallbackUrl Callback URL to notify of significant state changes
        CallbackUrl (1,:) char
        % CallbackMethod HTTP method used to notify callbacks for significant state changes
        CallbackMethod (1,1) YoctoProxyAPI.EnumCallbackMethod
        % CallbackEncoding Encoding standard to use for representing notification values
        CallbackEncoding (1,1) YoctoProxyAPI.EnumCallbackEncoding
        % CallbackTemplate Activation state of the custom template file to customize callback
        CallbackTemplate (1,1) YoctoProxyAPI.EnumCallbackTemplate
        % CallbackCredentials Hashed version of the notification callback credentials if set,
        CallbackCredentials (1,:) char
        % CallbackInitialDelay Initial waiting time before first callback notifications, in seconds
        CallbackInitialDelay (1,1) int32
        % CallbackSchedule HTTP callback schedule strategy, as a text string
        CallbackSchedule (1,:) char
        % CallbackMinDelay Minimum waiting time between two HTTP callbacks, in seconds
        CallbackMinDelay (1,1) int32
        % CallbackMaxDelay Waiting time between two HTTP callbacks when there is nothing new
        CallbackMaxDelay (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % Readiness Current established working mode of the network interface
        Readiness (1,1) YoctoProxyAPI.EnumReadiness
        % IpAddress IP address currently in use by the device
        IpAddress (1,:) char
        % MacAddress MAC address of the network interface
        MacAddress (1,:) char
    end

    properties (Constant)
    end
    % //--- (end of YNetwork declaration)

    % //--- (YNetwork implementation)
    methods (Hidden)
        function obj = YNetworkProxy()
            % YNetworkProxy For internal use as System Object.
            % Use FindNetwork() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1355170272;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindNetwork(func)
            % FindNetwork Retrieve instances of YNetworkProxy
            obj = YoctoProxyAPI.YNetworkProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindNetwork to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1355170272);
        end
    end
    % //--- (end of YNetwork implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YNetworkProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Network');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Network', ...
                'PropertyList', {'Readiness','IpAddress'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Network settings', ...
                'PropertyList', {'MacAddress','PrimaryDNS','SecondaryDNS','NtpServer','UserPassword','AdminPassword','HttpPort','DefaultPage','Discoverable','WwwWatchdogDelay','CallbackUrl','CallbackMethod','CallbackEncoding','CallbackTemplate','CallbackCredentials','CallbackInitialDelay','CallbackSchedule','CallbackMinDelay','CallbackMaxDelay'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = YoctoProxyAPI.EnumReadiness(obj.GetPropInt32(1356550120));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'YoctoProxyAPI.EnumReadiness';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1] = getOutputNamesImpl(~)
            name1 = 'Readiness';
        end
    end

    methods
        % //--- (YNetwork accessors declaration)

        function result = get_readiness(obj)
            % Returns the current established working mode of the network interface.
            % Level zero (DOWN_0) means that no hardware link has been detected. Either there is no signal
            % on the network cable, or the selected wireless access point cannot be detected.
            % Level 1 (LIVE_1) is reached when the network is detected, but is not yet connected.
            % For a wireless network, this shows that the requested SSID is present.
            % Level 2 (LINK_2) is reached when the hardware connection is established.
            % For a wired network connection, level 2 means that the cable is attached at both ends.
            % For a connection to a wireless access point, it shows that the security parameters
            % are properly configured. For an ad-hoc wireless connection, it means that there is
            % at least one other device connected on the ad-hoc network.
            % Level 3 (DHCP_3) is reached when an IP address has been obtained using DHCP.
            % Level 4 (DNS_4) is reached when the DNS server is reachable on the network.
            % Level 5 (WWW_5) is reached when global connectivity is demonstrated by properly loading the
            % current time from an NTP server.
            %
            % @return a value among YNetwork.READINESS_DOWN, YNetwork.READINESS_EXISTS,
            % YNetwork.READINESS_LINKED, YNetwork.READINESS_LAN_OK and YNetwork.READINESS_WWW_OK
            % corresponding to the current established working mode of the network interface
            %
            % On failure, throws an exception or returns YNetwork.READINESS_INVALID.
            result = YoctoProxyAPI.EnumReadiness(obj.InvokeMethod_D(-1566251299));
        end

        function result = get.Readiness(obj)
            result = YoctoProxyAPI.EnumReadiness(obj.GetPropInt32(1356550120));
        end

        function result = get.IpAddress(obj)
            result = obj.GetPropString(1744288001);
        end

        function result = get_macAddress(obj)
            % Returns the MAC address of the network interface. The MAC address is also available on a sticker
            % on the module, in both numeric and barcode forms.
            %
            % @return a string corresponding to the MAC address of the network interface
            %
            % On failure, throws an exception or returns YNetwork.MACADDRESS_INVALID.
            result = obj.InvokeMethod_S(-1946051310);
        end

        function result = get.MacAddress(obj)
            result = obj.GetPropString(-1037213766);
        end

        function result = get_ipAddress(obj)
            % Returns the IP address currently in use by the device. The address may have been configured
            % statically, or provided by a DHCP server.
            %
            % @return a string corresponding to the IP address currently in use by the device
            %
            % On failure, throws an exception or returns YNetwork.IPADDRESS_INVALID.
            result = obj.InvokeMethod_S(-99267654);
        end

        function result = get_subnetMask(obj)
            % Returns the subnet mask currently used by the device.
            %
            % @return a string corresponding to the subnet mask currently used by the device
            %
            % On failure, throws an exception or returns YNetwork.SUBNETMASK_INVALID.
            result = obj.InvokeMethod_S(2086686677);
        end

        function result = get_router(obj)
            % Returns the IP address of the router on the device subnet (default gateway).
            %
            % @return a string corresponding to the IP address of the router on the device subnet
            % (default gateway)
            %
            % On failure, throws an exception or returns YNetwork.ROUTER_INVALID.
            result = obj.InvokeMethod_S(70211729);
        end

        function result = get_currentDNS(obj)
            % Returns the IP address of the DNS server currently used by the device.
            %
            % @return a string corresponding to the IP address of the DNS server currently used by the device
            %
            % On failure, throws an exception or returns YNetwork.CURRENTDNS_INVALID.
            result = obj.InvokeMethod_S(-589221023);
        end

        function result = get_ipConfig(obj)
            % Returns the IP configuration of the network interface.
            %
            % If the network interface is setup to use a static IP address, the string starts with
            % "STATIC:" and is followed by three
            % parameters, separated by "/". The first is the device IP address, followed by the
            % subnet mask length, and finally the
            % router IP address (default gateway). For instance: "STATIC:192.168.1.14/16/192.168.1.1"
            %
            % If the network interface is configured to receive its IP from a DHCP server, the string
            % start with "DHCP:" and is followed by
            % three parameters separated by "/". The first is the fallback IP address, then the
            % fallback subnet mask length and finally the
            % fallback router IP address. These three parameters are used when no DHCP reply is received.
            %
            % @return a string corresponding to the IP configuration of the network interface
            %
            % On failure, throws an exception or returns YNetwork.IPCONFIG_INVALID.
            result = obj.InvokeMethod_S(12286809);
        end

        function result = get_primaryDNS(obj)
            % Returns the IP address of the primary name server to be used by the module.
            %
            % @return a string corresponding to the IP address of the primary name server to be used by the module
            %
            % On failure, throws an exception or returns YNetwork.PRIMARYDNS_INVALID.
            result = obj.InvokeMethod_S(-1161755185);
        end

        function set_primaryDNS(obj, newVal)
            % Changes the IP address of the primary name server to be used by the module.
            % When using DHCP, if a value is specified, it overrides the value received from the DHCP server.
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param newval : a string corresponding to the IP address of the primary name server to
            % be used by the module
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1279699170, newVal);
        end

        function result = get.PrimaryDNS(obj)
            result = obj.GetPropString(478696519);
        end

        function set.PrimaryDNS(obj, newVal)
            obj.PrimaryDNS = newVal;
            obj.SetPropString(478696519, newVal);
        end

        function result = get_secondaryDNS(obj)
            % Returns the IP address of the secondary name server to be used by the module.
            %
            % @return a string corresponding to the IP address of the secondary name server to be
            % used by the module
            %
            % On failure, throws an exception or returns YNetwork.SECONDARYDNS_INVALID.
            result = obj.InvokeMethod_S(-587688735);
        end

        function set_secondaryDNS(obj, newVal)
            % Changes the IP address of the secondary name server to be used by the module.
            % When using DHCP, if a value is specified, it overrides the value received from the DHCP server.
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param newval : a string corresponding to the IP address of the secondary name server
            % to be used by the module
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1029882057, newVal);
        end

        function result = get.SecondaryDNS(obj)
            result = obj.GetPropString(-1347971057);
        end

        function set.SecondaryDNS(obj, newVal)
            obj.SecondaryDNS = newVal;
            obj.SetPropString(-1347971057, newVal);
        end

        function result = get_ntpServer(obj)
            % Returns the IP address of the NTP server to be used by the device.
            %
            % @return a string corresponding to the IP address of the NTP server to be used by the device
            %
            % On failure, throws an exception or returns YNetwork.NTPSERVER_INVALID.
            result = obj.InvokeMethod_S(-1727990748);
        end

        function set_ntpServer(obj, newVal)
            % Changes the IP address of the NTP server to be used by the module. Use an empty
            % string to restore the factory set  address.
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param newval : a string corresponding to the IP address of the NTP server to be used by the module
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(1819291328, newVal);
        end

        function result = get.NtpServer(obj)
            result = obj.GetPropString(-668405223);
        end

        function set.NtpServer(obj, newVal)
            obj.NtpServer = newVal;
            obj.SetPropString(-668405223, newVal);
        end

        function result = get_userPassword(obj)
            % Returns a hash string if a password has been set for "user" user,
            % or an empty string otherwise.
            %
            % @return a string corresponding to a hash string if a password has been set for "user" user,
            %         or an empty string otherwise
            %
            % On failure, throws an exception or returns YNetwork.USERPASSWORD_INVALID.
            result = obj.InvokeMethod_S(151096115);
        end

        function set_userPassword(obj, newVal)
            % Changes the password for the "user" user. This password becomes instantly required
            % to perform any use of the module. If the specified value is an
            % empty string, a password is not required anymore.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the password for the "user" user
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(392437989, newVal);
        end

        function result = get.UserPassword(obj)
            result = obj.GetPropString(-121634804);
        end

        function set.UserPassword(obj, newVal)
            obj.UserPassword = newVal;
            obj.SetPropString(-121634804, newVal);
        end

        function result = get_adminPassword(obj)
            % Returns a hash string if a password has been set for user "admin",
            % or an empty string otherwise.
            %
            % @return a string corresponding to a hash string if a password has been set for user "admin",
            %         or an empty string otherwise
            %
            % On failure, throws an exception or returns YNetwork.ADMINPASSWORD_INVALID.
            result = obj.InvokeMethod_S(2013864002);
        end

        function set_adminPassword(obj, newVal)
            % Changes the password for the "admin" user. This password becomes instantly required
            % to perform any change of the module state. If the specified value is an
            % empty string, a password is not required anymore.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the password for the "admin" user
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1186122142, newVal);
        end

        function result = get.AdminPassword(obj)
            result = obj.GetPropString(-809628542);
        end

        function set.AdminPassword(obj, newVal)
            obj.AdminPassword = newVal;
            obj.SetPropString(-809628542, newVal);
        end

        function result = get_httpPort(obj)
            % Returns the TCP port used to serve the hub web UI.
            %
            % @return an integer corresponding to the TCP port used to serve the hub web UI
            %
            % On failure, throws an exception or returns YNetwork.HTTPPORT_INVALID.
            result = obj.InvokeMethod_D(-2050966540);
        end

        function set_httpPort(obj, newVal)
            % Changes the the TCP port used to serve the hub web UI. The default value is port 80,
            % which is the default for all Web servers. Regardless of the value set here,
            % the hub will always reply on port 4444, which is used by default by Yoctopuce
            % API library. When you change this parameter, remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the the TCP port used to serve the hub web UI
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1045419957, newVal);
        end

        function result = get.HttpPort(obj)
            result = obj.GetPropInt32(754675967);
        end

        function set.HttpPort(obj, newVal)
            obj.HttpPort = newVal;
            obj.SetPropInt32(754675967, newVal);
        end

        function result = get_defaultPage(obj)
            % Returns the HTML page to serve for the URL "/"" of the hub.
            %
            % @return a string corresponding to the HTML page to serve for the URL "/"" of the hub
            %
            % On failure, throws an exception or returns YNetwork.DEFAULTPAGE_INVALID.
            result = obj.InvokeMethod_S(1994900688);
        end

        function set_defaultPage(obj, newVal)
            % Changes the default HTML page returned by the hub. If not value are set the hub return
            % "index.html" which is the web interface of the hub. It is possible to change this page
            % for file that has been uploaded on the hub. The maximum filename size is 15 characters.
            % When you change this parameter, remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the default HTML page returned by the hub
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(701520554, newVal);
        end

        function result = get.DefaultPage(obj)
            result = obj.GetPropString(1370029086);
        end

        function set.DefaultPage(obj, newVal)
            obj.DefaultPage = newVal;
            obj.SetPropString(1370029086, newVal);
        end

        function result = get_discoverable(obj)
            % Returns the activation state of the multicast announce protocols to allow easy
            % discovery of the module in the network neighborhood (uPnP/Bonjour protocol).
            %
            % @return either YNetwork.DISCOVERABLE_FALSE or YNetwork.DISCOVERABLE_TRUE, according to
            % the activation state of the multicast announce protocols to allow easy
            %         discovery of the module in the network neighborhood (uPnP/Bonjour protocol)
            %
            % On failure, throws an exception or returns YNetwork.DISCOVERABLE_INVALID.
            result = YoctoProxyAPI.EnumDiscoverable(obj.InvokeMethod_D(-1567888708));
        end

        function set_discoverable(obj, newVal)
            % Changes the activation state of the multicast announce protocols to allow easy
            % discovery of the module in the network neighborhood (uPnP/Bonjour protocol).
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : either YNetwork.DISCOVERABLE_FALSE or YNetwork.DISCOVERABLE_TRUE,
            % according to the activation state of the multicast announce protocols to allow easy
            %         discovery of the module in the network neighborhood (uPnP/Bonjour protocol)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1125236374, newVal);
        end

        function result = get.Discoverable(obj)
            result = YoctoProxyAPI.EnumDiscoverable(obj.GetPropInt32(2058888627));
        end

        function set.Discoverable(obj, newVal)
            obj.Discoverable = newVal;
            obj.SetPropInt32(2058888627, newVal);
        end

        function result = get_wwwWatchdogDelay(obj)
            % Returns the allowed downtime of the WWW link (in seconds) before triggering an automated
            % reboot to try to recover Internet connectivity. A zero value disables automated reboot
            % in case of Internet connectivity loss.
            %
            % @return an integer corresponding to the allowed downtime of the WWW link (in seconds)
            % before triggering an automated
            %         reboot to try to recover Internet connectivity
            %
            % On failure, throws an exception or returns YNetwork.WWWWATCHDOGDELAY_INVALID.
            result = obj.InvokeMethod_D(-644019196);
        end

        function set_wwwWatchdogDelay(obj, newVal)
            % Changes the allowed downtime of the WWW link (in seconds) before triggering an automated
            % reboot to try to recover Internet connectivity. A zero value disables automated reboot
            % in case of Internet connectivity loss. The smallest valid non-zero timeout is
            % 90 seconds. Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the allowed downtime of the WWW link (in
            % seconds) before triggering an automated
            %         reboot to try to recover Internet connectivity
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(396752269, newVal);
        end

        function result = get.WwwWatchdogDelay(obj)
            result = obj.GetPropInt32(380497578);
        end

        function set.WwwWatchdogDelay(obj, newVal)
            obj.WwwWatchdogDelay = newVal;
            obj.SetPropInt32(380497578, newVal);
        end

        function result = get_callbackUrl(obj)
            % Returns the callback URL to notify of significant state changes.
            %
            % @return a string corresponding to the callback URL to notify of significant state changes
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKURL_INVALID.
            result = obj.InvokeMethod_S(-1139488800);
        end

        function set_callbackUrl(obj, newVal)
            % Changes the callback URL to notify significant state changes. Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the callback URL to notify significant state changes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-484222566, newVal);
        end

        function result = get.CallbackUrl(obj)
            result = obj.GetPropString(-111853320);
        end

        function set.CallbackUrl(obj, newVal)
            obj.CallbackUrl = newVal;
            obj.SetPropString(-111853320, newVal);
        end

        function result = get_callbackMethod(obj)
            % Returns the HTTP method used to notify callbacks for significant state changes.
            %
            % @return a value among YNetwork.CALLBACKMETHOD_POST, YNetwork.CALLBACKMETHOD_GET and
            % YNetwork.CALLBACKMETHOD_PUT corresponding to the HTTP method used to notify callbacks
            % for significant state changes
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKMETHOD_INVALID.
            result = YoctoProxyAPI.EnumCallbackMethod(obj.InvokeMethod_D(-2133847885));
        end

        function set_callbackMethod(obj, newVal)
            % Changes the HTTP method used to notify callbacks for significant state changes.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YNetwork.CALLBACKMETHOD_POST, YNetwork.CALLBACKMETHOD_GET
            % and YNetwork.CALLBACKMETHOD_PUT corresponding to the HTTP method used to notify
            % callbacks for significant state changes
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(362115079, newVal);
        end

        function result = get.CallbackMethod(obj)
            result = YoctoProxyAPI.EnumCallbackMethod(obj.GetPropInt32(-377950888));
        end

        function set.CallbackMethod(obj, newVal)
            obj.CallbackMethod = newVal;
            obj.SetPropInt32(-377950888, newVal);
        end

        function result = get_callbackEncoding(obj)
            % Returns the encoding standard to use for representing notification values.
            %
            % @return a value among YNetwork.CALLBACKENCODING_FORM, YNetwork.CALLBACKENCODING_JSON,
            % YNetwork.CALLBACKENCODING_JSON_ARRAY, YNetwork.CALLBACKENCODING_CSV,
            % YNetwork.CALLBACKENCODING_YOCTO_API, YNetwork.CALLBACKENCODING_JSON_NUM,
            % YNetwork.CALLBACKENCODING_EMONCMS, YNetwork.CALLBACKENCODING_AZURE,
            % YNetwork.CALLBACKENCODING_INFLUXDB, YNetwork.CALLBACKENCODING_MQTT,
            % YNetwork.CALLBACKENCODING_YOCTO_API_JZON, YNetwork.CALLBACKENCODING_PRTG and
            % YNetwork.CALLBACKENCODING_INFLUXDB_V2 corresponding to the encoding standard to use for
            % representing notification values
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKENCODING_INVALID.
            result = YoctoProxyAPI.EnumCallbackEncoding(obj.InvokeMethod_D(495202488));
        end

        function set_callbackEncoding(obj, newVal)
            % Changes the encoding standard to use for representing notification values.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YNetwork.CALLBACKENCODING_FORM,
            % YNetwork.CALLBACKENCODING_JSON, YNetwork.CALLBACKENCODING_JSON_ARRAY,
            % YNetwork.CALLBACKENCODING_CSV, YNetwork.CALLBACKENCODING_YOCTO_API,
            % YNetwork.CALLBACKENCODING_JSON_NUM, YNetwork.CALLBACKENCODING_EMONCMS,
            % YNetwork.CALLBACKENCODING_AZURE, YNetwork.CALLBACKENCODING_INFLUXDB,
            % YNetwork.CALLBACKENCODING_MQTT, YNetwork.CALLBACKENCODING_YOCTO_API_JZON,
            % YNetwork.CALLBACKENCODING_PRTG and YNetwork.CALLBACKENCODING_INFLUXDB_V2 corresponding
            % to the encoding standard to use for representing notification values
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-742602447, newVal);
        end

        function result = get.CallbackEncoding(obj)
            result = YoctoProxyAPI.EnumCallbackEncoding(obj.GetPropInt32(1734391266));
        end

        function set.CallbackEncoding(obj, newVal)
            obj.CallbackEncoding = newVal;
            obj.SetPropInt32(1734391266, newVal);
        end

        function result = get_callbackTemplate(obj)
            % Returns the activation state of the custom template file to customize callback
            % format. If the custom callback template is disabled, it will be ignored even
            % if present on the YoctoHub.
            %
            % @return either YNetwork.CALLBACKTEMPLATE_OFF or YNetwork.CALLBACKTEMPLATE_ON, according
            % to the activation state of the custom template file to customize callback
            %         format
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKTEMPLATE_INVALID.
            result = YoctoProxyAPI.EnumCallbackTemplate(obj.InvokeMethod_D(866259103));
        end

        function set_callbackTemplate(obj, newVal)
            % Enable the use of a template file to customize callbacks format.
            % When the custom callback template file is enabled, the template file
            % will be loaded for each callback in order to build the data to post to the
            % server. If template file does not exist on the YoctoHub, the callback will
            % fail with an error message indicating the name of the expected template file.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : either YNetwork.CALLBACKTEMPLATE_OFF or YNetwork.CALLBACKTEMPLATE_ON
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-40179434, newVal);
        end

        function result = get.CallbackTemplate(obj)
            result = YoctoProxyAPI.EnumCallbackTemplate(obj.GetPropInt32(-1740090578));
        end

        function set.CallbackTemplate(obj, newVal)
            obj.CallbackTemplate = newVal;
            obj.SetPropInt32(-1740090578, newVal);
        end

        function result = get_callbackCredentials(obj)
            % Returns a hashed version of the notification callback credentials if set,
            % or an empty string otherwise.
            %
            % @return a string corresponding to a hashed version of the notification callback credentials if set,
            %         or an empty string otherwise
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKCREDENTIALS_INVALID.
            result = obj.InvokeMethod_S(-1102651335);
        end

        function set_callbackCredentials(obj, newVal)
            % Changes the credentials required to connect to the callback address. The credentials
            % must be provided as returned by function get_callbackCredentials,
            % in the form username:hash. The method used to compute the hash varies according
            % to the the authentication scheme implemented by the callback, For Basic authentication,
            % the hash is the MD5 of the string username:password. For Digest authentication,
            % the hash is the MD5 of the string username:realm:password. For a simpler
            % way to configure callback credentials, use function callbackLogin instead.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the credentials required to connect to the
            % callback address
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(646098276, newVal);
        end

        function result = get.CallbackCredentials(obj)
            result = obj.GetPropString(1121734337);
        end

        function set.CallbackCredentials(obj, newVal)
            obj.CallbackCredentials = newVal;
            obj.SetPropString(1121734337, newVal);
        end

        function callbackLogin(obj, username, password)
            % Connects to the notification callback and saves the credentials required to
            % log into it. The password is not stored into the module, only a hashed
            % copy of the credentials are saved. Remember to call the
            % saveToFlash() method of the module if the modification must be kept.
            %
            % @param username : username required to log to the callback
            % @param password : password required to log to the callback
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_ss(2002495633, username, password);
        end

        function result = get_callbackInitialDelay(obj)
            % Returns the initial waiting time before first callback notifications, in seconds.
            %
            % @return an integer corresponding to the initial waiting time before first callback
            % notifications, in seconds
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKINITIALDELAY_INVALID.
            result = obj.InvokeMethod_D(-1640292899);
        end

        function set_callbackInitialDelay(obj, newVal)
            % Changes the initial waiting time before first callback notifications, in seconds.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the initial waiting time before first
            % callback notifications, in seconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(630452403, newVal);
        end

        function result = get.CallbackInitialDelay(obj)
            result = obj.GetPropInt32(1870200206);
        end

        function set.CallbackInitialDelay(obj, newVal)
            obj.CallbackInitialDelay = newVal;
            obj.SetPropInt32(1870200206, newVal);
        end

        function result = get_callbackSchedule(obj)
            % Returns the HTTP callback schedule strategy, as a text string.
            %
            % @return a string corresponding to the HTTP callback schedule strategy, as a text string
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKSCHEDULE_INVALID.
            result = obj.InvokeMethod_S(-1339062535);
        end

        function set_callbackSchedule(obj, newVal)
            % Changes the HTTP callback schedule strategy, as a text string.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : a string corresponding to the HTTP callback schedule strategy, as a text string
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(2115469168, newVal);
        end

        function result = get.CallbackSchedule(obj)
            result = obj.GetPropString(1427135830);
        end

        function set.CallbackSchedule(obj, newVal)
            obj.CallbackSchedule = newVal;
            obj.SetPropString(1427135830, newVal);
        end

        function result = get_callbackMinDelay(obj)
            % Returns the minimum waiting time between two HTTP callbacks, in seconds.
            %
            % @return an integer corresponding to the minimum waiting time between two HTTP callbacks, in seconds
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKMINDELAY_INVALID.
            result = obj.InvokeMethod_D(1911203787);
        end

        function set_callbackMinDelay(obj, newVal)
            % Changes the minimum waiting time between two HTTP callbacks, in seconds.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the minimum waiting time between two HTTP
            % callbacks, in seconds
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1076732350, newVal);
        end

        function result = get.CallbackMinDelay(obj)
            result = obj.GetPropInt32(-1202906832);
        end

        function set.CallbackMinDelay(obj, newVal)
            obj.CallbackMinDelay = newVal;
            obj.SetPropInt32(-1202906832, newVal);
        end

        function result = get_callbackMaxDelay(obj)
            % Returns the waiting time between two HTTP callbacks when there is nothing new.
            %
            % @return an integer corresponding to the waiting time between two HTTP callbacks when
            % there is nothing new
            %
            % On failure, throws an exception or returns YNetwork.CALLBACKMAXDELAY_INVALID.
            result = obj.InvokeMethod_D(1894137215);
        end

        function set_callbackMaxDelay(obj, newVal)
            % Changes the waiting time between two HTTP callbacks when there is nothing new.
            % Remember to call the saveToFlash() method of the module if the modification must be kept.
            %
            % @param newval : an integer corresponding to the waiting time between two HTTP callbacks
            % when there is nothing new
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1092696842, newVal);
        end

        function result = get.CallbackMaxDelay(obj)
            result = obj.GetPropInt32(1580054225);
        end

        function set.CallbackMaxDelay(obj, newVal)
            obj.CallbackMaxDelay = newVal;
            obj.SetPropInt32(1580054225, newVal);
        end

        function result = get_poeCurrent(obj)
            % Returns the current consumed by the module from Power-over-Ethernet (PoE), in milliamps.
            % The current consumption is measured after converting PoE source to 5 Volt, and should
            % never exceed 1800 mA.
            %
            % @return an integer corresponding to the current consumed by the module from
            % Power-over-Ethernet (PoE), in milliamps
            %
            % On failure, throws an exception or returns YNetwork.POECURRENT_INVALID.
            result = obj.InvokeMethod_D(-2587002);
        end

        function result = useDHCP(obj, fallbackIpAddr, fallbackSubnetMaskLen, fallbackRouter)
            % Changes the configuration of the network interface to enable the use of an
            % IP address received from a DHCP server. Until an address is received from a DHCP
            % server, the module uses the IP parameters specified to this function.
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param fallbackIpAddr : fallback IP address, to be used when no DHCP reply is received
            % @param fallbackSubnetMaskLen : fallback subnet mask length when no DHCP reply is received, as an
            %         integer (e.g. 24 means 255.255.255.0)
            % @param fallbackRouter : fallback router IP address, to be used when no DHCP reply is received
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dsds(-1488525231, fallbackIpAddr, fallbackSubnetMaskLen, fallbackRouter);
        end

        function result = useDHCPauto(obj)
            % Changes the configuration of the network interface to enable the use of an
            % IP address received from a DHCP server. Until an address is received from a DHCP
            % server, the module uses an IP of the network 169.254.0.0/16 (APIPA).
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(-1241905517);
        end

        function result = useStaticIP(obj, ipAddress, subnetMaskLen, router)
            % Changes the configuration of the network interface to use a static IP address.
            % Remember to call the saveToFlash() method and then to reboot the module to apply this setting.
            %
            % @param ipAddress : device IP address
            % @param subnetMaskLen : subnet mask length, as an integer (e.g. 24 means 255.255.255.0)
            % @param router : router IP address (default gateway)
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dsds(-393634237, ipAddress, subnetMaskLen, router);
        end

        function result = ping(obj, host)
            % Pings host to test the network connectivity. Sends four ICMP ECHO_REQUEST requests from the
            % module to the target host. This method returns a string with the result of the
            % 4 ICMP ECHO_REQUEST requests.
            %
            % @param host : the hostname or the IP address of the target
            %
            % @return a string with the result of the ping.
            result = obj.InvokeMethod_Ss(-512356147, host);
        end

        function result = triggerCallback(obj)
            % Trigger an HTTP callback quickly. This function can even be called within
            % an HTTP callback, in which case the next callback will be triggered 5 seconds
            % after the end of the current callback, regardless if the minimum time between
            % callbacks configured in the device.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(198977409);
        end

        function result = set_periodicCallbackSchedule(obj, interval, offset)
            % Setup periodic HTTP callbacks (simplified function).
            %
            % @param interval : a string representing the callback periodicity, expressed in
            %         seconds, minutes or hours, eg. "60s", "5m", "1h", "48h".
            % @param offset : an integer representing the time offset relative to the period
            %         when the callback should occur. For instance, if the periodicity is
            %         24h, an offset of 7 will make the callback occur each day at 7AM.
            %
            % @return 0 when the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dsd(-607134974, interval, offset);
        end

        % //--- (end of YNetwork accessors declaration)
    end
end
