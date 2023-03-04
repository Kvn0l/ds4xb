# Some scripts to ease my experience with a Dualshock 4 V1

Scripts, services and udev rules to:
1. Automaticaly start evdevhook when DS4 is connected. (ds4hook)
2. Change LED to a desired color and maintain it with a loop. (ds4leds)
3. Start Xboxdrv to emulate xbox controller for use with Wine/Proton without Steam Overlay/Input emulation. (ds4xb)
4. Stop all three services on DS4 disconnection. (ds4stop)
5. Alternatively, a toggle to enable the services on demand (ds4toggle)

Required to work:
[evdevhook](https://github.com/v1993/evdevhook)
[xboxdrv](https://xboxdrv.gitlab.io/)

I ~stole ideas~ took inspiration from:                                                                                                                                                                       
ds360 by Yossef: https://github.com/yoyossef/ds360                                                                                                                         
A comment by xiota: https://github.com/yoyossef/ds360/issues/6
ds4led by Xilog https://github.com/XilogOfficial/ds4led
