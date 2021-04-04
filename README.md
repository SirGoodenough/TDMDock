#  TDMDock - Puts tdmgr into a Docker Container
This is based on a docker compose I found from :
https://zorruno.com/w/TDMDocker

That was based on a docker compose from here that now appears abandoned:
https://hub.docker.com/r/marcelkordek/tasmota-device-manager

I have added a few things to make it work better for general users.

This basically puts TDMGR from (https://github.com/jziolkowski/tdm) into a local Docker container.  For more information on [TDMGR](https://github.com/jziolkowski/tdm) and [Tasmota](https://github.com/arendst/Tasmota), see those sites.  This **DOES NOT** modify [TDMGR](https://github.com/jziolkowski/tdm) or [Tasmota](https://github.com/arendst/Tasmota) in any way, it merely puts TDMGR into a Docker Container to help maintain your Tasmota Devices.  See Troubleshooting Section Below for more information regarding usage.

## Installation:

* First install DockerCE and Docker Compose as stated on the Docker Website.  That installation is not covered here.  
* Once that is installed, create a folder /opt/TDMDock and change the user and group on this folder /opt/TDMDock to be the [non-root user] that will be running the container on this computer.
```
cd /opt
sudo mkdir TDMDock
sudo chown [non-root user] TDMDock
sudo chgrp [non-root user] TDMDock
```
* Create a docker group if there isn’t one:  
```
sudo groupadd docker
```
* Add your user to the docker group:  
```
sudo usermod -aG docker [non-root user]
```
* Log out and log back in so that your group membership is re-evaluated.
* Install all the files from the repository as your [non-root user] entity.  If you have git installed, you can use git clone:  
```
cd /opt; git clone https://github.com/SirGoodenough/TDMDock.git
```
* Find the file 'dockerfile' and with an appropriate editor that preserves format of the file,  find the time zone environmental variable and put your local timezone in there.  The default is US Central time where I am located.
```
# Environment Variables
# see https://github.com/jlesage/docker-baseimage-gui/#environment-variables
ENV TZ="America/Chicago"
```
* Inside /opt/TDMDock build the containers:  
```
cd /opt/TDMDock; docker-compose build
```
* If you are using Ubuntu, copy the 2 xxx.desktop files to your [non-root user] entity's home folder.  This *MAY* also work with other Oinux Distros, but has not been tested.  Anyway you do it you will need to start the container during use and stop the container when not in use.

## Container Start-up:

Ubuntu users should be able to start and stop the container now with these desktop icons.  It you wish to start and stop the containers another way that is up to you, but be aware that the TDMDock container **SHOULD NOT be left running all the time**.  It does put extra IO's on the little ESP chips in the Tasmota Devices and on some, it will cause ghost switching and device reboots.  It is best to load the container, do your business, then when you are done stop the container.  The Terminal window that pops up while the container is running is for troubleshooting and to remind you that the container is running, so that you remember to turn it off when done using the container.

## TDMGR Usage:

To use TDMGR, start the container, then connect to (http://127.0.0.1:5810) thru your web browser.  You will need to connect to your broker and make sure your topics and stuff is set up correctly as per the [TDMGR Github](https://github.com/jziolkowski/tdm).  Once the topics are set, browser credentials are set, and you connect to the broker, your Tasmota devices should start showing up.

## Troubleshooting and Warnings:

If you have problems getting this to work correctly, you can contact me at my Discord and I will do my best to help you.  Be warned that TDMGR is intended to be run native and all testing is done on Ubuntu as per the [TDMGR Github](https://github.com/jziolkowski/tdm), so if you can't get it to run in this container, try it native on Ubuntu.  This set-up is for advanced users that can puzzle things out for themselves.  

## Thanks and Support

If you have any questions, comments or additions be sure to add an issue and bring them up on my Discord Server.  If you feel there is an issue with the repo, please feel free to fork it and offer suggestions and / or put an issue in and contact me on Discord.

### Contact Links:

* [Discord WhatAreWeFixingToday](https://discord.gg/Uhmhu3B)
* [What are we Fixing Today Homepage](https://www.WhatAreWeFixing.Today/)
* [YouYube Channel Link](https://bit.ly/WhatAreWeFixingTodaysYT)
* [What are we Fixing Today Facebook page](https://bit.ly/WhatAreWeFixingTodayFB)
* [What are we Fixing Today Twitter](https://bit.ly/WhatAreWeFixingTodayTW)

### Please help support the channel:

* [Patreon Membership](https://www.patreon.com/WhatAreWeFixingToday)

* [Buy me Coffee](https://www.buymeacoffee.com/SirGoodenough)
* [PayPal one-off donation link](https://www.paypal.me/SirGoodenough)
* [Cash App \$CASHTAG](https://cash.me/$SirGoodenough)
* [Venmo cash link](https://venmo.com/SirGoodenough)
