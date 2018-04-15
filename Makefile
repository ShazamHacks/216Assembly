


MCU=atmega32u4
avr-gcc=/afs/glue.umd.edu/class/spring2018/cmsc/216/0101/public/bin/avr-gcc
simavr=/afs/glue.umd.edu/class/spring2018/cmsc/216/0101/public/bin/simavr
RUN_AVR=$(simavr) --mcu $(MCU)

%: %.S init.c serial.c
	$(avr-gcc) -g -mmcu=$(MCU) $^ -o $@

%.run: %
	$(RUN_AVR) $*
