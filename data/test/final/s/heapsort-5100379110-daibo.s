.data
.align 2
_buffer:	.space	256
	.word	1
msg_0:	.asciiz	" "
	.word	1
msg_1:	.asciiz	"\n"
var_0:	.word	0
var_1:	.word	0
.text
f_exchange:
	move $s3, $a0
	move $s5, $a1
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	lw $s2, var_1
	mul $t6, $s3, 4
	add $s2, $s2, $t6
	lw $s2, 0($s2)
	move $t6, $s2
	lw $s2, var_1
	mul $t9, $s5, 4
	add $s2, $s2, $t9
	lw $t9, 0($s2)
	lw $s2, var_1
	mul $s3, $s3, 4
	add $s3, $s2, $s3
	move $s2, $t9
	sw $s2, 0($s3)
	lw $s2, var_1
	mul $s3, $s5, 4
	add $s3, $s2, $s3
	move $s5, $t6
	sw $s5, 0($s3)
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
main:
	sub $sp, $sp, 8
	sw $ra, 0($sp)
	jal f_getString
	move $s3, $v0
	move $a0, $s3
	jal f_str.parseInt
	move $s3, $v0
	sw $s3, var_0
	lw $s3, var_0
	mul $s5, $s3, 4
	add $s5, $s5, 4
	add $a0, $zero, $s5
	li $v0, 9
	syscall
	sw $s3, 0($v0)
	add $s3, $v0, 4
	move $s2, $s3
	sw $s2, var_1
	li $s3, 0
L170:
	lw $s2, var_1
	lw $s5, -4($s2)
	slt $s5, $s3, $s5
	beq $zero, $s5, L171
	lw $s2, var_1
	mul $s5, $s3, 4
	add $s5, $s2, $s5
	move $s2, $s3
	sw $s2, 0($s5)
L172:
	add $s3, $s3, 1
	b L170
L171:
	jal f_makeHeap
	jal f_heapSort
	li $s3, 0
L173:
	lw $s2, var_1
	lw $s5, -4($s2)
	slt $s5, $s3, $s5
	beq $zero, $s5, L174
	lw $s2, var_1
	mul $s5, $s3, 4
	add $s5, $s2, $s5
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
L175:
	add $s3, $s3, 1
	b L173
L174:
	la $a0, msg_1
	li $v0, 4
	syscall
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
	b main_end
main_end:
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
f_adjustHeap:
	move $s3, $a0
	sub $sp, $sp, 4
	sw $ra, 0($sp)
	li $s5, 0
	move $t6, $s5
L159:
	mul $s5, $t6, 2
	slt $s5, $s5, $s3
	beq $zero, $s5, L160
	mul $s5, $t6, 2
	mul $s2, $t6, 2
	add $s2, $s2, 1
	slt $t9, $s2, $s3
	beq $zero, $t9, L161
	lw $s2, var_1
	mul $s0, $t6, 2
	add $s0, $s0, 1
	mul $s0, $s0, 4
	add $s2, $s2, $s0
	lw $s0, 0($s2)
	lw $s2, var_1
	mul $s7, $t6, 2
	mul $s7, $s7, 4
	add $s2, $s2, $s7
	lw $s2, 0($s2)
	slt $s2, $s0, $s2
	and $s2, $t9, $s2
	b L162
L161:
	li $s2, 0
L162:
	beq $zero, $s2, L163
	mul $s5, $t6, 2
	add $s5, $s5, 1
	b L164
