WiFi Reset Service
==================

Systemd service to reset (ifdown &amp; ifup) all wireless interfaces on boot.  Greatly improves reliability of wifi adapters on the BeagleBone Black's Debian OS with 3.8 kernel.

Installation
============

This *must* be run on a BeagleBone Black running the Debian operating system.  Get the latest image from: http://beagleboard.org/latest-images

Next make sure you've upgraded to the latest kernel available by executing once (be sure you device has internet access first):

````
cd /opt/scripts/tools/
./update_kernel.sh
````

Once the kernel has updated and the device restarted, install the service by entering the directory where this repository was cloned and executing:

````
./install.sh
````

You should see the following response:

````
Installing wifi reset service to /opt/wifi-reset.
Installing systemd service to run at boot.
Enabling systemd service.
````

That's it!  On boot the service will reset (run ifdown and ifup) all wifi interfaces.

If you'd ever like to disable the service, run the command:

````
systemctl disable wifi-reset.service
````
