install:
	install -m 755 ds4toggle.sh /usr/bin/
	install -m 755 ds4hook.sh /usr/bin/
	install -m 755 ds4leds.sh /usr/bin/
	install -m 755 ds4xb.sh /usr/bin/
	install -m 755 ds4stop.sh /usr/bin/
	install -m 744 ds4.json /usr/etc/
	install -m 744 ds4xb.xboxdrv /usr/etc/
	install -m 744 ds4hook.service /usr/lib/systemd/system/
	install -m 744 ds4leds.service /usr/lib/systemd/system/
	install -m 744 ds4xb.service /usr/lib/systemd/system/
	install -m 744 ds4.target /usr/lib/systemd/system/
	install -m 744 80-ds4.rules /etc/udev/rules.d/
	systemctl daemon-reload
	sudo udevadm control --reload
	systemctl enable ds4leds.service ds4hook.service ds4xb.service

uninstall:
	systemctl disable --now ds4leds.service ds4hook.service ds4xb.service
	rm -f /usr/bin/ds4toggle.sh
	rm -f /usr/bin/ds4hook.sh
	rm -f /usr/bin/ds4leds.sh
	rm -f /usr/bin/ds4xb.sh
	rm -f /usr/bin/ds4stop.sh
	rm -f /usr/etc/ds4.json
	rm -f /usr/etc/ds4xb.xboxdrv
	rm -f /usr/lib/systemd/system/ds4hook.service
	rm -f /usr/lib/systemd/system/ds4leds.service
	rm -f /usr/lib/systemd/system/ds4xb.service
	rm -f /usr/lib/systemd/system/ds4.service
	rm -f /usr/lib/systemd/system/ds4.target
	rm -f /etc/systemd/system/ds4hook.service
	rm -f /etc/systemd/system/ds4leds.service
	rm -f /etc/systemd/system/ds4xb.service
	rm -f /etc/systemd/system/ds4.target.wants/ds4hook.service
	rm -f /etc/systemd/system/ds4.target.wants/ds4leds.service
	rm -f /etc/systemd/system/ds4.target.wants/ds4xb.service
	rm -f /etc/udev/rules.d/80-ds4.rules
	systemctl daemon-reload
	sudo udevadm control --reload