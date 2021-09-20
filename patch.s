.arm.little

.open "code_orig.bin","code.bin",0x100000


.org 0x118ff8 ;when files get loaded
	b 0x119020 ; skip the check if HPB is loaded
.org 0x28ca5c
checkFileExist:
	tst r0, #0x80000000
	moveq r1,#0
	streq r1,[r4,#0x10]
	beq	0x119120	;found file load from rom path
	ldr r1,[r4,#0x10]
	cmp r1,#1
	movne r1,#1
	strne r1,[r4,#0x10]
	bne 0x11900c	;no file in the rom check HPB
	moveq r1,#0
	streq r1,[r4,#0x10]
	tst r0, #0x80000000
	b 0x119120
.org 0x11911c
	b checkFileExist

;when grabbing battle models and sounds does another check for the file? Possibly for DLC. Might break EOV/EO2U functionality if ported
.org 0x310668 ;when files get loaded
	b 0x31068c ; skip the check if HPB is loaded

.org 0x3107a8
	b 0x31067c ; no file leave to check hpb

.Close
