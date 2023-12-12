% YRfidReaderProxy: RfidReader function interface
% 
% The <tt>RfidReader</tt> class provides access detect, read and write RFID tags.

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


% //--- (YRfidReader declaration)
classdef YRfidReaderProxy < YoctoProxyAPI.YFunctionProxy
    % YRfidReaderProxy: RfidReader function interface
    % 
    % The <tt>RfidReader</tt> class provides access detect, read and write RFID tags.

    properties (Transient, Nontunable)
        % RefreshRate Tag list refresh rate, measured in Hz
        RefreshRate (1,1) int32
    end

    properties (Transient, Nontunable, SetAccess = private)
        % NTags Number of RFID tags currently detected
        NTags (1,1) int32
    end

    properties (Constant)
    end
    % //--- (end of YRfidReader declaration)

    % //--- (YRfidReader implementation)
    methods (Hidden)
        function obj = YRfidReaderProxy()
            % YRfidReaderProxy For internal use as System Object.
            % Use FindRfidReader() instead.
            obj = obj@YoctoProxyAPI.YFunctionProxy();
            obj.classHandle = -1155647262;
        end
    end

    methods (Static)
        function obj = FindRfidReader(func)
            % FindRfidReader Retrieve instances of YRfidReaderProxy
            obj = YoctoProxyAPI.YRfidReaderProxy;
            obj.TargetFunction = func;
        end
    end

    methods (Static)
        function list = GetSimilarFunctions()
            % GetSimilarFunctions Enumerates all functions available on on the devices currently
            % reachable by the library and returns their unique hardware ID.
            %
            % Each of these IDs can be provided as argument to the method FindRfidReader to obtain an
            % object that can control the corresponding device.
            list = YoctoProxyAPI.YFunctionProxy.YpaGetSimilarFunctions(-1155647262);
        end
    end
    % //--- (end of YRfidReader implementation)

    % System Object display methods
    methods (Static, Access = protected)
        function header = getHeaderImpl()
            header =  matlab.system.display.Header(...
                'YoctoProxyAPI.YRfidReaderProxy', ...
                'ShowSourceLink', false, ...
                'Title', 'RfidReader');
        end

        function groups = getPropertyGroupsImpl()
            others = getPropertyGroupsImpl@YoctoProxyAPI.YFunctionProxy();
            section = matlab.system.display.Section(...
                'Title', 'RfidReader', ...
                'PropertyList', {'RefreshRate','NTags'});
            thisGroup = matlab.system.display.SectionGroup(...
                'Title', 'RfidReader settings', ...
                'PropertyList', {});
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
        % //--- (YRfidReader accessors declaration)

        function result = get_nTags(obj)
            % Returns the number of RFID tags currently detected.
            %
            % @return an integer corresponding to the number of RFID tags currently detected
            %
            % On failure, throws an exception or returns YRfidReader.NTAGS_INVALID.
            result = obj.InvokeMethod_D(1358917845);
        end

        function result = get.NTags(obj)
            result = obj.GetPropInt32(-819202767);
        end

        function result = get_refreshRate(obj)
            % Returns the tag list refresh rate, measured in Hz.
            %
            % @return an integer corresponding to the tag list refresh rate, measured in Hz
            %
            % On failure, throws an exception or returns YRfidReader.REFRESHRATE_INVALID.
            result = obj.InvokeMethod_D(-1961964339);
        end

        function set_refreshRate(obj, newVal)
            % Changes the present tag list refresh rate, measured in Hz. The reader will do
            % its best to respect it. Note that the reader cannot detect tag arrival or removal
            % while it is  communicating with a tag.  Maximum frequency is limited to 100Hz,
            % but in real life it will be difficult to do better than 50Hz.
            % Remember to call the saveToFlash() method of the module if the
            % modification must be kept.
            %
            % @param newval : an integer corresponding to the present tag list refresh rate, measured in Hz
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code.
            obj.InvokeMethod_d(-734440777, newVal);
        end

        function result = get.RefreshRate(obj)
            result = obj.GetPropInt32(511122244);
        end

        function set.RefreshRate(obj, newVal)
            obj.RefreshRate = newVal;
            obj.SetPropInt32(511122244, newVal);
        end

        function result = get_tagIdList(obj)
            % Returns the list of RFID tags currently detected by the reader.
            %
            % @return a list of strings, corresponding to each tag identifier.
            %
            % On failure, throws an exception or returns an empty list.
            result = obj.InvokeMethod_xS(-1557816636);
        end

        function result = get_tagInfo(obj, tagId, status)
            % Retourne la description des propriétés d'un tag RFID présent.
            % Cette fonction peut causer des communications avec le tag.
            %
            % @param tagId : identifier of the tag to check
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a YRfidTagInfo object.
            %
            % On failure, throws an exception or returns an empty YRfidTagInfo objact.
            % When it happens, you can get more information from the status object.
            result = obj.InvokeMethod_NsP(-731119811, tagId, status);
        end

        function result = tagLockBlocks(obj, tagId, firstBlock, nBlocks, options, status)
            % Change an RFID tag configuration to prevents any further write to
            % the selected blocks. This operation is definitive and irreversible.
            % Depending on the tag type and block index, adjascent blocks may become
            % read-only as well, based on the locking granularity.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : first block to lock
            % @param nBlocks : number of blocks to lock
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_DsddOP(914920633, tagId, firstBlock, nBlocks, options, status);
        end

        function result = get_tagLockState(obj, tagId, firstBlock, nBlocks, options, status)
            % Reads the locked state for RFID tag memory data blocks.
            % FirstBlock cannot be a special block, and any special
            % block encountered in the middle of the read operation will be
            % skipped automatically.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : number of the first block to check
            % @param nBlocks : number of blocks to check
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a list of booleans with the lock state of selected blocks
            %
            % On failure, throws an exception or returns an empty list. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_xBsddOP(-440398469, tagId, firstBlock, nBlocks, options, status);
        end

        function result = get_tagSpecialBlocks(obj, tagId, firstBlock, nBlocks, options, status)
            % Tells which block of a RFID tag memory are special and cannot be used
            % to store user data. Mistakely writing a special block can lead to
            % an irreversible alteration of the tag.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : number of the first block to check
            % @param nBlocks : number of blocks to check
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a list of booleans with the lock state of selected blocks
            %
            % On failure, throws an exception or returns an empty list. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_xBsddOP(-1347286370, tagId, firstBlock, nBlocks, options, status);
        end

        function result = tagReadHex(obj, tagId, firstBlock, nBytes, options, status)
            % Reads data from an RFID tag memory, as an hexadecimal string.
            % The read operation may span accross multiple blocks if the requested
            % number of bytes is larger than the RFID tag block size. By default
            % firstBlock cannot be a special block, and any special block encountered
            % in the middle of the read operation will be skipped automatically.
            % If you rather want to read special blocks, use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where read should start
            % @param nBytes : total number of bytes to read
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return an hexadecimal string if the call succeeds.
            %
            % On failure, throws an exception or returns an empty binary buffer. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_SsddOP(-187720614, tagId, firstBlock, nBytes, options, status);
        end

        function result = tagReadBin(obj, tagId, firstBlock, nBytes, options, status)
            % Reads data from an RFID tag memory, as a binary buffer. The read operation
            % may span accross multiple blocks if the requested number of bytes
            % is larger than the RFID tag block size.  By default
            % firstBlock cannot be a special block, and any special block encountered
            % in the middle of the read operation will be skipped automatically.
            % If you rather want to read special blocks, use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where read should start
            % @param nBytes : total number of bytes to read
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a binary object with the data read if the call succeeds.
            %
            % On failure, throws an exception or returns an empty binary buffer. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_SsddOP(-1089616085, tagId, firstBlock, nBytes, options, status);
        end

        function result = tagReadArray(obj, tagId, firstBlock, nBytes, options, status)
            % Reads data from an RFID tag memory, as a byte list. The read operation
            % may span accross multiple blocks if the requested number of bytes
            % is larger than the RFID tag block size.  By default
            % firstBlock cannot be a special block, and any special block encountered
            % in the middle of the read operation will be skipped automatically.
            % If you rather want to read special blocks, use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where read should start
            % @param nBytes : total number of bytes to read
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a byte list with the data read if the call succeeds.
            %
            % On failure, throws an exception or returns an empty list. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_xDsddOP(1977441080, tagId, firstBlock, nBytes, options, status);
        end

        function result = tagReadStr(obj, tagId, firstBlock, nChars, options, status)
            % Reads data from an RFID tag memory, as a text string. The read operation
            % may span accross multiple blocks if the requested number of bytes
            % is larger than the RFID tag block size.  By default
            % firstBlock cannot be a special block, and any special block encountered
            % in the middle of the read operation will be skipped automatically.
            % If you rather want to read special blocks, use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where read should start
            % @param nChars : total number of characters to read
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return a text string with the data read if the call succeeds.
            %
            % On failure, throws an exception or returns an empty string. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_SsddOP(33205439, tagId, firstBlock, nChars, options, status);
        end

        function result = tagWriteBin(obj, tagId, firstBlock, buff, options, status)
            % Writes data provided as a binary buffer to an RFID tag memory.
            % The write operation may span accross multiple blocks if the
            % number of bytes to write is larger than the RFID tag block size.
            % By default firstBlock cannot be a special block, and any special block
            % encountered in the middle of the write operation will be skipped
            % automatically. If you rather want to rewrite special blocks as well,
            % use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where write should start
            % @param buff : the binary buffer to write
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_DsdsOP(-1432288120, tagId, firstBlock, buff, options, status);
        end

        function result = tagWriteArray(obj, tagId, firstBlock, byteList, options, status)
            % Writes data provided as a list of bytes to an RFID tag memory.
            % The write operation may span accross multiple blocks if the
            % number of bytes to write is larger than the RFID tag block size.
            % By default firstBlock cannot be a special block, and any special block
            % encountered in the middle of the write operation will be skipped
            % automatically. If you rather want to rewrite special blocks as well,
            % use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where write should start
            % @param byteList : a list of byte to write
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_DsdxdOP(-107637433, tagId, firstBlock, byteList, options, status);
        end

        function result = tagWriteHex(obj, tagId, firstBlock, hexString, options, status)
            % Writes data provided as an hexadecimal string to an RFID tag memory.
            % The write operation may span accross multiple blocks if the
            % number of bytes to write is larger than the RFID tag block size.
            % By default firstBlock cannot be a special block, and any special block
            % encountered in the middle of the write operation will be skipped
            % automatically. If you rather want to rewrite special blocks as well,
            % use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where write should start
            % @param hexString : a string of hexadecimal byte codes to write
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_DsdsOP(-513581063, tagId, firstBlock, hexString, options, status);
        end

        function result = tagWriteStr(obj, tagId, firstBlock, text, options, status)
            % Writes data provided as an ASCII string to an RFID tag memory.
            % The write operation may span accross multiple blocks if the
            % number of bytes to write is larger than the RFID tag block size.
            % By default firstBlock cannot be a special block, and any special block
            % encountered in the middle of the write operation will be skipped
            % automatically. If you rather want to rewrite special blocks as well,
            % use EnableRawAccess option.
            %
            % @param tagId : identifier of the tag to use
            % @param firstBlock : block number where write should start
            % @param text : the text string to write
            % @param options : an YRfidOptions object with the optional
            %         command execution parameters, such as security key
            %         if required
            % @param status : an RfidStatus object that will contain
            %         the detailled status of the operation
            %
            % @return 0 if the call succeeds.
            %
            % On failure, throws an exception or returns a negative error code. When it
            % happens, you can get more information from the status object.
            result = obj.InvokeMethod_DsdsOP(341208860, tagId, firstBlock, text, options, status);
        end

        function result = get_lastEvents(obj)
            % Returns a string with last tag arrival/removal events observed.
            % This method return only events that are still buffered in the device memory.
            %
            % @return a string with last events observed (one per line).
            %
            % On failure, throws an exception or returns  YAPI_INVALID_STRING.
            result = obj.InvokeMethod_S(1709506988);
        end

        % //--- (end of YRfidReader accessors declaration)
    end
end
