.data
.align 2
_buffer:	.space	256
	.word	1
msg_0:	.asciiz	" "
	.word	1
msg_1:	.asciiz	"\n"
	.word	0
msg_2:	.asciiz	""
	.word	79
msg_3:	.asciiz	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i"
	.word	12
msg_4:	.asciiz	"Let's start!"
	.word	5
msg_5:	.asciiz	"step "
	.word	1
msg_6:	.asciiz	":"
	.word	7
msg_7:	.asciiz	"Total: "
	.word	8
msg_8:	.asciiz	" step(s)"
var_0:	.word	0
var_1:	.word	0
var_2:	.word	0
var_3:	.word	0
var_4:	.word	48271
var_5:	.word	2147483647
var_6:	.word	0
var_7:	.word	0
var_8:	.word	1
.text
f_random:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	lw $s3, var_4
	lw $s5, var_8
	lw $s2, var_6
	rem $s5, $s5, $s2
	mul $s3, $s3, $s5
	lw $t6, var_7
	lw $s5, var_8
	lw $s2, var_6
	div $s5, $s5, $s2
	mul $s5, $t6, $s5
	sub $s3, $s3, $s5
	sge $s5, $s3, 0
	beq $zero, $s5, L51
	move $s5, $s3
	sw $s5, var_8
	b L52
L51:
	lw $s5, var_5
	add $s3, $s3, $s5
	move $s5, $s3
	sw $s5, var_8
L52:
	lw $s5, var_8
	move $v0, $s5
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_move:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	li $s3, 0
L94:
	lw $s5, var_2
	slt $s5, $s3, $s5
	beq $zero, $s5, L95
	lw $s2, var_3
	mul $s5, $s3, 4
	add $s5, $s2, $s5
	lw $s2, 0($s5)
	sub $s2, $s2, 1
	sw $s2, 0($s5)
	add $s3, $s3, 1
L96:
	b L94
L95:
	lw $s2, var_3
	lw $s5, var_2
	mul $s3, $s5, 4
	add $s3, $s2, $s3
	sw $s5, 0($s3)
	lw $s5, var_2
	add $s5, $s5, 1
	sw $s5, var_2
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_pd:
	move $s3, $a0
	sub $sp, $sp, 4
	sw $ra, 0($sp)
L53:
	lw $s5, var_1
	sle $s5, $s5, $s3
	beq $zero, $s5, L54
	lw $s5, var_1
	add $s2, $s5, 1
	mul $s5, $s5, $s2
	div $s5, $s5, 2
	seq $s5, $s3, $s5
	beq $zero, $s5, L56
	li $v0, 1
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	b L57
L56:
L57:
L55:
	lw $s5, var_1
	add $s5, $s5, 1
	sw $s5, var_1
	b L53
L54:
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_swap:
	move $s3, $a0
	move $s5, $a1
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	lw $s2, var_3
	mul $t6, $s3, 4
	add $s2, $s2, $t6
	lw $s2, 0($s2)
	move $t6, $s2
	lw $s2, var_3
	mul $t9, $s5, 4
	add $s2, $s2, $t9
	lw $t9, 0($s2)
	lw $s2, var_3
	mul $s3, $s3, 4
	add $s3, $s2, $s3
	move $s2, $t9
	sw $s2, 0($s3)
	lw $s2, var_3
	mul $s3, $s5, 4
	add $s3, $s2, $s3
	move $s5, $t6
	sw $s5, 0($s3)
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_merge:
	sub $sp, $sp, 8
	sw $ra, 0($sp)
	li $s3, 0
L79:
	lw $s5, var_2
	slt $s5, $s3, $s5
	beq $zero, $s5, L80
	lw $s5, var_3
	mul $s2, $s3, 4
	add $s5, $s5, $s2
	lw $s5, 0($s5)
	seq $s5, $s5, 0
	beq $zero, $s5, L82
	add $s5, $s3, 1
	move $s2, $s5
L84:
	lw $s5, var_2
	slt $s5, $s2, $s5
	beq $zero, $s5, L85
	lw $s5, var_3
	mul $t6, $s2, 4
	add $s5, $s5, $t6
	lw $s5, 0($s5)
	sne $s5, $s5, 0
	beq $zero, $s5, L87
	move $a0, $s3
	move $a1, $s2
	sw $s3, 4($sp)
	jal f_swap
	lw $s3, 4($sp)
	b L85
	b L88
