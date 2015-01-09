[![Follow Hackgnar](../static/twitter_hackgnar.png)](https://twitter.com/hackgnar)

# SEWiFi all in one deb package
* The SEWiFi deb package is a wrapper package that installs Security tools used by SEWiFi devices.
* The deb package installs numerous dependancy packages and configures your base Debian OS
* Note: the configuration scripts run by the deb package assume your networking devices match those of a Gumstix Overo with Thumbo board

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

# SEWiFi Base OS Configuation Script
* **NOTE:** The configure_gumstix.sh script located here is outdated and is not the prefered way to set up your system... Please use the deb package created from the deb_package_build.sh or download a precompiled deb package [here]()
* This is the script to configure the base Debian ARM OS as an SEWiFi device.
* SEWiFi currently supports a Gumstix Overo ARM board running on a Thumbo daughterboard with a stock Debian ARM os.
* To setup your Gumstix device with Debian, follow the documentation found here http://url.com
* To setup your target OS as an SEWiFi device, run the following:
```
curl -O https://raw.githubusercontent.com/hackgnar/sewifi/master/sewifi_config/configure_gumstix.sh
bash configure_sewifi.sh
```
