%Code by RR Iyer, Supriya N, Priyadarshini S NITK Surathkal

function simple_gui
clear all;
close all;
% SIMPLE_GUI Select whether a car is seen in the picture. If yes, store
% it's image number and co-ordinates

%  Create and then hide the UI as it is being constructed.
f = figure('Visible','on','Position',[360,300,585,300]);

% Construct the components.
hyes    = uicontrol('Style','pushbutton',...
             'String','Yes','Position',[415,220,70,25],...
             'Callback',@yesbutton_Callback);
hno    = uicontrol('Style','pushbutton',...
             'String','No','Position',[415,180,70,25],...
             'Callback',@nobutton_Callback);
htext  = uicontrol('Style','text','String','Press Yes if you see a car, else press No',...
           'Position',[415,90,70,70]);

ha = axes('Units','pixels','Position',[50,60,300,255]);
align([hyes,hno,htext,],'Center','None');

% Initialize the UI.
% Change units to normalized so components resize automatically.
% f.Units = 'normalized';
% ha.Units = 'normalized';
% hyes.Units = 'normalized';
% hno.Units = 'normalized';
% htext.Units = 'normalized';

% Generate the data to plot.
  j=1;
  img_GUI=0;
  bb = 0;
  imno=0;
  
  file_path = 'Z:\Rishee\College\Computer Vision\CarData\Testdata\';
  image_path = strcat('spr_',num2str(j),'.pgm');
  bb_path = strcat('bbvalue_',num2str(j),'.txt');
  imno_path = strcat('image_',num2str(j),'.txt');
  img_GUI=imread(strcat(file_path,image_path));
  imshow(img_GUI);

  fileID = fopen(strcat(file_path,bb_path),'r');
  
  bb = fgets(fileID,4);
  fclose(fileID);
  
  fileID = fopen(strcat(file_path,imno_path),'r');
  imno = fgets(fileID,1);
  fclose(fileID);
 
  
  

% Assign the a name to appear in the window title.
f.Name = 'Simple GUI';

% Move the window to the center of the screen.
%movegui(f,'center')

% Make the window visible.
f.Visible = 'on';

  % Push button callbacks. Each callback plots current_data in the
  % specified plot type.

      function update_Image()
  image_path = strcat('spr_',num2str(j),'.pgm');
  bb_path = strcat('bbvalue_',num2str(j),'.txt');
  imno_path = strcat('image_',num2str(j),'.txt');
  img_GUI=imread(strcat(file_path,image_path));
  imshow(img_GUI);

  fileID = fopen(strcat(file_path,bb_path),'r');
  
  bb = fgets(fileID)
  fclose(fileID);
  
  fileID = fopen(strcat(file_path,imno_path),'r');
  imno = fgets(fileID)
  fclose(fileID);
      end

  
  function yesbutton_Callback(source,eventdata) 
  % Display surf plot of the currently selected data.
       fileID = fopen(strcat('Z:\Rishee\College\Computer Vision\CarData\Results\pos_',num2str(j),'.txt'),'w');
       fwrite(fileID,imno);
       fwrite(fileID,',');
       fwrite(fileID,bb);
       j=j+1;
       update_Image();
  end

  function nobutton_Callback(source,eventdata) 
  % Display mesh plot of the currently selected data.
       j=j+1;
       update_Image();
  end

  end
