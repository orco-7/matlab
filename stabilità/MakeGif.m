function MakeGif(figHandle, filename)
	persistent persistentFilename = [];
	if isempty(filename)
		error("can't have empty filename");
	end

	if ~ishandle(figHandle)
		error('no valid figHandle was passed');
	end

	writeMode = 'Append';

	if isempty(persistentFilename) | (filename!=persistentFilename)
		persistentFilename = filename;
		writeMode = 'Overwrite';
	end

	imstruct = getframe(figHandle);
	imwrite(imstruct.cdata, filename, 'gif', 'WriteMode',writeMode, 'DelayTime', 0);
end

