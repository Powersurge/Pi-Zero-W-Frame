# Pi-Zero-W-Frame

Connect your digital frame to a WebDAV server such as Nextcloud using a Raspberry Pi Zero W. The RPi Zero W acts as a USB storage device that plugs into any USB plug-and-play supported digital frame and pictures are automatically downloaded to the Pi's mounted USB container file. All of the setup is configured through the Pi Zero W Frame's web interface and the URL address to access the setup will be provided to you after following the installation procedure below on your Raspberry Pi Zero W.

NOTE: This project has only been tested using Nextcloud, but should also work with Owncloud and Sharepoint, as well. I was able to get this project to work with my Aluratek 8" digital photo frame, but I needed to also buy a separate power supply that can handle more than 1 amp, which was what was included with the frame. Your digital picture frame might not recognize the Pi Zero, but if it does then please let me know so that I can compile a list of supported frames. I do know that you will need a digital frame with a plug-and-play feature to play slideshows off the USB flash drive. This plug-and-play feature is not universally offered. It’s mostly found among mid-range and premium digital frames. Also, note that most mid-range frames limit the maximum supported capacity to around 16GB. <a href="https://www.reddit.com/r/raspberry_pi/comments/ap7v2l/breathe_new_life_into_an_old_digital_picture/">This Reddit post</a> discusses using a Pi Zero W with a digital picture frame.

Installation Proceedure:

    git clone https://github.com/Powersurge/Pi-Zero-W-Frame.git

    cd Pi-Zero-W-Frame

    sudo chmod +x install.sh && ./install.sh
