RM ?= rm -f


mc.bin: main.s
	fasm main.s mc.bin

clean:
	${RM} blbc.bin
