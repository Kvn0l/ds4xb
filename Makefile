ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

install:
	install -m 755 ds4toggle.sh $(PREFIX)/bin/
	install -m 755 ds4hook.sh $(PREFIX)/bin/
	install -m 755 ds4leds.sh $(PREFIX)/bin/
	install -m 755 ds4xb.sh $(PREFIX)/bin/
	install -m 755 ds4stop.sh $(PREFIX)/bin/
	install -m 744 ds4.json $(PREFIX)/etc/
	install -m 744 ds4xb.xboxdrv $(PREFIX)/etc/
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
	rm -f $(PREFIX)/bin/ds4toggle.sh
	rm -f $(PREFIX)/bin/ds4hook.sh
	rm -f $(PREFIX)/bin/ds4leds.sh
	rm -f $(PREFIX)/bin/ds4xb.sh
	rm -f $(PREFIX)/bin/ds4stop.sh
	rm -f $(PREFIX)/etc/ds4.json
	rm -f $(PREFIX)/etc/ds4xb.xboxdrv
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