L87:
L88:
L86:
	add $s2, $s2, 1
	b L84
L85:
	b L83
L82:
L83:
L81:
	add $s3, $s3, 1
	b L79
L80:
	li $s3, 0
L89:
	lw $s5, var_2
	slt $s5, $s3, $s5
	beq $zero, $s5, L90
	lw $s5, var_3
	mul $s2, $s3, 4
	add $s5, $s5, $s2
	lw $s5, 0($s5)
	seq $s5, $s5, 0
	beq $zero, $s5, L92
	move $s5, $s3
	sw $s5, var_2
	b L90
	b L93
L92:
L93:
L91:
	add $s3, $s3, 1
	b L89
L90:
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
f_show:
	sub $sp, $sp, 8
	sw $ra, 0($sp)
	li $s3, 0
L58:
	lw $s5, var_2
	slt $s5, $s3, $s5
	beq $zero, $s5, L59
	lw $s5, var_3
	mul $s2, $s3, 4
	add $s5, $s5, $s2
	lw $s5, 0($s5)
	move $a0, $s5
	sw $s3, 4($sp)
	jal f_toString
	lw $s3, 4($sp)
	move $s5, $v0
	move $a0, $s5
	la $a1, msg_0
	sw $s3, 4($sp)
	jal f_str.stringConcatenate
	lw $s3, 4($sp)
	move $s5, $v0
	move $a0, $s5
	li $v0, 4
	syscall
L60:
	add $s3, $s3, 1
	b L58
L59:
	la $a0, msg_2
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
main:
	sub $sp, $sp, 16
	sw $ra, 0($sp)
	li $s3, 0
	li $s5, 0
	li $s2, 0
	li $t6, 210
	sw $t6, var_0
	li $t6, 0
	sw $t6, var_1
	li $a0, 404
	li $v0, 9
	syscall
	li $t6, 100
	sw $t6, 0($v0)
	add $t6, $v0, 4
	sw $t6, var_3
	lw $t6, var_5
	lw $t9, var_4
	div $t6, $t6, $t9
	sw $t6, var_6
	lw $t6, var_5
	lw $t9, var_4
	rem $t6, $t6, $t9
	sw $t6, var_7
	lw $t6, var_0
	move $a0, $t6
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_pd
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	seq $t6, $zero, $t6
	beq $zero, $t6, L97
	la $a0, msg_3
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
	li $v0, 1
	lw $ra, 0($sp)
	add $sp, $sp, 16
	jr $ra
	b L98
L97:
L98:
	la $a0, msg_4
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
	li $t6, 3654898
	move $a0, $t6
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_initialize
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_random
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	rem $t6, $t6, 10
	add $t6, $t6, 1
	move $t9, $t6
	sw $t9, var_2
	lw $t9, var_2
	move $a0, $t9
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_toString
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	move $a0, $t6
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
L99:
	lw $t9, var_2
	sub $t6, $t9, 1
	slt $t6, $s3, $t6
	beq $zero, $t6, L100
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_random
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	rem $t6, $t6, 10
	add $t9, $t6, 1
	lw $t6, var_3
	mul $s0, $s3, 4
	add $t6, $t6, $s0
	sw $t9, 0($t6)
L102:
	lw $t6, var_3
	mul $t9, $s3, 4
	add $t6, $t6, $t9
	lw $t6, 0($t6)
	add $t9, $t6, $s5
	lw $t6, var_0
	sgt $t6, $t9, $t6
	beq $zero, $t6, L103
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_random
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	rem $t6, $t6, 10
	add $t9, $t6, 1
	lw $t6, var_3
	mul $s0, $s3, 4
	add $t6, $t6, $s0
	sw $t9, 0($t6)
	b L102
L103:
	lw $t6, var_3
	mul $t9, $s3, 4
	add $t6, $t6, $t9
	lw $t6, 0($t6)
	add $s5, $s5, $t6
L101:
	add $s3, $s3, 1
	b L99
