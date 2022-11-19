# LQRipper
<sub>(short for **L**inux **Q**uality Ripper)</sub>

Basic bash script for automatically combining a still image and audio file into an mp4 file.

Tested only on EndeavourOS but in theory it should work on basically any linux distro.

# Prerequisites
This script requires [Zenity](https://gitlab.gnome.org/GNOME/zenity) and [ffmpeg](https://ffmpeg.org/download.html#get-sources) in order to work. If you somehow don't have either, look up how to install them yourself, it's honestly not that hard.

# How to use
**1.** Run the script by opening a terminal and entering the following
```bash
bash <(curl -Ls https://github.com/albert-softie/LQRipper/raw/main/lqripper.sh)
```
- You can simplify this by adding the line `alias lqripper="bash <(curl -Ls https://github.com/albert-softie/LQRipper/raw/main/lqripper.sh)"` to `/home/[[YOUR USERNAME]]/.bashrc` to run the script by entering `lqripper` into your terminal.
- You can also download and run the script locally, but this is not recommended in case the script gets updated.

**2.** Select the image and audio file you want to use.

**3.** Select the desired output directory.

**4.** Enter the desired file name.

If all goes well, the video should be encoded properly and the previously selected output directory will automatically open.

# To-do list
- graphical error messages
- make opening the output directory optional
- windows version maybe
- probably a bunch of other things
