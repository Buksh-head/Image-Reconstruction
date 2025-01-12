function fh = row_pixel_intensity(imdata,r,varargin)

% fh = row_pixel_intensity(imdata,r,varargin)
%
% Function to plot the pixel intensity of an image along a specified row.
%
% inputs:
%   imdata = image as an M-by-N matrix
%   r = row index
%   fh = figure handle (OPTIONAL)
% outputs:
%   fh = figure handle

if isempty(varargin)
    fh = figure ;
else
    fh = varargin{1} ;
end

figure(fh) ;
hold on ;
plot(1:size(imdata,2),imdata(r,:)) ;

end
