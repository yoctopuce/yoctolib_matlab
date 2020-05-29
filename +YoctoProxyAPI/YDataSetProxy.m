% YDataSetProxy: Recorded data sequence, as returned by <tt>sensor.get_recordedData()</tt>
% 
% YDataSetProxy objects make it possible to retrieve a set of recorded measures for a given sensor
% and a specified time interval. They can be used to load data points with a progress report. When
% the YDataSetProxy object is instantiated by the <tt>sensor.get_recordedData()</tt>  function, no
% data is yet loaded from the module. It is only when the <tt>loadMore()</tt> method is called over
% and over than data will be effectively loaded from the dataLogger.
% 
% A preview of available measures is available using the function <tt>get_preview()</tt> as soon as
% <tt>loadMore()</tt> has been called once. Measures themselves are available using function
% <tt>get_measures()</tt> when loaded by subsequent calls to <tt>loadMore()</tt>.
% 
% This class can only be used on devices that use a relatively recent firmware, as YDataSetProxy
% objects are not supported by firmwares older than version 13000.

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


% //--- (YDataSet declaration)
classdef YDataSetProxy < matlab.System
    % YDataSetProxy: Recorded data sequence, as returned by <tt>sensor.get_recordedData()</tt>
    % 
    % YDataSetProxy objects make it possible to retrieve a set of recorded measures for a given sensor
    % and a specified time interval. They can be used to load data points with a progress report. When
    % the YDataSetProxy object is instantiated by the <tt>sensor.get_recordedData()</tt>  function, no
    % data is yet loaded from the module. It is only when the <tt>loadMore()</tt> method is called over
    % and over than data will be effectively loaded from the dataLogger.
    % 
    % A preview of available measures is available using the function <tt>get_preview()</tt> as soon as
    % <tt>loadMore()</tt> has been called once. Measures themselves are available using function
    % <tt>get_measures()</tt> when loaded by subsequent calls to <tt>loadMore()</tt>.
    % 
    % This class can only be used on devices that use a relatively recent firmware, as YDataSetProxy
    % objects are not supported by firmwares older than version 13000.

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
    end

    properties (Constant)
    end
    % //--- (end of YDataSet declaration)

    methods
        % //--- (YDataSet accessors declaration)

        % //--- (end of YDataSet accessors declaration)
    end
end
