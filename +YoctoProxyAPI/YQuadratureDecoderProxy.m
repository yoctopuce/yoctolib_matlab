% YQuadratureDecoderProxy: quadrature decoder control interface, available for instance in the
% Yocto-PWM-Rx
% 
% The YQuadratureDecoderProxy class allows you to read and configure Yoctopuce quadrature decoders.
% It inherits from <tt>YSensor</tt> class the core functions to read measurements, to register
% callback functions, and to access the autonomous datalogger.

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


% //--- (YQuadratureDecoder declaration)
classdef YQuadratureDecoderProxy < YoctoProxyAPI.YSensorProxy
    % YQuadratureDecoderProxy: quadrature decoder control interface, available for instance in the
    % Yocto-PWM-Rx
    % 
    % The YQuadratureDecoderProxy class allows you to read and configure Yoctopuce quadrature decoders.
    % It inherits from <tt>YSensor</tt> class the core functions to read measurements, to register
    % callback functions, and to access the autonomous datalogger.

    properties (Transient, Nontunable)
        % Decoding Current activation state of the quadrature decoder
        Decoding (1,1) YoctoProxyAPI.EnumDecoding
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YQuadratureDecoder declaration)

    % //--- (YQuadratureDecoder implementation)
    methods (Hidden)
        function obj = YQuadratureDecoderProxy()
            % YQuadratureDecoderProxy For internal use as System Object.
            % Use FindQuadratureDecoder() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = 45759629;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindQuadratureDecoder(func)
            % FindQuadratureDecoder Retrieve instances of YQuadratureDecoderProxy
            obj = YoctoProxyAPI.YQuadratureDecoderProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindQuadratureDecoder to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(45759629);
        end
    end
    % //--- (end of YQuadratureDecoder implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YQuadratureDecoderProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'QuadratureDecoder');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'QuadratureDecoder', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'QuadratureDecoder settings', ...
                'PropertyList', {'Decoding'});
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
        % //--- (YQuadratureDecoder accessors declaration)

        function set_currentValue(obj, newVal)
            % Changes the current expected position of the quadrature decoder.
            % Invoking this function implicitly activates the quadrature decoder.
            %
            % @param newval : a floating point number corresponding to the current expected position
            % of the quadrature decoder
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_f(-189450195, newVal);
        end

        function result = get_speed(obj)
            % Returns the increments frequency, in Hz.
            %
            % @return a floating point number corresponding to the increments frequency, in Hz
            %
            % On failure, throws an exception or returns Y_SPEED_INVALID.
            result = obj.InvokeMethod_F(1646620777);
        end

        function result = get_decoding(obj)
            % Returns the current activation state of the quadrature decoder.
            %
            % @return either Y_DECODING_OFF or Y_DECODING_ON, according to the current activation
            % state of the quadrature decoder
            %
            % On failure, throws an exception or returns Y_DECODING_INVALID.
            result = YoctoProxyAPI.EnumDecoding(obj.InvokeMethod_D(-676619192));
        end

        function set_decoding(obj, newVal)
            % Changes the activation state of the quadrature decoder.
            % Remember to call the saveToFlash()
            % method of the module if the modification must be kept.
            %
            % @param newval : either Y_DECODING_OFF or Y_DECODING_ON, according to the activation
            % state of the quadrature decoder
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1814360073, newVal);
        end

        function result = get.Decoding(obj)
            result = YoctoProxyAPI.EnumDecoding(obj.GetPropInt32(1603522429));
        end

        function set.Decoding(obj, newVal)
            obj.Decoding = newVal;
            obj.SetPropInt32(1603522429, newVal);
        end

        % //--- (end of YQuadratureDecoder accessors declaration)
    end
end
