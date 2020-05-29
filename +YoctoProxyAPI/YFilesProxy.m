% YFilesProxy: filesystem control interface, available for instance in the Yocto-Buzzer, the
% Yocto-Color-V2, the YoctoHub-Ethernet or the YoctoHub-Wireless-g
% 
% The YFiles class is used to access the filesystem embedded on some Yoctopuce devices. This
% filesystem makes it possible for instance to design a custom web UI (for networked devices) or to
% add fonts (on display devices).

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


% //--- (YFiles declaration)
classdef YFilesProxy < YoctoProxyAPI.YFunctionProxy
    % YFilesProxy: filesystem control interface, available for instance in the Yocto-Buzzer, the
    % Yocto-Color-V2, the YoctoHub-Ethernet or the YoctoHub-Wireless-g
    % 
    % The YFiles class is used to access the filesystem embedded on some Yoctopuce devices. This
    % filesystem makes it possible for instance to design a custom web UI (for networked devices) or to
    % add fonts (on display devices).

    properties (Transient, Nontunable)
    end

    properties (Transient, Nontunable, SetAccess = private)
        % FilesCount Number of files currently loaded in the filesystem
        FilesCount (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YFiles declaration)

    % //--- (YFiles implementation)
    methods (Hidden)
        function obj = YFilesProxy()
            % YFilesProxy For internal use as System Object.
            % Use FindFiles() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -940282019;
        end
    end

    methods (Static)
        function obj = FindFiles(func)
            % FindFiles Retrieve instances of YFilesProxy
            obj = YoctoProxyAPI.YFilesProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindFiles to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-940282019);
        end
    end
    % //--- (end of YFiles implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YFilesProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'Files');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'Files', ...
                'PropertyList', {});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'Files settings', ...
                'PropertyList', {'FilesCount'});
            others(1).Sections = [others(1).Sections section];
            groups = [others thisGroup];
        end
    end

    % System Object support methods
    methods (Access = protected)
        function stepImpl(~)
        end

        function varargout = getOutputDataTypeImpl(~)
            varargout = {};
        end

        function [] = getInputNamesImpl(~)
        end

        function [] = getOutputNamesImpl(~)
        end
    end

    methods
        % //--- (YFiles accessors declaration)

        function result = get_filesCount(obj)
            % Returns the number of files currently loaded in the filesystem.
            %
            % @return an integer corresponding to the number of files currently loaded in the filesystem
            %
            % On failure, throws an exception or returns Y_FILESCOUNT_INVALID.
            result = obj.InvokeMethod_D(-295307876);
        end

        function result = get.FilesCount(obj)
            result = obj.GetPropInt32(-777511476);
        end

        function result = get_freeSpace(obj)
            % Returns the free space for uploading new files to the filesystem, in bytes.
            %
            % @return an integer corresponding to the free space for uploading new files to the
            % filesystem, in bytes
            %
            % On failure, throws an exception or returns Y_FREESPACE_INVALID.
            result = obj.InvokeMethod_D(1614949885);
        end

        function result = format_fs(obj)
            % Reinitialize the filesystem to its clean, unfragmented, empty state.
            % All files previously uploaded are permanently lost.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_D(1709704715);
        end

        function result = get_list(obj, pattern)
            % Returns a list of YFileRecord objects that describe files currently loaded
            % in the filesystem.
            %
            % @param pattern : an optional filter pattern, using star and question marks
            %         as wild cards. When an empty pattern is provided, all file records
            %         are returned.
            %
            % @return a list of YFileRecord objects, containing the file path
            %         and name, byte size and 32-bit CRC of the file content.
            %
            % On failure, throws an exception or returns an empty list.
            result = obj.InvokeMethod_xUs(-1961363202, pattern);
        end

        function result = fileExist(obj, filename)
            % Test if a file exist on the filesystem of the module.
            %
            % @param filename : the file name to test.
            %
            % @return a true if the file exist, false otherwise.
            %
            % On failure, throws an exception.
            result = obj.InvokeMethod_Bs(-310296032, filename);
        end

        function result = download(obj, pathname)
            % Downloads the requested file and returns a binary buffer with its content.
            %
            % @param pathname : path and name of the file to download
            %
            % @return a binary buffer with the file content
            %
            % On failure, throws an exception or returns an empty content.
            result = obj.InvokeMethod_Ss(1612576021, pathname);
        end

        function result = upload(obj, pathname, content)
            % Uploads a file to the filesystem, to the specified full path name.
            % If a file already exists with the same path name, its content is overwritten.
            %
            % @param pathname : path and name of the new file to create
            % @param content : binary buffer with the content to set
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Dss(2131382702, pathname, content);
        end

        function result = remove(obj, pathname)
            % Deletes a file, given by its full path name, from the filesystem.
            % Because of filesystem fragmentation, deleting a file may not always
            % free up the whole space used by the file. However, rewriting a file
            % with the same path name will always reuse any space not freed previously.
            % If you need to ensure that no space is taken by previously deleted files,
            % you can use format_fs to fully reinitialize the filesystem.
            %
            % @param pathname : path and name of the file to remove.
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            result = obj.InvokeMethod_Ds(-217640740, pathname);
        end

        % //--- (end of YFiles accessors declaration)
    end
end
