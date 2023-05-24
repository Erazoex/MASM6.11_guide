all: test4.asm
	dosbox -c 'ml test/test4/helper.asm' -c 'ml test/test4/test4.asm' -c 'LINK test4.obj helper.obj' -c 'test4/test4.asm' 

debug: test4.asm
	dosbox -c 'ml test/test4/test4.asm' -c 'debug test4/test4.exe'