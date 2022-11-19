#!/usr/bin/bash

#select image
img_var=$(zenity --file-selection \
        --title="Select image" \
        --filename "/home/${USER}/"); echo $img_var
echo

#select audio
audio_var=$(zenity --file-selection \
        --title="Select audio" \
        --filename "/home/${USER}/"); echo $audio_var

echo
#select output directory
directory_var=$(zenity --file-selection \
        --title="Set output directory" \
        --filename "/home/${USER}/" \
        --directory); echo $directory_var

echo
#set filename
name_var=$(zenity --entry --title "LQRipper" \
        --text "Enter desired file name"); echo $name_var

echo
#combine filename and output directory
output_var=$(echo $directory_var/$name_var); echo $output_var

echo
#encode video and open output directory if successful
ffmpeg -loop 1 -i "$img_var" -i "$audio_var" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "$output_var.mp4" && xdg-open "$directory_var"

echo
exit
