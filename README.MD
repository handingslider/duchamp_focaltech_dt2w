# duchamp aosp fts dt2w fix

<b><h2>Prerequisites</h2></b> 

Any AOSP with userdebug build

focaltech_ts touchscreen

Termux

Root

<h2><b>Installation</b></h2>
1.Give root to Termux<br>
2.Write in Termux this<br>
<code>su -c "remount"</code><br>
The output should be like that<br>
<code>AVB verification is disabled, disabling verity state may have no effect
Remounted /system as RW
Remounted /system_ext as RW
Remounted /vendor as RW
Remounted /product as RW
Remounted /odm as RW
Remounted /vendor_dlkm as RW
Remounted /odm_dlkm as RW
Remounted /system_dlkm as RW
Remount succeeded</code><br>
If its not giving this output,reboot and redo that command<br>
3.Enter that in Termux<br>
<code>curl https://raw.githubusercontent.com/handingslider/duchamp_focaltech_dt2w/refs/heads/main/fix.sh | bash</code><br>
4.Reboot and enjoy
