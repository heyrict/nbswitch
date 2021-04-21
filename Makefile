BLACKLISTCONF=custom-bumblebee.conf
BLACKLISTTARGET=/etc/modprobe.d/custom-bumblebee.conf
NVIDIAON=lsmod | grep nvidia > /dev/null
BBSWITCHON=lsmod | grep bbswitch > /dev/null

.PHONY: show off on startx nvidia-startx

show:
	@if $(NVIDIAON); then\
		echo nvidia on;\
	else\
		echo nvidia off;\
	fi
	@if $(BBSWITCHON); then\
		echo bbswitch on;\
	else\
		echo bbswitch off;\
	fi

off:
	@if [ -f /etc/X11/xorg.conf.d/50-prime-offload.conf ]; then\
		rm /etc/X11/xorg.conf.d/50-prime-offload.conf;\
	fi
	@if $(NVIDIAON); then\
		rmmod nvidia-uvm;\
		rmmod nvidia-drm;\
		rmmod nvidia-modeset;\
		rmmod nvidia;\
	fi
	@if ! $(BBSWITCHON); then\
		modprobe bbswitch;\
		sleep 2s && systemctl start bumblebeed;\
	fi

on:
	@if [ ! -f /etc/X11/xorg.conf.d/50-prime-offload.conf ]; then\
		cp config/xorg/50-prime-offload.conf /etc/X11/xorg.conf.d/;\
	fi
	@if $(BBSWITCHON); then\
		sleep 2s && systemctl stop bumblebeed;\
		rmmod bbswitch;\
	fi
	@if ! $(NVIDIAON); then\
		modprobe nvidia;\
		modprobe nvidia-drm;\
		modprobe nvidia-uvm;\
	fi

startx: off
	cd && startx

nvidia-startx: on
	cd && startx
