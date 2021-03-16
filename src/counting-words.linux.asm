;; @file counting-words.elf64.asm
;; @author Adam J. Richardson
;; @brief Counting words for Linux 64-bit.
;;
;;00000001111111111222222222233333333334444444444555555555566666666667
;;34567890123456789012345678901234567890123456789012345678901234567890

;; Linux call registers convention: rdi, rsi, rdx, rcx, r8, r9
;; and xmm0-7 (floating point regs) - extra parms on stack

bits 64

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
mov	rdi, fd_stdout
lea	rsi, cz_label1
mov	rdx, cb_len1
mov	rax, sys_write
syscall

lea	rsi, cz_label2
mov	rdx, cb_len2
mov	rax, sys_write
syscall

lea	rsi, cz_crlf
mov	rdx, cb_len3
mov	rax, sys_write
syscall

xor	edi, edi
call	cf_exit

cf_exit:
mov	rax, sys_exit
syscall

section .rodata:
cz_label1:      db      'Program name: ', 0
cb_len1:        equ     $-cz_label1
cz_label2:	db	'counting-words', 0
cb_len2:	equ	$-cz_label2
cz_crlf:	db	13, 10, 0
cb_len3:	equ	$-cz_crlf
sys_exit:	equ	60
sys_write:	equ	1
fd_stdout:	equ	1

