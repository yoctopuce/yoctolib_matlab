% Definition of CaptureTypeAtStartup enumeration

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


classdef EnumCaptureTypeAtStartup < int32
    enumeration
        CaptureTypeAtStartup_INVALID (0)
        CaptureTypeAtStartup_NONE (1)
        CaptureTypeAtStartup_TIMED (2)
        CaptureTypeAtStartup_V_MAX (3)
        CaptureTypeAtStartup_V_MIN (4)
        CaptureTypeAtStartup_I_MAX (5)
        CaptureTypeAtStartup_I_MIN (6)
        CaptureTypeAtStartup_P_MAX (7)
        CaptureTypeAtStartup_P_MIN (8)
        CaptureTypeAtStartup_V_AVG_MAX (9)
        CaptureTypeAtStartup_V_AVG_MIN (10)
        CaptureTypeAtStartup_V_RMS_MAX (11)
        CaptureTypeAtStartup_V_RMS_MIN (12)
        CaptureTypeAtStartup_I_AVG_MAX (13)
        CaptureTypeAtStartup_I_AVG_MIN (14)
        CaptureTypeAtStartup_I_RMS_MAX (15)
        CaptureTypeAtStartup_I_RMS_MIN (16)
        CaptureTypeAtStartup_P_AVG_MAX (17)
        CaptureTypeAtStartup_P_AVG_MIN (18)
        CaptureTypeAtStartup_PF_MIN (19)
        CaptureTypeAtStartup_DPF_MIN (20)
    end
end
