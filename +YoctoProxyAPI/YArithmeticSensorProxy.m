% YArithmeticSensorProxy: arithmetic sensor control interface, available for instance in the
% Yocto-MaxiMicroVolt-Rx
% 
% The YArithmeticSensorProxy class allows some Yoctopuce devices to compute in real-time values based
% on an arithmetic formula involving one or more measured signals as well as the temperature. As for
% any physical sensor, the computed values can be read by callback and stored in the built-in
% datalogger.

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


% //--- (YArithmeticSensor declaration)
classdef YArithmeticSensorProxy < YoctoProxyAPI.YSensorProxy
    % YArithmeticSensorProxy: arithmetic sensor control interface, available for instance in the
    % Yocto-MaxiMicroVolt-Rx
    % 
    % The YArithmeticSensorProxy class allows some Yoctopuce devices to compute in real-time values based
    % on an arithmetic formula involving one or more measured signals as well as the temperature. As for
    % any physical sensor, the computed values can be read by callback and stored in the built-in
    % datalogger.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YArithmeticSensor declaration)

    % //--- (YArithmeticSensor implementation)
    methods (Hidden)
        function obj = YArithmeticSensorProxy()
            % YArithmeticSensorProxy For internal use as System Object.
            % Use FindArithmeticSensor() instead.
            obj = obj@YoctoProxyAPI.YSensorProxy();
            obj.classHandle = -901979247;
            obj.numOutputs = 1;
        end
    end

    methods (Static)
        function obj = FindArithmeticSensor(func)
            % FindArithmeticSensor Retrieve instances of YArithmeticSensorProxy
            obj = YoctoProxyAPI.YArithmeticSensorProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindArithmeticSensor to
            % obtain an object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-901979247);
        end
    end
    % //--- (end of YArithmeticSensor implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YArithmeticSensorProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'ArithmeticSensor');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YSensorProxy();
            section = matlab.system.display.Section(...
                'Title', 'ArithmeticSensor', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'ArithmeticSensor settings', ...
                'PropertyList', {});
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
        % //--- (YArithmeticSensor accessors declaration)

        function set_unit(obj, newVal)
            % Changes the measuring unit for the arithmetic sensor.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a string corresponding to the measuring unit for the arithmetic sensor
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_s(-1986799500, newVal);
        end

        function result = get_description(obj)
            % Returns a short informative description of the formula.
            %
            % @return a string corresponding to a short informative description of the formula
            %
            % On failure, throws an exception or returns Y_DESCRIPTION_INVALID.
            result = obj.InvokeMethod_S(282193973);
        end

        function result = defineExpression(obj, expr, descr)
            % Defines the arithmetic function by means of an algebraic expression. The expression
            % may include references to device sensors, by their physical or logical name, to
            % usual math functions and to auxiliary functions defined separately.
            %
            % @param expr : the algebraic expression defining the function.
            % @param descr : short informative description of the expression.
            %
            % @return the current expression value if the call succeeds.
            %
            % On failure, throws an exception or returns YAPI_INVALID_DOUBLE.
            result = obj.InvokeMethod_Fss(949736265, expr, descr);
        end

        function result = loadExpression(obj)
            % Retrieves the algebraic expression defining the arithmetic function, as previously
            % configured using the defineExpression function.
            %
            % @return a string containing the mathematical expression.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_S(-845603074);
        end

        function result = defineAuxiliaryFunction(obj, name, vector<double>(inputValues), vector<double>(outputValues))
            % Defines a auxiliary function by means of a table of reference points. Intermediate values
            % will be interpolated between specified reference points. The reference points are given
            % as pairs of floating point numbers.
            % The auxiliary function will be available for use by all ArithmeticSensor objects of the
            % device. Up to nine auxiliary function can be defined in a device, each containing up to
            % 96 reference points.
            %
            % @param name : auxiliary function name, up to 16 characters.
            % @param inputValues : array of floating point numbers, corresponding to the function input value.
            % @param outputValues : array of floating point numbers, corresponding to the output value
            %         desired for each of the input value, index by index.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dsxfxf(271307659, name, vector<double>(inputValues), vector<double>(outputValues));
        end

        % //--- (end of YArithmeticSensor accessors declaration)
    end
end
