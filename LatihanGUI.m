function varargout = LatihanGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LatihanGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LatihanGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LatihanGUI is made visible.
function LatihanGUI_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = LatihanGUI_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;


% --- Executes on button press in imageButton.
function imageButton_Callback(hObject, eventdata, handles)
    global image
    image = imread('image.png');
    axes(handles.imageColor)
    imshow(image)

% --- Executes on button press in grayButton.
function grayButton_Callback(hObject, eventdata, handles)
    global image
    
    %GAMABR KEABUAN
    image_gray = (image(:,:,1) + image(:,:,2) + image(:,:,3)) / 3;
    axes(handles.imageResult); imshow(image_gray)

% --- Executes on button press in closeButton.
function closeButton_Callback(hObject, eventdata, handles)
    close(handles.MasterFigure)

%--- ----%
function image_gray_const = getGrayConst()
    global image
    
    %GAMBAR KEABUAN MENGGUNAKAN KONSTANTA
    image_gray_const = image(:,:,1) * 0.4  + image(:,:,2) * 0.32 + image(:,:,3) * 0.28;
        

% --- Executes on button press in grayConstButton.
function grayConstButton_Callback(hObject, eventdata, handles)
    axes(handles.imageResult); imshow(getGrayConst())


% --- Executes on button press in grayBinerButton.
function grayBinerButton_Callback(hObject, eventdata, handles)
    image_gray_const = getGrayConst();
    
    %GAMBAR KEABUAN MENGGUNAKAN BINNER
    value = 100;
    [kolom, baris] = size(image_gray_const);
    image_gray_biner = zeros(kolom, baris);

    for x = 1 : kolom 
        for y = 1 : baris
            if(image_gray_const(x,y) > value)
                image_gray_biner(x,y) = 1;
            else
                image_gray_biner(x,y) = 0;
            end
        end
    end

    axes(handles.imageResult); imshow(image_gray_biner)

% --- Executes on button press in brightnessButton.
function brightnessButton_Callback(hObject, eventdata, handles)
    image_gray_const = getGrayConst();
    
     %GAMBAR BRIGHTNESS
    image_brightness = image_gray_const + 50;
    axes(handles.imageResult); imshow(image_brightness)


% --- Executes on button press in contrastButton.
function contrastButton_Callback(hObject, eventdata, handles)
    image_gray_const = getGrayConst();
  
    %GAMBAR CONTRAST
    image_contrast = image_gray_const * 1.3;
    axes(handles.imageResult); imshow(image_contrast)
