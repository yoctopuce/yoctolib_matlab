% YGpsProxy: Geolocalization control interface (GPS, GNSS, ...), available for instance in the
% Yocto-GPS-V2
% 
% The YGpsProxy class allows you to retrieve positioning data from a GPS/GNSS sensor. This class can
% provides complete positioning information. However, if you wish to define callbacks on position
% changes or record the position in the datalogger, you should use the <tt>YLatitude</tt> et
% <tt>YLongitude</tt> classes.

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


% //--- (YGps declaration)
classdef YGpsProxy < YoctoProxyAPI.YFunctionProxy
    % YGpsProxy: Geolocalization control interface (GPS, GNSS, ...), available for instance in the
    % Yocto-GPS-V2
    % 
    % The YGpsProxy class allows you to retrieve positioning data from a GPS/GNSS sensor. This class can
    % provides complete positioning information. However, if you wish to define callbacks on position
    % changes or record the position in the datalogger, you should use the <tt>YLatitude</tt> et
    % <tt>YLongitude</tt> classes.

    properties (Transient, Nontunable)
        % CoordSystem Representation system used for positioning data
        CoordSystem (1,1) YoctoProxyAPI.EnumCoordSystem
        % UtcOffset Number of seconds between current time and UTC time (time zone)
        UtcOffset (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % SatCount Total count of satellites used to compute GPS position
        SatCount (1,1) int64
        % IsFixed True if the receiver has found enough satellites to work
        IsFixed (1,1) YoctoProxyAPI.EnumIsFixed
    end

    properties (Constant)
    end
    % //--- (end of YGps declaration)

    % //--- (YGps implementation)
    methods (Hidden)
        function obj = YGpsProxy()
            % YGpsProxy For internal use as System Object.
            % Use FindGps() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = 1822890791;
            obj.numOutputs = 2;
        end
    end

    methods (Static)
        function obj = FindGps(func)
            % FindGps Retrieve instances of YGpsProxy
            obj = YoctoProxyAPI.YGpsProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindGps to obtain an object
            % that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(1822890791);
        end
    end
    % //--- (end of YGps implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YGpsProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Gps');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Gps', ...
                'PropertyList', {'IsFixed','SatCount'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Gps settings', ...
                'PropertyList', {'CoordSystem','UtcOffset'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function varargout = stepImpl(obj)
            if nargout >= 1
                varargout{1} = obj.GetPropInt64(-2117877839);
            end
            if nargout >= 2
                varargout{2} = YoctoProxyAPI.EnumIsFixed(obj.GetPropInt32(1482917520));
            end
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'int64';
            varargout{2} = 'YoctoProxyAPI.EnumIsFixed';
        end

        function [] = getInputNamesImpl(~)
        end

        function [name1,name2] = getOutputNamesImpl(~)
            name1 = 'SatCount';
            name2 = 'IsFixed';
        end
    end

    methods
        % //--- (YGps accessors declaration)

        function result = get_isFixed(obj)
            % Returns TRUE if the receiver has found enough satellites to work.
            %
            % @return either YGps.ISFIXED_FALSE or YGps.ISFIXED_TRUE, according to TRUE if the
            % receiver has found enough satellites to work
            %
            % On failure, throws an exception or returns YGps.ISFIXED_INVALID.
            result = YoctoProxyAPI.EnumIsFixed(obj.InvokeMethod_D(-691484252));
        end

        function result = get_satCount(obj)
            % Returns the total count of satellites used to compute GPS position.
            %
            % @return an integer corresponding to the total count of satellites used to compute GPS position
            %
            % On failure, throws an exception or returns YGps.SATCOUNT_INVALID.
            result = obj.InvokeMethod_Q(-1925427315);
        end

        function result = get.SatCount(obj)
            result = obj.GetPropInt64(-2117877839);
        end

        function result = get.IsFixed(obj)
            result = YoctoProxyAPI.EnumIsFixed(obj.GetPropInt32(1482917520));
        end

        function result = get_satPerConst(obj)
            % Returns the count of visible satellites per constellation encoded
            % on a 32 bit integer: bits 0..5: GPS satellites count,  bits 6..11 : Glonass, bits 12..17 : Galileo.
            % this value is refreshed every 5 seconds only.
            %
            % @return an integer corresponding to the count of visible satellites per constellation encoded
            %         on a 32 bit integer: bits 0.
            %
            % On failure, throws an exception or returns YGps.SATPERCONST_INVALID.
            result = obj.InvokeMethod_Q(1055292319);
        end

        function result = get_gpsRefreshRate(obj)
            % Returns effective GPS data refresh frequency.
            % this value is refreshed every 5 seconds only.
            %
            % @return a floating point number corresponding to effective GPS data refresh frequency
            %
            % On failure, throws an exception or returns YGps.GPSREFRESHRATE_INVALID.
            result = obj.InvokeMethod_F(2087568270);
        end

        function result = get_coordSystem(obj)
            % Returns the representation system used for positioning data.
            %
            % @return a value among YGps.COORDSYSTEM_GPS_DMS, YGps.COORDSYSTEM_GPS_DM and
            % YGps.COORDSYSTEM_GPS_D corresponding to the representation system used for positioning data
            %
            % On failure, throws an exception or returns YGps.COORDSYSTEM_INVALID.
            result = YoctoProxyAPI.EnumCoordSystem(obj.InvokeMethod_D(-569955526));
        end

        function set_coordSystem(obj, newVal)
            % Changes the representation system used for positioning data.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : a value among YGps.COORDSYSTEM_GPS_DMS, YGps.COORDSYSTEM_GPS_DM and
            % YGps.COORDSYSTEM_GPS_D corresponding to the representation system used for positioning data
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-2127514304, newVal);
        end

        function result = get.CoordSystem(obj)
            result = YoctoProxyAPI.EnumCoordSystem(obj.GetPropInt32(1773442191));
        end

        function set.CoordSystem(obj, newVal)
            obj.CoordSystem = newVal;
            obj.SetPropInt32(1773442191, newVal);
        end

        function result = get_constellation(obj)
            % Returns the the satellites constellation used to compute
            % positioning data.
            %
            % @return a value among YGps.CONSTELLATION_GNSS, YGps.CONSTELLATION_GPS,
            % YGps.CONSTELLATION_GLONASS, YGps.CONSTELLATION_GALILEO, YGps.CONSTELLATION_GPS_GLONASS,
            % YGps.CONSTELLATION_GPS_GALILEO and YGps.CONSTELLATION_GLONASS_GALILEO corresponding to
            % the the satellites constellation used to compute
            %         positioning data
            %
            % On failure, throws an exception or returns YGps.CONSTELLATION_INVALID.
            result = YoctoProxyAPI.EnumConstellation(obj.InvokeMethod_D(-2019076300));
        end

        function set_constellation(obj, newVal)
            % Changes the satellites constellation used to compute
            % positioning data. Possible  constellations are GNSS ( = all supported constellations),
            % GPS, Glonass, Galileo , and the 3 possible pairs. This setting has  no effect on Yocto-GPS (V1).
            %
            % @param newval : a value among YGps.CONSTELLATION_GNSS, YGps.CONSTELLATION_GPS,
            % YGps.CONSTELLATION_GLONASS, YGps.CONSTELLATION_GALILEO, YGps.CONSTELLATION_GPS_GLONASS,
            % YGps.CONSTELLATION_GPS_GALILEO and YGps.CONSTELLATION_GLONASS_GALILEO corresponding to
            % the satellites constellation used to compute
            %         positioning data
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(1189298452, newVal);
        end

        function result = get_latitude(obj)
            % Returns the current latitude.
            %
            % @return a string corresponding to the current latitude
            %
            % On failure, throws an exception or returns YGps.LATITUDE_INVALID.
            result = obj.InvokeMethod_S(-988657299);
        end

        function result = get_longitude(obj)
            % Returns the current longitude.
            %
            % @return a string corresponding to the current longitude
            %
            % On failure, throws an exception or returns YGps.LONGITUDE_INVALID.
            result = obj.InvokeMethod_S(-1943285065);
        end

        function result = get_dilution(obj)
            % Returns the current horizontal dilution of precision,
            % the smaller that number is, the better .
            %
            % @return a floating point number corresponding to the current horizontal dilution of precision,
            %         the smaller that number is, the better
            %
            % On failure, throws an exception or returns YGps.DILUTION_INVALID.
            result = obj.InvokeMethod_F(1906606381);
        end

        function result = get_altitude(obj)
            % Returns the current altitude. Beware:  GPS technology
            % is very inaccurate regarding altitude.
            %
            % @return a floating point number corresponding to the current altitude
            %
            % On failure, throws an exception or returns YGps.ALTITUDE_INVALID.
            result = obj.InvokeMethod_F(-1400979103);
        end

        function result = get_groundSpeed(obj)
            % Returns the current ground speed in Km/h.
            %
            % @return a floating point number corresponding to the current ground speed in Km/h
            %
            % On failure, throws an exception or returns YGps.GROUNDSPEED_INVALID.
            result = obj.InvokeMethod_F(636851920);
        end

        function result = get_direction(obj)
            % Returns the current move bearing in degrees, zero
            % is the true (geographic) north.
            %
            % @return a floating point number corresponding to the current move bearing in degrees, zero
            %         is the true (geographic) north
            %
            % On failure, throws an exception or returns YGps.DIRECTION_INVALID.
            result = obj.InvokeMethod_F(-2066850709);
        end

        function result = get_unixTime(obj)
            % Returns the current time in Unix format (number of
            % seconds elapsed since Jan 1st, 1970).
            %
            % @return an integer corresponding to the current time in Unix format (number of
            %         seconds elapsed since Jan 1st, 1970)
            %
            % On failure, throws an exception or returns YGps.UNIXTIME_INVALID.
            result = obj.InvokeMethod_Q(-692204019);
        end

        function result = get_dateTime(obj)
            % Returns the current time in the form "YYYY/MM/DD hh:mm:ss".
            %
            % @return a string corresponding to the current time in the form "YYYY/MM/DD hh:mm:ss"
            %
            % On failure, throws an exception or returns YGps.DATETIME_INVALID.
            result = obj.InvokeMethod_S(-825142318);
        end

        function result = get_utcOffset(obj)
            % Returns the number of seconds between current time and UTC time (time zone).
            %
            % @return an integer corresponding to the number of seconds between current time and UTC
            % time (time zone)
            %
            % On failure, throws an exception or returns YGps.UTCOFFSET_INVALID.
            result = obj.InvokeMethod_D(1285538158);
        end

        function set_utcOffset(obj, newVal)
            % Changes the number of seconds between current time and UTC time (time zone).
            % The timezone is automatically rounded to the nearest multiple of 15 minutes.
            % If current UTC time is known, the current time is automatically be updated according to
            % the selected time zone.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the number of seconds between current time
            % and UTC time (time zone)
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-1175512182, newVal);
        end

        function result = get.UtcOffset(obj)
            result = obj.GetPropInt32(-1544767552);
        end

        function set.UtcOffset(obj, newVal)
            obj.UtcOffset = newVal;
            obj.SetPropInt32(-1544767552, newVal);
        end

        % //--- (end of YGps accessors declaration)
    end
end
