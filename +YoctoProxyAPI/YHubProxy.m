% YHubProxy: Hub Interface
% 
% 

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


% //--- (YHub declaration)
classdef YHubProxy < matlab.System
    % YHubProxy: Hub Interface
    % 
    %

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YHub declaration)

    methods
        % //--- (YHub accessors declaration)

        function result = get_registeredUrl(obj)
            % Returns the URL that has been used first to register this hub.
            result = obj.InvokeMethod_S(1545208206);
        end

        function result = get_knownUrls(obj)
            % Returns all known URLs that have been used to register this hub.
            % URLs are pointing to the same hub when the devices connected
            % are sharing the same serial number.
            result = obj.InvokeMethod_xS(-830125988);
        end

        function result = get_connectionUrl(obj)
            % Returns the URL currently in use to communicate with this hub.
            result = obj.InvokeMethod_S(-1677070421);
        end

        function result = get_serialNumber(obj)
            % Returns the hub serial number, if the hub was already connected once.
            result = obj.InvokeMethod_S(-1800874479);
        end

        function result = isInUse(obj)
            % Tells if this hub is still registered within the API.
            %
            % @return true if the hub has not been unregistered.
            result = obj.InvokeMethod_B(-1242575737);
        end

        function result = isOnline(obj)
            % Tells if there is an active communication channel with this hub.
            %
            % @return true if the hub is currently connected.
            result = obj.InvokeMethod_B(-144544284);
        end

        function result = isReadOnly(obj)
            % Tells if write access on this hub is blocked. Return true if it
            % is not possible to change attributes on this hub
            %
            % @return true if it is not possible to change attributes on this hub.
            result = obj.InvokeMethod_B(913241503);
        end

        function result = set_networkTimeout(obj, networkMsTimeout)
            % Modifies tthe network connection delay for this hub.
            % The default value is inherited from ySetNetworkTimeout
            % at the time when the hub is registered, but it can be updated
            % afterward for each specific hub if necessary.
            %
            % @param networkMsTimeout : the network connection delay in milliseconds.
            % @noreturn
            result = obj.InvokeMethod_Dd(1112147335, networkMsTimeout);
        end

        function result = get_networkTimeout(obj)
            % Returns the network connection delay for this hub.
            % The default value is inherited from ySetNetworkTimeout
            % at the time when the hub is registered, but it can be updated
            % afterward for each specific hub if necessary.
            %
            % @return the network connection delay in milliseconds.
            result = obj.InvokeMethod_D(1507646231);
        end

        function result = get_errorType(obj)
            % Returns the numerical error code of the latest error with the hub.
            % This method is mostly useful when using the Yoctopuce library with
            % exceptions disabled.
            %
            % @return a number corresponding to the code of the latest error that occurred while
            %         using the hub object
            result = obj.InvokeMethod_D(1191848374);
        end

        function result = get_errorMessage(obj)
            % Returns the error message of the latest error with the hub.
            % This method is mostly useful when using the Yoctopuce library with
            % exceptions disabled.
            %
            % @return a string corresponding to the latest error message that occured while
            %         using the hub object
            result = obj.InvokeMethod_S(2027571326);
        end

        function result = get_userData(obj)
            % Returns the value of the userData attribute, as previously stored
            % using method set_userData.
            % This attribute is never touched directly by the API, and is at
            % disposal of the caller to store a context.
            %
            % @return the object stored previously by the caller.
            result = obj.InvokeMethod_D(210648146);
        end

        function result = set_userData(obj, data)
            % Stores a user context provided as argument in the userData
            % attribute of the function.
            % This attribute is never touched by the API, and is at
            % disposal of the caller to store a context.
            %
            % @param data : any kind of object to be stored
            % @noreturn
            result = obj.InvokeMethod_DD(-389796148, data);
        end

        function result = FirstHubInUse(obj)
            % Starts the enumeration of hubs currently in use by the API.
            % Use the method YHub.nextHubInUse() to iterate on the
            % next hubs.
            %
            % @return a pointer to a YHub object, corresponding to
            %         the first hub currently in use by the API, or a
            %         null pointer if none has been registered.
            result = obj.InvokeMethod_H(509972744);
        end

        function result = nextHubInUse(obj)
            % Continues the module enumeration started using YHub.FirstHubInUse().
            % Caution: You can't make any assumption about the order of returned hubs.
            %
            % @return a pointer to a YHub object, corresponding to
            %         the next hub currenlty in use, or a null pointer
            %         if there are no more hubs to enumerate.
            result = obj.InvokeMethod_H(757590763);
        end

        % //--- (end of YHub accessors declaration)
    end
end
