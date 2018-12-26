BLACKLISTCONF=custom-bumblebee.conf
BLACKLISTTARGET=/etc/modprobe.d/custom-bumblebee.conf
NVIDIAON=lsmod | grep nvidia > /dev/null
BBSWITCHON=lsmod | grep bbswitch > /dev/null

.PHONY: test off on

show:
	@if [ -f $(BLACKLISTTARGET) ]; then\
		echo blacklist config file exist;\
	else\
		echo blacklist config file not exist;\
	fi
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
	@if ! [ -f $(BLACKLISTTARGET) ]; then\
		cp $(BLACKLISTCONF) $(BLACKLISTTARGET);\
	fi
	@if $(NVIDIAON); then\
		rmmod nvidia-uvm;\
		rmmod nvidia-drm;\
		rmmod nvidia-modeset;\
		rmmod nvidia;\
	fi
	@if ! $(BBSWITCHON); then\
		modprobe bbswitch;\
		sleep 2s && service bumblebeed start;\
	fi

on:
	@if [ -f $(BLACKLISTTARGET) ]; then\
		rm $(BLACKLISTTARGET);\
	fi
	@if $(BBSWITCHON); then\
		sleep 2s && service bumblebeed stop;\
		rmmod bbswitch;\
	fi
	@if ! $(NVIDIAON); then\
		modprobe nvidia;\
	fi
