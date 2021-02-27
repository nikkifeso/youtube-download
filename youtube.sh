#!/bin/bash 
#Author: Adenike Awofeso
#Created: 17/02/2020
#Modified: 18/02/2020

echo This scripts takes in the url of a youtube video as a command line argument and downloads the video to your machine.

#checks if python is installed and then installs it if not.
if ! [ -x "$(command -v python3)" ]
then
        echo 'Error: python# is not installed.' >&2
        sudo apt install python3
#checks if youtube-dl is already installed and installs if not.
elif ! [ -x "$(command -v youtube-dl)" ]
then
  echo 'Error: youtube-dl is not installed.' >&2
  echo Downloading....
  sudo wget https://yt-dl.org/downloads/latest/youtube-dl --no-check-certificate -O /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl
else
  echo 'Already Installed'
fi

#downloads the video in mp4 format using youtube-dl
#linux OS
if [[ "$OSTYPE" == "linux-gnu"* ]]
 then
       sudo ln -s /usr/bin/python3 /usr/local/bin/python
       youtube-dl --no-check-certificate $1
#elif [[ "$OSTYPE" == "darwin"* ]];
#mac OS
else
      youtube-dl --no-check-certificate $1
fi
