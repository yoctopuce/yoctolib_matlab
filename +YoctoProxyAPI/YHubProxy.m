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

        function result = get_userData(obj)
            % Returns the value of the userData attribute, as previously stored
            % using method set_userData.
            % This attribute is never touched directly by the API, and is at
            % disposal of the caller to store a context.
            %
            % @return the object stored previously by the caller.
            result = obj.InvokeMethod_?(-883321626);
        end

        function result = set_userData(obj, data)
            % Stores a user context provided as argument in the userData
            % attribute of the function.
            % This attribute is never touched by the API, and is at
            % disposal of the caller to store a context.
            %
            % @param data : any kind of object to be stored
            % @noreturn
            result = obj.InvokeMethod_??(-472373691, data);
        end

        % //--- (end of YHub accessors declaration)
    end
end
