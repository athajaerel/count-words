;; @file counting-words.elf64.asm
;; @author Adam J. Richardson
;; @brief Counting words for Linux 64-bit.
;;
;;00000001111111111222222222233333333334444444444555555555566666666667
;;34567890123456789012345678901234567890123456789012345678901234567890

;;--------------------------------------------------------------------
;; Code section.
;;--------------------------------------------------------------------
section .text

;; Declare the entry point to the linker.
global _start

;;--------------------------------------------------------------------
;; The entry point for the program.
;;--------------------------------------------------------------------
_start:
.lcf_init:
pop     rax
mov     rbx, 1
mov     rcx, cz_label1
mov     rdx, cb_len1
call    cf_write
pop     rcx
call    cf_zwrite
xor     ebx, ebx
call    cf_exit

cf_zwrite:
mov     rdx, 13
; debug value 13 for args program; returns -14 from kernel and doesn't print?
call    cf_write
ret

cf_write:
mov	rax, 4
call	cf_kernel
ret

cf_exit:
mov	rax, 1
call	cf_kernel
ret

cf_kernel:
int	0x80
ret

section .data:
cz_label1:      db      'Program name: ', 0
cb_len1:        equ     $-cz_label1