L163:
L164:
	lw $s2, var_1
	mul $t9, $t6, 4
	add $s2, $s2, $t9
	lw $t9, 0($s2)
	lw $s2, var_1
	mul $s0, $s5, 4
	add $s2, $s2, $s0
	lw $s2, 0($s2)
	sgt $s2, $t9, $s2
	beq $zero, $s2, L165
	lw $s2, var_1
	mul $t9, $t6, 4
	add $s2, $s2, $t9
	lw $s2, 0($s2)
	move $t9, $s2
	lw $s2, var_1
	mul $s0, $s5, 4
	add $s2, $s2, $s0
	lw $s0, 0($s2)
	lw $s2, var_1
	mul $t6, $t6, 4
	add $s2, $s2, $t6
	move $t6, $s0
	sw $t6, 0($s2)
	lw $s2, var_1
	mul $t6, $s5, 4
	add $s2, $s2, $t6
	move $t6, $t9
	sw $t6, 0($s2)
	move $t6, $s5
	b L166
L165:
	b L160
L166:
	b L159
L160:
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
f_heapSort:
	sub $sp, $sp, 8
	sw $ra, 0($sp)
	li $s5, 0
L167:
	lw $s3, var_0
	slt $s3, $s5, $s3
	beq $zero, $s3, L168
	lw $s2, var_1
	la $s3, 0($s2)
	lw $s3, 0($s3)
	move $t6, $s3
	lw $s2, var_1
	lw $s3, var_0
	sub $s3, $s3, $s5
	sub $s3, $s3, 1
	mul $s3, $s3, 4
	add $s3, $s2, $s3
	lw $s3, 0($s3)
	lw $s2, var_1
	la $s2, 0($s2)
	sw $s3, 0($s2)
	lw $s2, var_1
	lw $s3, var_0
	sub $s3, $s3, $s5
	sub $s3, $s3, 1
	mul $s3, $s3, 4
	add $s3, $s2, $s3
	move $s2, $t6
	sw $s2, 0($s3)
	lw $s3, var_0
	sub $s3, $s3, $s5
	sub $s3, $s3, 1
	move $a0, $s3
	sw $s5, 4($sp)
	jal f_adjustHeap
	lw $s5, 4($sp)
L169:
	add $s3, $s5, 1
	move $s5, $s3
	b L167
L168:
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
f_makeHeap:
	sub $sp, $sp, 8
	sw $ra, 0($sp)
	lw $s3, var_0
	sub $s3, $s3, 1
	div $s3, $s3, 2
	move $s5, $s3
	li $t6, 0
L151:
	sge $s3, $s5, 0
	beq $zero, $s3, L152
	mul $s3, $s5, 2
	move $t6, $s3
	mul $s3, $s5, 2
	add $s2, $s3, 1
	lw $s3, var_0
	slt $s3, $s2, $s3
	beq $zero, $s3, L153
	lw $s2, var_1
	mul $t9, $s5, 2
	add $t9, $t9, 1
	mul $t9, $t9, 4
	add $s2, $s2, $t9
	lw $t9, 0($s2)
	lw $s2, var_1
	mul $s0, $s5, 2
	mul $s0, $s0, 4
	add $s2, $s2, $s0
	lw $s2, 0($s2)
	slt $s2, $t9, $s2
	and $s3, $s3, $s2
	b L154
L153:
	li $s3, 0
L154:
	beq $zero, $s3, L155
	mul $s3, $s5, 2
	add $s3, $s3, 1
	move $t6, $s3
	b L156
L155:
L156:
	lw $s2, var_1
	mul $s3, $s5, 4
	add $s3, $s2, $s3
	lw $s3, 0($s3)
	lw $s2, var_1
	mul $t9, $t6, 4
	add $s2, $s2, $t9
	lw $s2, 0($s2)
	sgt $s3, $s3, $s2
	beq $zero, $s3, L157
	move $a0, $s5
	move $a1, $t6
	sw $s5, 4($sp)
	jal f_exchange
	lw $s5, 4($sp)
	b L158
L157:
L158:
	sub $s3, $s5, 1
	move $s5, $s3
	b L151
L152:
	li $v0, 0
	lw $ra, 0($sp)
	add $sp, $sp, 8
	jr $ra
	lw $ra, 0($sp)
	add $sp, $sp, 8
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
