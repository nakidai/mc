RM ?= rm -f


mc.bin: main.s
	fasm main.s mc.bin

README: README.7
	mandoc -Tascii README.7 | col -b > README

clean:
	${RM} blbc.bin
