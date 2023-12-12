%YAPIProxy General functions
%   These general functions should be used to initialize and configure
%   the Yoctopuce library. In most cases, a simple call to function 
%   YAPIProxy.RegisterHub() should be enough. The module-specific 
%   functions Y***Proxy.Find***() should then be used to retrieve an
%   object that provides interaction with the module.

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

classdef YAPIProxy
    %YAPIProxy General functions
    %   These general functions should be used to initialize and configure
    %   the Yoctopuce library. In most cases, a simple call to function 
    %   YAPIProxy.RegisterHub() should be enough. The module-specific 
    %   functions Y***Proxy.Find***() should then be used to retrieve an
    %   object that provides interaction with the module.
    
    methods(Hidden, Static, Access = { ?YoctoProxyAPI.YFunctionProxy })
        function [ libPath,hPath ] = GetDLLPath()
            %GetDLLPath Helper to locate the proper shared library
            thisDir = fileparts(mfilename('fullpath'));
            switch computer('arch')
                case 'win64'
                    libFile = 'cppproxy64.dll';
                case 'win32'
                    libFile = 'cppproxy.dll';
                case 'glnx86'
                    libFile = 'libcppproxy-i386.so';
                case 'glnxa64'
                    libFile = 'libcppproxy-amd64.so';
                case 'maci64'
                    libFile = 'libcppproxy.dylib';
                otherwise
                    ME = MException('YAPIProxy:unknownArch', ...
                        'Unsupported architecture: %s', ...
                        computer('arch'));
                    throw(ME)
            end
            libPath = fullfile(thisDir,'ypalib',libFile);
            hPath = fullfile(thisDir,'ypalib','ypa.h');
        end
        
        function LoadDLL()
            %LoadDLL Helper to load the proper shared library if needed
            import YoctoProxyAPI.YAPIProxy.*
            if ~libisloaded('ypa')
                [ libPath, hPath ] = GetDLLPath();
                loadlibrary(libPath, hPath, 'alias', 'ypa');
            end
        end
        
        function result = SizeT(sz)
            %SizeT Helper to return a size_t number
            persistent arch64Bit
            if isempty(arch64Bit)
                [~,maxArraySize] = computer; 
                arch64Bit = (maxArraySize > 2^31);
            end
            if arch64Bit
                result = int64(sz);
            else
                result = int32(sz);
            end
        end
        
        function result = SizePtr(sz)
            %SizePtr Helper to return a pointer to size_t
            persistent ptrTypeName
            if isempty(ptrTypeName)
                [~,maxArraySize] = computer; 
                if maxArraySize > 2^31
                    ptrTypeName = 'uint64Ptr';
                else
                    ptrTypeName = 'uint32Ptr';
                end
            end
            result = libpointer(ptrTypeName, sz);
        end       
    end
    
    methods(Static)
        function result = GetAPIVersion()
            %GetAPIVersion Returns the version identifier for the Yoctopuce
            %library in use.
            %   The version is a string in the form "Major.Minor.Build", 
            %   for instance "1.01.5535". As MATLAB uses an external DLL 
            %   for low-level device access, the character
            %   string includes as well the DLL version, for instance 
            %   "1.01.5535 (1.01.5439)".
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, pRes, ~ ] = calllib('ypa', 'ypaGetAPIVersion', blanks(32), SizePtr(32));
            result = [ '1.10.58438 (' pRes ')'];
        end

        function result = GetDllArchitecture()
            %GetDllArchitecture Returns the system architecture for the
            %Yoctopuce communication library in use.
            %   On Windows, the architecture can be "Win32" or "Win64". On
            %   ARM machines, the architecture is "Armhf32" or "Aarch64".
            %   On other Linux machines, the architecture is "Linux32" or
            %   "Linux64". On MacOS, the architecture is "MacOs32" or
            %   "MacOs64".
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, pRes, ~ ] = calllib('ypa', 'ypaGetAPIArchitecture', blanks(32), SizePtr(32));
            result = pRes;
        end

        function result = GetDllPath()
            %GetDllPath Returns the system architecture for the
            %Yoctopuce communication library in use.
            %   On Windows, the architecture can be "Win32" or "Win64". On
            %   ARM machines, the architecture is "Armhf32" or "Aarch64".
            %   On other Linux machines, the architecture is "Linux32" or
            %   "Linux64". On MacOS, the architecture is "MacOs32" or
            %   "MacOs64".
            import YoctoProxyAPI.YAPIProxy.*
            [ libPath, ~ ] = GetDLLPath();
            result = libPath;
        end

        function result = GetLog(lastLogLine)
            %GetLog Retrieves Yoctopuce low-level library diagnostic logs.
            %   This method allows to progessively retrieve API logs. The
            %   interface is line-based: it must called it within a loop
            %   until the returned value is an empty string. Make sure to
            %   exit the loop when an empty string is returned, as feeding
            %   an empty string into the lastLogLine parameter for the next
            %   call would restart enumerating logs from the oldest message
            %   available.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, ~, pRes, ~ ] = calllib('ypa', 'ypaGetLog', char(lastLogLine), blanks(512), SizePtr(512));
            result = pRes;
        end

        function result = GetNetworkTimeout()
            %GetNetworkTimeout Returns the network connection delay for YAPI.RegisterHub().
            %   This delay impacts only the YoctoHubs and VirtualHub which
            %   are accessible through the network. By default, this delay
            %   is of 20000 milliseconds, but depending or you network you
            %   may want to change this delay, for example if your network
            %   infrastructure is based on a GSM connection.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, pRes ] = calllib('ypa', 'ypaGetNetworkTimeout', libpointer('int32Ptr',int32(0)));
            result = pRes;
        end

        function SetNetworkTimeout(mstimeout)
            %SetNetworkTimeout Modifies the network connection delay for YAPI.RegisterHub().
            %   This delay impacts only the YoctoHubs and VirtualHub which
            %   are accessible through the network. By default, this delay
            %   is of 20000 milliseconds, but depending or you network you
            %   may want to change this delay, gor example if your network
            %   infrastructure is based on a GSM connection.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            calllib('ypa', 'ypaSetNetworkTimeout', mstimeout);
        end

        function result = TestHub(url, mstimeout)
            %TestHub Test if the hub is reachable.
            %   This method do not register the hub, it only test if the
            %   hub is usable. The url parameter follow the same convention
            %   as the YAPI.RegisterHub method. This method is useful to
            %   verify the authentication parameters for a hub. It is
            %   possible to force this method to return after mstimeout
            %   milliseconds.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, ~, pRes, ~ ] = calllib('ypa', 'ypaTestHub', char(url), ...
                int32(mstimeout), blanks(512), SizePtr(512));
            result = pRes;
        end

        function result = RegisterHub(url)
            %RegisterHub Setup the Yoctopuce library to use modules connected on a given machine.
            %   The parameter will determine how the API will work. Use the following values:
            %   - usb: When the usb keyword is used, the API will work with
            %          devices connected directly to the USB bus. Some programming
            %          languages such a JavaScript, PHP, and Java don't provide
            %          direct access to USB hardware, so usb will not work with
            %          these. In this case, use a VirtualHub or a networked
            %          YoctoHub (see below).
            %   - x.x.x.x or hostname: The API will use the devices
            %          connected to the host with the given IP address or
            %          hostname. That host can be a regular computer running a
            %          VirtualHub, or a networked YoctoHub such as
            %          YoctoHub-Ethernet or YoctoHub-Wireless. If you want to use
            %          the VirtualHub running on you local computer, use the IP
            %          address 127.0.0.1.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, ~, pRes, ~ ] = calllib('ypa', 'ypaRegisterHub', char(url), blanks(512), SizePtr(512));
            result = pRes;
        end

        function result = PreregisterHub(url)
            %PreregisterHub Fault-tolerant alternative to YAPI.RegisterHub().
            %   This function has the same purpose and same arguments as
            %   YAPI.RegisterHub(), but does not trigger an error when the
            %   selected hub is not available at the time of the function
            %   call. This makes it possible to register a network hub
            %   independently of the current connectivity, and to try to
            %   contact it only when a device is actively needed.
            import YoctoProxyAPI.YAPIProxy.*
            LoadDLL();
            [ ~, ~, pRes, ~ ] = calllib('ypa', 'ypaPreregisterHub', char(url), blanks(512), SizePtr(512));
            result = pRes;
        end

        function FreeAPI()
            %FreeAPI Frees dynamically allocated memory blocks used by the
            %Yoctopuce library.
            %   Free all dynamically allocated ressources, and unload the
            %   shared library. You should not call any other library
            %   function after calling YAPIProxy.FreeAPI(), or your program
            %   will crash.
            calllib('ypa', 'ypaFreeAPI');
            unloadlibrary('ypa');
        end
    end
end

