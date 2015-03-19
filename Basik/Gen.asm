
; Gen (hl = src, bc = length; de = ptr to code byte after addition)
;
Gen             push hl
                ld hl, (CodePtr)
                push hl
                add hl, bc
                ld de, (CodeTop)
                and a
                sbc hl, de
                jp nc, gOutOfMemory
                pop de
                pop hl
                ldir
                ld (CodePtr), de
                ret

gOutOfMemory    halt
                ret

GenRet          ld hl, (CodePtr)
                ld (hl), $c9            ; $c9 = 'ret'
                inc hl
                ld (CodePtr), hl
                ret

ResetGen        ld hl, (CodeBase)
                ld (CodePtr), hl
                ret
