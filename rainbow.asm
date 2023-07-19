    processor 6502
    include "vcs.h"
    include "macro.h"
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
  

Start:
    CLEAN_START


VerticalScanLine:
    lda #2 ;register com 2,ou segundo bit ativo em binário
    sta VBLANK ;liga o VBLANk da Tia
    Sta VSYNC ;liga o Vsync da Tia 
    sta WSYNC ;Primeira scanline 
    sta WSYNC ;Segunda scanline 
    sta WSYNC ;Terceira Scanline
    lda #0 ;Register em 0,com zero bits ativos 
    sta WSYNC ;desliga o Wsync colocando 0 no endereço de memória 
    ldx #37 ;Contador para proxima label em 37 
VerticalBlank:
    sta WSYNC ; ligando o Wsync  
    dex ; x-- 
    bne VerticalBlank 
    lda #0 
    sta VBLANK
    ldx #192 ;iniciando contador com 192 numero 
CurrentFrame:
    dex ;x-- 
    stx COLUBK ;define a cor para o valor de x no register 
    sta WSYNC ;espera pela próxima linha do Wsync 
    bne CurrentFrame ;repete o loop até chegar em zerp
    lda #0 ;coloca o register A com o valor 0 
    sta VBLANK
    ldx #32 
    sta VSYNC  
    lda VBLANK
    ldx #30
OverScan:
    sta WSYNC
    dex 
    bne OverScan
    jmp VerticalScanLine
    
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE

    
