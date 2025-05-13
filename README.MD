# duchamp aosp fts dt2w fix

<b><h2>Prerequisites</h2></b> 

Any AOSP with userdebug build

focaltech_ts touchscreen

Termux

Root

<h2><b>Installation</b></h2>
1.Give root to Termux
2.Write in Termux this
<code>su -c "remount"</code>
The output should be like that
<code>AVB verification is disabled, disabling verity state may have no effect
Remounted /system as RW
Remounted /system_ext as RW
Remounted /vendor as RW
Remounted /product as RW
Remounted /odm as RW
Remounted /vendor_dlkm as RW
Remounted /odm_dlkm as RW
Remounted /system_dlkm as RW
Remount succeeded</code>
If its not giving this output,reboot and redo that command
