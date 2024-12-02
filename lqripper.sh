#!/usr/bin/bash

#select image
img_var=$(zenity --file-selection \
        --title="Select image" \
        --file-filter="*.jpg *.jpeg *.png *.bmp *.tiff" \
        --filename "/home/${USER}/"); echo $img_var
echo

#select audio
audio_var=$(zenity --file-selection \
        --title="Select audio" \
        --file-filter="*.mp3 *.wav *.ogg *.flac *.m4a *.aiff" \
        --filename "/home/${USER}/"); echo $audio_var

echo
#select output directory
directory_var=$(zenity --file-selection \
        --title="Set output directory" \
        --filename "/home/${USER}/" \
        --directory); echo $directory_var

echo
#set filename
name_var=$(zenity --entry --title "LQ Ripper" \
        --text "Enter desired file name"); echo $name_var

echo
#combine filename and output directory
output_var=$(echo $directory_var/$name_var); echo $output_var

echo
#encode video and open output directory if successful
ffmpeg -r 1 -f image2 -loop 1 -i "$img_var" -i "$audio_var" -c:v mpeg4 -q:v 2 -c:a copy -shortest "$output_var.avi" && zenity --question \
		 --title="LQ Ripper" \
		 --ok-label="Yes" \
		 --cancel-label="No" \
		 --text="Thank you for using LQ Ripper, your rip has been processed. Look forward to uploading it to your channel!\n\nPlease feel free to process more of your work in the future!\n\nWould you like to open the output directory?"
ans=$?
if [ $ans -eq 0 ]; then
	xdg-open "$directory_var"
else
	exit
fi
echo
exit
