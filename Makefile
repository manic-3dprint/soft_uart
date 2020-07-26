obj-m += soft_uart.o

soft_uart-objs := module.o raspberry_soft_uart.o queue.o

LINUX = /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(LINUX) M=$(PWD) modules

clean:
	$(MAKE) -C $(LINUX) M=$(PWD) clean

install:
	sudo install -m 644 -c soft_uart.ko /lib/modules/$(RELEASE)
	sudo depmod

