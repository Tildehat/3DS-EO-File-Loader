.arm.little

.open "code_orig.bin","code.bin",0x100000


.org 0x118ff8 ;when files get loaded
	b 0x119020 ; skip the check if HPB is loaded
checkFileExist:
	tst r0, #0x80000000
	bne 0x11900c	;no file in the rom check HPB
	beq	0x119120	;found file load from rom path
	
.org 0x11911c
	b checkFileExist

.Close
