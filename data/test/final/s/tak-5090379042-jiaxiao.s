.data
.align 2
_buffer:	.space	256
	.word	1
msg_0:	.asciiz	"\n"
.text
main:
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	li $v0, 5
	syscall
	move $s3, $v0
	li $v0, 5
	syscall
	move $s5, $v0
	li $v0, 5
	syscall
	move $s2, $v0
	move $a0, $s3
	move $a1, $s5
	move $a2, $s2
	jal f_tak
	move $s3, $v0
	move $a0, $s3
	jal f_toString
	move $s3, $v0
	move $a0, $s3
	li $v0, 4
	syscall
	la $a0, msg_0
	li $v0, 4
	syscall
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	b main_end
main_end:
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
f_tak:
	sub $sp, $sp, 24
	sw $ra, 0($sp)
	move $s3, $a0
	move $s5, $a1
	move $s2, $a2
	slt $t6, $s5, $s3
	beq $zero, $t6, L471
	sub $t6, $s3, 1
	move $a0, $t6
	move $a1, $s5
	move $a2, $s2
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	jal f_tak
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	move $t6, $v0
	sub $t9, $s5, 1
	move $a0, $t9
	move $a1, $s2
	move $a2, $s3
	sw $s3, 4($sp)
	sw $s5, 8($sp)
	sw $s2, 12($sp)
	sw $t6, 16($sp)
	jal f_tak
	lw $s3, 4($sp)
	lw $s5, 8($sp)
	lw $s2, 12($sp)
	lw $t6, 16($sp)
	move $t9, $v0
	sub $s2, $s2, 1
	move $a0, $s2
	move $a1, $s3
	move $a2, $s5
	sw $t6, 16($sp)
	sw $t9, 20($sp)
	jal f_tak
	lw $t6, 16($sp)
	lw $t9, 20($sp)
	move $s3, $v0
	move $a0, $t6
	move $a1, $t9
	move $a2, $s3
	jal f_tak
	move $s3, $v0
	add $s3, $s3, 1
	move $v0, $s3
	lw $ra, 0($sp)
	add $sp, $sp, 24
	jr $ra
	b L472
L471:
	move $v0, $s2
	lw $ra, 0($sp)
	add $sp, $sp, 24
	jr $ra
L472:
	lw $ra, 0($sp)
	add $sp, $sp, 24
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
f_getString:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, _buffer
	li $a1, 255
	li $v0, 8
	syscall
	jal _count_string_length
	move $a1, $v0
	add $a0, $v0, 5
	li $v0, 9
	syscall
	sw $a1, 0($v0)
	add $v0, $v0, 4
	la $a0, _buffer
	move $a1, $v0
	move $t0, $v0
	jal _string_copy
	move $v0, $t0
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra
_count_string_length:
	move $v0, $a0
	_begin_count_string_length:
	lb $v1, 0($a0)
	beqz $v1, _exit_count_string_length
	add $a0, $a0, 1
	j _begin_count_string_length
	_exit_count_string_length:
	sub $v0, $a0, $v0
	jr $ra
func__stringIsEqual:
	lw $v0, -4($a0)
	lw $v1, -4($a1)
	bne $v0, $v1, _not_equal
	_continue_compare_equal:
	lb $v0, 0($a0)
	lb $v1, 0($a1)
	beqz $v0, _equal
	bne $v0, $v1, _not_equal
	add $a0, $a0, 1
	add $a1, $a1, 1
	j _continue_compare_equal
	_not_equal:
	li $v0, 0
	j _compare_final
	_equal:
	li $v0, 1
	_compare_final:
	jr $ra
func__stringLarge:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	jal func__stringLess
	xor $v0, $v0, 1
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra
func__stringLeq:
	subu $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	jal func__stringLess
	bnez $v0, _skip_compare_equal_in_Leq
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	jal func__stringIsEqual
	_skip_compare_equal_in_Leq:
	lw $ra, 0($sp)
	addu $sp, $sp, 12
	jr $ra
func__stringGeq:
	subu $sp, $sp, 12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	jal func__stringLess
	beqz $v0, _skip_compare_equal_in_Geq
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	jal func__stringIsEqual
	xor $v0, $v0, 1
	_skip_compare_equal_in_Geq:
	xor $v0, $v0, 1
	lw $ra, 0($sp)
	addu $sp, $sp, 12
	jr $ra
func__stringLess:
	_begin_compare_less:
	lb $v0, 0($a0)
	lb $v1, 0($a1)
	blt $v0, $v1, _less_correct
	bgt $v0, $v1, _less_false
	beqz $v0, _less_false
	add $a0, $a0, 1
	add $a1, $a1, 1
	j _begin_compare_less
	_less_correct:
	li $v0, 1
	j _less_compare_final
	_less_false:
	li $v0, 0
	_less_compare_final:
	jr $ra
func__stringNeq:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	jal func__stringIsEqual
	xor $v0, $v0, 1
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra
