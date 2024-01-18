# WifiStickBootUsb
WifiStick410_AutoSwitchUsbAtBoot

switch usb mode at boot
if wifistick had been plugged into pc then usb->rndis
else usb->host

use:
mv usb_boot_mode.sh to /etc/init.d
```
update-rc.d usb_boot_mode.sh defaults
```
