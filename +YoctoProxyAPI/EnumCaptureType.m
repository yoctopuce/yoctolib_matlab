% Definition of CaptureType enumeration

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


classdef EnumCaptureType < int32
    enumeration
        CaptureType_INVALID (0)
        CaptureType_NONE (1)
        CaptureType_TIMED (2)
        CaptureType_V_MAX (3)
        CaptureType_V_MIN (4)
        CaptureType_I_MAX (5)
        CaptureType_I_MIN (6)
        CaptureType_P_MAX (7)
        CaptureType_P_MIN (8)
        CaptureType_V_AVG_MAX (9)
        CaptureType_V_AVG_MIN (10)
        CaptureType_V_RMS_MAX (11)
        CaptureType_V_RMS_MIN (12)
        CaptureType_I_AVG_MAX (13)
        CaptureType_I_AVG_MIN (14)
        CaptureType_I_RMS_MAX (15)
        CaptureType_I_RMS_MIN (16)
        CaptureType_P_AVG_MAX (17)
        CaptureType_P_AVG_MIN (18)
        CaptureType_PF_MIN (19)
        CaptureType_DPF_MIN (20)
    end
end
