adb root
adb wait-for-device
adb remount
adb wait-for-device
adb push Country.txt /data/fusion
adb push deviceconfig_N7001.xml /data/fusion/deviceconfig.xml
adb push deviceconfig_outofboxexperience.xml /data/fusion/

pause

adb reboot
