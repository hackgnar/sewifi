[![Follow Hackgnar](static/twitter_hackgnar.png)](https://twitter.com/hackgnar)



# The SEWiFi Project
![](static/sewifi_img_small.jpg)

* **NOTE:** All documentaion and code hosted here is a huge work in progress.  Im in the process of writing docs, porting existing code and cleanup.
* The SEWiFi project aims to create a security enhanced WiFi USB dongle.  The USB device for this project is based on a Debian ARM distribution which masqurades as a USB WiFi dongle which passes a host computers network traffic though a full security stack (i.e. Firewall, IDS, IPS, VPN, etc).
* The project is currently in its early stages.
* The current hardware for this project is a Gumstix Overo ARM board with an Overo Thunbo daughter board.
* The base OS is a tweeked Debian ARM Linux distribution which can be installed on a base Debian system with a single deb package.
* Precompiled images of the project can be obtained [here](https://github.com/hackgnar/gumstix-overo-images/blob/master/sewifi)

## Install SEWiFi to a Gumstix Overo with Thumbo board
### (option 1) Download preconfigured image
* Documentation can be found [here](https://github.com/hackgnar/gumstix-overo-images/blob/master/sewifi/build_precompiled_image.md)

### (option 2) Build your own image 
* Documentation can be found [here](https://github.com/hackgnar/gumstix-overo-images/blob/master/sewifi/build_manually.md)

### (option 3) Install the SEWIFI overlay deb to a preexisting Gumstix Overo Debian system
* if you are already running Debian on a Gumstix Overo board you can simply do the following

#### Add the sewifi apt repo
````
cat << EOF > sewifi/etc/apt/sources.list
deb https://raw.githubusercontent.com/hackgnar/sewifi/master/apt-repo main
EOF
apt-get update
````

#### Install the Overlay Package
````
apt-get install sewifi-gumstix-overo
````
