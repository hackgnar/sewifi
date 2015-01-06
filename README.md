<a href="https://twitter.com/hackgnar" class="twitter-follow-button" data-show-count="true">Follow @hackgnar</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

All documentaion and code hosted here is a huge work in progress.  Im in the process of writing docs, porting existing code and cleanup.

# The SEWiFi Project
* The SEWiFi project aims to create a security enhanced WiFi USB dongle.  The USB device for this project is based on a Debian ARM distribution which masqurades as a USB WiFi dongle which passes a host computers network traffic though a full security stack (i.e. Firewall, IDS, IPS, VPN, etc).
* The project is currently in its early stages.
* The current hardware for this project is a Gumstix Overo ARM board with an Overo Thunbo daughter board.
* The base OS is a tweeked Debian ARM Linux distribution.

## Install
### (option 1) Download preconfigured image
### (option 2) Install from sewifi deb on clean debian/kali Gumstix Overo image
### Flash to SD card


# THE FOLLOWING WILL BE REMOVED WITH LINKS TO THE DEB INSTALL GUIDE

## Install
To install the base os, you must first obtain the base system image via one of three methods:
1. download nightly image
2. manual build
3. automated build

### Download
This is obiously the easiest method and requres you to download the following 5 files:
```
curl -O http://someurl.com/mk2partsd
curl -O http://someurl.com/MLO
curl -O http://someurl.com/u-boot.img
curl -O http://someurl.com/uImage
curl -O http://someurl.com/wheezy.tar.bz2
```

### Manual Build
The manual build process takes some time but allows for the most customization.  The process includes the following steps
#### Yocto build
* follow the documentation found at http://github.com/hackgnar/bla
#### Debian build
* follow the documentation found at http://github.com/hackgnar/bla

### Automated Build
The automated build process takes some time but also allows for customization.  However you will have to alter the build scripts for your customizatons.  The process includes the following steps
#### Yocto build
* download and run the following script to build yocto
```
curl -O http://someurl.com/script
bash script
```
#### Debian build
* download and run the following script to build debian
```
curl -O http://someurl.com/script
bash script
```

### Image installation
* follow the documentation found here http://githun.com/hackgnar/bla  to install your base image