L100:
	lw $t6, var_0
	sub $s3, $t6, $s5
	lw $t6, var_3
	lw $t9, var_2
	sub $s5, $t9, 1
	mul $s5, $s5, 4
	add $s5, $t6, $s5
	sw $s3, 0($s5)
	sw $s2, 12($sp)
	jal f_show
	lw $s2, 12($sp)
	sw $s2, 12($sp)
	jal f_merge
	lw $s2, 12($sp)
L104:
	sw $s2, 12($sp)
	jal f_win
	lw $s2, 12($sp)
	move $s3, $v0
	seq $s3, $zero, $s3
	beq $zero, $s3, L105
	add $s2, $s2, 1
	move $a0, $s2
	sw $s2, 12($sp)
	jal f_toString
	lw $s2, 12($sp)
	move $s3, $v0
	la $a0, msg_5
	move $a1, $s3
	sw $s2, 12($sp)
	jal f_str.stringConcatenate
	lw $s2, 12($sp)
	move $s3, $v0
	move $a0, $s3
	la $a1, msg_6
	sw $s2, 12($sp)
	jal f_str.stringConcatenate
	lw $s2, 12($sp)
	move $s3, $v0
	move $a0, $s3
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
	sw $s2, 12($sp)
	jal f_move
	lw $s2, 12($sp)
	sw $s2, 12($sp)
	jal f_merge
	lw $s2, 12($sp)
	sw $s2, 12($sp)
	jal f_show
	lw $s2, 12($sp)
	b L104
L105:
	move $a0, $s2
	jal f_toString
	move $s3, $v0
	la $a0, msg_7
	move $a1, $s3
	jal f_str.stringConcatenate
	move $s3, $v0
	move $a0, $s3
	la $a1, msg_8
	jal f_str.stringConcatenate
	move $s3, $v0
	move $a0, $s3
	li $v0, 4
	syscall
	la $a0, msg_1
	li $v0, 4
	syscall
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 16
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 16
	jr $ra
	b main_end
main_end:
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
f_initialize:
	move $s3, $a0
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	sw $s3, var_8
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_win:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	li $a0, 404
	li $v0, 9
	syscall
	li $s3, 100
	sw $s3, 0($v0)
	add $s3, $v0, 4
	lw $s5, var_2
	lw $s2, var_1
	sne $s5, $s5, $s2
	beq $zero, $s5, L61
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	b L62
L61:
L62:
	li $s2, 0
L63:
	lw $s5, var_2
	slt $s5, $s2, $s5
	beq $zero, $s5, L64
	lw $s5, var_3
	mul $t6, $s2, 4
	add $s5, $s5, $t6
	lw $s5, 0($s5)
	mul $t6, $s2, 4
	add $t6, $s3, $t6
	sw $s5, 0($t6)
L65:
	add $s2, $s2, 1
	b L63
L64:
	li $t6, 0
L66:
	lw $s5, var_2
	sub $s5, $s5, 1
	slt $s5, $t6, $s5
	beq $zero, $s5, L67
	add $s5, $t6, 1
	move $s2, $s5
L69:
	lw $s5, var_2
	slt $s5, $s2, $s5
	beq $zero, $s5, L70
	mul $s5, $t6, 4
	add $s5, $s3, $s5
	lw $s5, 0($s5)
	mul $t9, $s2, 4
	add $t9, $s3, $t9
	lw $t9, 0($t9)
	sgt $s5, $s5, $t9
	beq $zero, $s5, L72
	mul $s5, $t6, 4
	add $s5, $s3, $s5
	lw $s5, 0($s5)
	mul $t9, $s2, 4
	add $t9, $s3, $t9
	lw $t9, 0($t9)
	mul $s0, $t6, 4
	add $s0, $s3, $s0
	sw $t9, 0($s0)
	mul $t9, $s2, 4
	add $t9, $s3, $t9
	sw $s5, 0($t9)
	b L73
L72:
L73:
L71:
	add $s2, $s2, 1
	b L69
L70:
L68:
	add $t6, $t6, 1
	b L66
L67:
	li $t6, 0
