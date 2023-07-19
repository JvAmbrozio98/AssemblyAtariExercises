	processor 6502
	include "vcs.h"
        include "macro.h"
        seg Code ; Define a new segment named "Code"
	org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
	CLEAN_START
        lda #$1E
        sta COLUBK
	;jmp Start
        
        .org $FFFC ; End the ROM always at position $FFFC
	.word Start ; Put 2 bytes with reset address at memory position $FFFC
	.word Start ; Put 2 bytes with break address at memory position $FFFE