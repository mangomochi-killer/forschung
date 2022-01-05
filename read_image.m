function y = read_image(fid)

% Reads image from file, extracts luma (if necessary) end returns the image
% casted to double (instead of uint8)

if exist(fid, 'file')
    y = double(imread(fid));
    imshow(y);
    [~, ~, dims] = size(y);
    if dims == 3
        y = double(rgb2gray(y));
    else
        y = double(y);
    end
else
    error('File not found.')
end

end
