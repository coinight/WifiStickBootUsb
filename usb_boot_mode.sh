#!/bin/bash
### BEGIN INIT INFO
# Provides:          kilo
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start usb daemon at boot time
# Description:       Start usb daemon at boot time
### END INIT INFO

echo "usb0 detecting" | tee /dev/kmsg
sleep 7
if dmesg | grep -q "IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready"; then
    echo "usb0 rndis connected" | tee /dev/kmsg
    echo "0" > /sys/class/leds/blue:wifi/brightness
else
    echo "usb0 rndis is not connected" | tee /dev/kmsg
    echo "switch usb0 -> host" | tee /dev/kmsg
    echo host > /sys/kernel/debug/usb/ci_hdrc.0/role
fi
