ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

install: ds4xb
	install -m 555 ds4hook.sh $(PREFIX)/bin/
	install -m 555 ds4xb.sh $(PREFIX)/bin/
	install -m 555 start-ds4xb.sh $(PREFIX)/bin/
	install -m 555 stop-ds4xb.sh $(PREFIX)/bin/
	install -m 555 ds4stop.sh $(PREFIX)/bin/
	install -m 444 ds4hook.json $(PREFIX)/etc/
	install -m 444 ds4xb.xboxdrv $(PREFIX)/etc/
	install -m 444 ds4hook.service /usr/lib/systemd/system/
	install -m 444 ds4xb.service /usr/lib/systemd/system/
	install -m 444 ds4xb.service /usr/lib/systemd/user/
	install -m 444 80-ds4hook.rules /usr/lib/udev/rules.d/
	systemctl daemon-reload
	sudo udevadm control --reload

uninstall:
	rm -f $(PREFIX)/bin/ds4hook.sh
	rm -f $(PREFIX)/bin/ds4xb.sh
	rm -f $(PREFIX)/bin/start-ds4xb.sh
	rm -f $(PREFIX)/bin/stop-ds4xb.sh
	rm -f $(PREFIX)/bin/ds4stop.sh
	rm -f $(PREFIX)/bin/ds4hook.json
	rm -f $(PREFIX)/bin/ds4xb.xboxdrv
	rm -f /etc/systemd/system/ds4hook.service
	rm -f /etc/systemd/system/ds4xb.service	
	systemctl daemon-reload
	sudo rm -f /usr/lib/udev/rules.d/80-ds4hook.rules
	sudo rm -f /usr/bin/ds4stop.sh
	sudo udevadm control --reload