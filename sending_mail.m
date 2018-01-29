%webcamlist
warning off;
cam = webcam('Integrated Camera');
%cam.AvailableResolutions
%cam.Resolution = '320x240';
%preview(cam)
%closePreview(cam)

%{
for idx = 1:100
   % Acquire a single image.
   rgbImage = snapshot(cam);

   % Convert RGB to grayscale.
   grayImage = rgb2gray(rgbImage);

   % Find circles.
   [centers, radii] = imfindcircles(grayImage, [60 80]);

   % Display the image.
   imshow(rgbImage);
   hold on;
   viscircles(centers, radii);
   drawnow
end
%}



img = snapshot(cam);
%image(img)
%imshow(img)

clear('cam')

timedate = regexp(datestr(now, 'dd-mm-yyyy HH:MM:SS'),'[-: ]', 'split');
disp(datestr(now, 'dd-mm-yyyy HH:MM'))
count = numel(timedate);
disp(count)
filename = '';
for idx = 1:count
    filename = strcat(filename, timedate(idx));
end
dates = strcat(filename, '.jpg');



counter = 1;
basedir = 'C:/Users/admin/Documents/MATLAB/Screenshots/';
basename = 'image_';
dates = strcat(basename, dates);
filename = char(strcat(basedir, dates));
%newName = strcat(basedir, basename, filename, '.jpg');
%disp(newName)
%write_dir = string(strcat(basedir, '/', basename,filename,'.jpg'));

%disp(filename)
imwrite(img, filename)





mails = 'emailId@gmail.com';
passwords = 'xxxxxxxxxxxx';
setpref('Internet', 'SMTP_Server', 'smtp.gmail.com');
setpref('Internet', 'E_mail', mails)
setpref('Internet', 'SMTP_Username', mails)
setpref('Internet', 'SMTP_Password', passwords)
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
sendmail(mails,'Test mail', 'Hello KrishNa, Welcome to Google', strcat('path of screenshots',dates))
exit;