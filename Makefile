if [ -z "$ROOT" ]
then
      set $ROOT="/"
fi


install:
	install -m 755 ds4toggle.sh $(ROOT)usr/bin/
	install -m 755 ds4hook.sh $(ROOT)usr/bin/
	install -m 755 ds4leds.sh $(ROOT)usr/bin/
	install -m 755 ds4xb.sh $(ROOT)usr/bin/
	install -m 755 ds4stop.sh $(ROOT)usr/bin/
	install -m 744 ds4hook.json $(ROOT)etc/
	install -m 744 ds4xb.xboxdrv $(ROOT)etc/
	install -m 744 ds4hook.service $(ROOT)usr/lib/systemd/system/
	install -m 744 ds4leds.service $(ROOT)usr/lib/systemd/system/
	install -m 744 ds4xb.service $(ROOT)usr/lib/systemd/system/
	install -m 744 ds4.target $(ROOT)usr/lib/systemd/system/
	install -m 744 80-ds4.rules $(ROOT)etc/udev/rules.d/
	systemctl daemon-reload
	sudo udevadm control --reload
	systemctl enable ds4leds.service ds4hook.service ds4xb.service

uninstall:
	systemctl disable --now ds4leds.service ds4hook.service ds4xb.service
	rm -f $(ROOT)usr/bin/ds4toggle.sh
	rm -f $(ROOT)usr/bin/ds4hook.sh
	rm -f $(ROOT)usr/bin/ds4leds.sh
	rm -f $(ROOT)usr/bin/ds4xb.sh
	rm -f $(ROOT)usr/bin/ds4stop.sh
	rm -f $(ROOT)etc/ds4hook.json
	rm -f $(ROOT)etc/ds4xb.xboxdrv
	rm -f $(ROOT)usr/lib/systemd/system/ds4hook.service
	rm -f $(ROOT)usr/lib/systemd/system/ds4leds.service
	rm -f $(ROOT)usr/lib/systemd/system/ds4xb.service
	rm -f $(ROOT)usr/lib/systemd/system/ds4.service
	rm -f $(ROOT)usr/lib/systemd/system/ds4.target
	rm -f $(ROOT)etc/systemd/system/ds4hook.service
	rm -f $(ROOT)etc/systemd/system/ds4leds.service
	rm -f $(ROOT)etc/systemd/system/ds4xb.service
	rm -f $(ROOT)etc/systemd/system/ds4.target.wants/ds4hook.service
	rm -f $(ROOT)etc/systemd/system/ds4.target.wants/ds4leds.service
	rm -f $(ROOT)etc/systemd/system/ds4.target.wants/ds4xb.service
	rm -f $(ROOT)etc/udev/rules.d/80-ds4.rules
	systemctl daemon-reload
	sudo udevadm control --reload