L74:
	lw $s5, var_2
	slt $s5, $t6, $s5
	beq $zero, $s5, L75
	mul $s5, $t6, 4
	add $s5, $s3, $s5
	lw $s5, 0($s5)
	add $s2, $t6, 1
	sne $s5, $s5, $s2
	beq $zero, $s5, L77
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	b L78
L77:
L78:
L76:
	add $t6, $t6, 1
	b L74
L75:
	li $v0, 1
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_toString:
	li $t0, 0
	bgez $a0, _skip_set_less_than_zero
	li $t0, 1
	neg $a0, $a0
	_skip_set_less_than_zero:
	beqz $a0, _set_zero
	li $t1, 0
	move $t2, $a0
	move $t3, $a0
	li $t5, 10
	_begin_count_digit:
	div $t2, $t5
	mflo $v0
	mfhi $v1
	bgtz $v0 _not_yet
	bgtz $v1 _not_yet
	j _yet
	_not_yet:
	add $t1, $t1, 1
	move $t2, $v0
	j _begin_count_digit
	_yet:
	beqz $t0, _skip_reserve_neg
	add $t1, $t1, 1
	_skip_reserve_neg:
	add $a0, $t1, 5
	li $v0, 9
	syscall
	sw $t1, 0($v0)
	add $v0, $v0, 4
	add $t1, $t1, $v0
	sb $zero, 0($t1)
	sub $t1, $t1, 1
	_continue_toString:
	div $t3, $t5
	mfhi $v1
	add $v1, $v1, 48
	sb $v1, 0($t1)
	sub $t1, $t1, 1
	mflo $t3
	bnez $t3, _continue_toString
	beqz $t0, _skip_place_neg
	li $v1, 45
	sb $v1, 0($t1)
	_skip_place_neg:
	jr $ra
	_set_zero:
	li $a0, 6
	li $v0, 9
	syscall
	li $a0, 1
	sw $a0, 0($v0)
	add $v0, $v0, 4
	li $a0, 48
	sb $a0, 0($v0)
	jr $ra
f_str.stringConcatenate:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t2, $a0
	move $t3, $a1
	lw $t0, -4($a0)
	lw $t1, -4($a1)
	add $t5, $t0, $t1
	add $a0, $t5, 5
	li $v0, 9
	syscall
	sw $t5, 0($v0)
	add $v0, $v0, 4
	move $t4, $v0
	move $a0, $t2
	move $a1, $t4
	jal _string_copy
	move $a0, $t3
	add $a1, $t4, $t0
	jal _string_copy
	move $v0, $t4
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra
_string_copy:
	_begin_string_copy:
	lb $v0, 0($a0)
	beqz $v0, _exit_string_copy
	sb $v0, 0($a1)
	add $a0, $a0, 1
	add $a1, $a1, 1
	j _begin_string_copy
	_exit_string_copy:
	sb $zero, 0($a1)
	jr $ra
f_str.substring:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	sub $t1, $a2, $a1
	add $t1, $t1, 1
	add $a0, $t1, 5
	li $v0, 9
	syscall
	sw $t1, 0($v0)
	add $v0, $v0, 4
	add $a0, $t0, $a1
	add $t2, $t0, $a2
	lb $t3, 1($t2)
	sb $zero, 1($t2)
	move $a1, $v0
	move $t4, $v0
	jal _string_copy
	move $v0, $t4
	sb $t3, 1($t2)
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra
f_str.parseInt:
	li $v0, 0
	move $t0, $a0
	li $t2, 1
	_count_number_pos:
	lb $t1, 0($t0)
	bgt $t1, 57, _begin_parse_int
	blt $t1, 48, _begin_parse_int
	add $t0, $t0, 1
	j _count_number_pos
	_begin_parse_int:
	sub $t0, $t0, 1
	_parsing_int:
	blt $t0, $a0, _finish_parse_int
	lb $t1, 0($t0)
	sub $t1, $t1, 48
	mul $t1, $t1, $t2
	add $v0, $v0, $t1
	mul $t2, $t2, 10
	sub $t0, $t0, 1
	j _parsing_int
	_finish_parse_int:
	jr $ra
f_str.ord:
	add $a0, $a0, $a1
	lb $v0, 0($a0)
	jr $ra
