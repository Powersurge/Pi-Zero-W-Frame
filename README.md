# Pi-Zero-W-Frame

Connect your digital frame to a WebDAV server such as Nextcloud using a Raspberry Pi Zero W. The RPi Zero W acts as a USB storage device that plugs into any USB plug-and-play supported digital frame and pictures are automatically downloaded to the Pi's mounted USB container file. All of the setup is configured through the Pi Zero W Frame's web interface and the URL address to access the setup will be provided to you after following the installation procedure below on your Raspberry Pi Zero W.

NOTE: Your digital picture frame needs a plug-and-play feature to play slideshows off the USB flash drive. This plug-and-play feature is not universally offered. It’s mostly found among mid-range and premium digital frames. Also, note that most mid-range frames limit the maximum supported capacity to around 16GB. 

Installation Proceedure:

    git clone https://github.com/Powersurge/Pi-Zero-W-Frame.git

    cd Pi-Zero-W-Frame

    sudo chmod +x install.sh && ./install.sh
