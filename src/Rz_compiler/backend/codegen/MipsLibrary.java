package Rz_compiler.backend.codegen;

/**
 * Created by YRZ on 5/4/16.
 */
public class MipsLibrary {

    public String func_toString
            = "f_toString:\n\tli $t0, 0\n\tbgez $a0, _skip_set_less_than_zero\n\tli $t0, 1\n\tneg $a0, $a0\n\t_skip_set_less_than_zero:\n\tbeqz $a0, _set_zero\n\tli $t1, 0\n\tmove $t2, $a0\n\tmove $t3, $a0\n\tli $t5, 10\n\t_begin_count_digit:\n\tdiv $t2, $t5\n\tmflo $v0\n\tmfhi $v1\n\tbgtz $v0 _not_yet\n\tbgtz $v1 _not_yet\n\tj _yet\n\t_not_yet:\n\tadd $t1, $t1, 1\n\tmove $t2, $v0\n\tj _begin_count_digit\n\t_yet:\n\tbeqz $t0, _skip_reserve_neg\n\tadd $t1, $t1, 1\n\t_skip_reserve_neg:\n\tadd $a0, $t1, 5\n\tli $v0, 9\n\tsyscall\n\tsw $t1, 0($v0)\n\tadd $v0, $v0, 4\n\tadd $t1, $t1, $v0\n\tsb $zero, 0($t1)\n\tsub $t1, $t1, 1\n\t_continue_toString:\n\tdiv $t3, $t5\n\tmfhi $v1\n\tadd $v1, $v1, 48\n\tsb $v1, 0($t1)\n\tsub $t1, $t1, 1\n\tmflo $t3\n\tbnez $t3, _continue_toString\n\tbeqz $t0, _skip_place_neg\n\tli $v1, 45\n\tsb $v1, 0($t1)\n\t_skip_place_neg:\n\tjr $ra\n\t_set_zero:\n\tli $a0, 6\n\tli $v0, 9\n\tsyscall\n\tli $a0, 1\n\tsw $a0, 0($v0)\n\tadd $v0, $v0, 4\n\tli $a0, 48\n\tsb $a0, 0($v0)\n\tjr $ra";

    public String func_stringConcatenate
            = "f_str.stringConcatenate:\n\tsubu $sp, $sp, 4\n\tsw $ra, 0($sp)\n\tmove $t2, $a0\n\tmove $t3, $a1\n\tlw $t0, -4($a0)\n\tlw $t1, -4($a1)\n\tadd $t5, $t0, $t1\n\tadd $a0, $t5, 5\n\tli $v0, 9\n\tsyscall\n\tsw $t5, 0($v0)\n\tadd $v0, $v0, 4\n\tmove $t4, $v0\n\tmove $a0, $t2\n\tmove $a1, $t4\n\tjal _string_copy\n\tmove $a0, $t3\n\tadd $a1, $t4, $t0\n\tjal _string_copy\n\tmove $v0, $t4\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 4\n\tjr $ra";

    public String label_stringCopy
            = "_string_copy:\n\t_begin_string_copy:\n\tlb $v0, 0($a0)\n\tbeqz $v0, _exit_string_copy\n\tsb $v0, 0($a1)\n\tadd $a0, $a0, 1\n\tadd $a1, $a1, 1\n\tj _begin_string_copy\n\t_exit_string_copy:\n\tsb $zero, 0($a1)\n\tjr $ra";

    public String func_subString
            = "f_str.substring:\n\tsubu $sp, $sp, 4\n\tsw $ra, 0($sp)\n\tmove $t0, $a0\n\tsub $t1, $a2, $a1\n\tadd $t1, $t1, 1\n\tadd $a0, $t1, 5\n\tli $v0, 9\n\tsyscall\n\tsw $t1, 0($v0)\n\tadd $v0, $v0, 4\n\tadd $a0, $t0, $a1\n\tadd $t2, $t0, $a2\n\tlb $t3, 1($t2)\n\tsb $zero, 1($t2)\n\tmove $a1, $v0\n\tmove $t4, $v0\n\tjal _string_copy\n\tmove $v0, $t4\n\tsb $t3, 1($t2)\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 4\n\tjr $ra";

    public String func_parseInt
            = "f_str.parseInt:\n\tli $v0, 0\n\tmove $t0, $a0\n\tli $t2, 1\n\t_count_number_pos:\n\tlb $t1, 0($t0)\n\tbgt $t1, 57, _begin_parse_int\n\tblt $t1, 48, _begin_parse_int\n\tadd $t0, $t0, 1\n\tj _count_number_pos\n\t_begin_parse_int:\n\tsub $t0, $t0, 1\n\t_parsing_int:\n\tblt $t0, $a0, _finish_parse_int\n\tlb $t1, 0($t0)\n\tsub $t1, $t1, 48\n\tmul $t1, $t1, $t2\n\tadd $v0, $v0, $t1\n\tmul $t2, $t2, 10\n\tsub $t0, $t0, 1\n\tj _parsing_int\n\t_finish_parse_int:\n\tjr $ra";

    public String func_ord
            = "f_str.ord:\n\tadd $a0, $a0, $a1\n\tlb $v0, 0($a0)\n\tjr $ra";

    public String func_getString
            = "f_getString:\n\tsubu $sp, $sp, 4\n\tsw $ra, 0($sp)\n\tla $a0, _buffer\n\tli $a1, 255\n\tli $v0, 8\n\tsyscall\n\tjal _count_string_length\n\tmove $a1, $v0\n\tadd $a0, $v0, 5\n\tli $v0, 9\n\tsyscall\n\tsw $a1, 0($v0)\n\tadd $v0, $v0, 4\n\tla $a0, _buffer\n\tmove $a1, $v0\n\tmove $t0, $v0\n\tjal _string_copy\n\tmove $v0, $t0\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 4\n\tjr $ra";

    public String label_getStringLength
            = "_count_string_length:\n\tmove $v0, $a0\n\t_begin_count_string_length:\n\tlb $v1, 0($a0)\n\tbeqz $v1, _exit_count_string_length\n\tadd $a0, $a0, 1\n\tj _begin_count_string_length\n\t_exit_count_string_length:\n\tsub $v0, $a0, $v0\n\tjr $ra";

    public String func_stringCompare
            = "func__stringIsEqual:\n\tlw $v0, -4($a0)\n\tlw $v1, -4($a1)\n\tbne $v0, $v1, _not_equal\n\t_continue_compare_equal:\n\tlb $v0, 0($a0)\n\tlb $v1, 0($a1)\n\tbeqz $v0, _equal\n\tbne $v0, $v1, _not_equal\n\tadd $a0, $a0, 1\n\tadd $a1, $a1, 1\n\tj _continue_compare_equal\n\t_not_equal:\n\tli $v0, 0\n\tj _compare_final\n\t_equal:\n\tli $v0, 1\n\t_compare_final:\n\tjr $ra"
            + "\n" + "func__stringLarge:\n\tsubu $sp, $sp, 4\n\tsw $ra, 0($sp)\n\tjal func__stringLess\n\txor $v0, $v0, 1\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 4\n\tjr $ra"
            + "\n" + "func__stringLeq:\n\tsubu $sp, $sp, 12\n\tsw $ra, 0($sp)\n\tsw $a0, 4($sp)\n\tsw $a1, 8($sp)\n\tjal func__stringLess\n\tbnez $v0, _skip_compare_equal_in_Leq\n\tlw $a0, 4($sp)\n\tlw $a1, 8($sp)\n\tjal func__stringIsEqual\n\t_skip_compare_equal_in_Leq:\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 12\n\tjr $ra"
            + "\n" + "func__stringGeq:\n\tsubu $sp, $sp, 12\n\tsw $ra, 0($sp)\n\tsw $a0, 4($sp)\n\tsw $a1, 8($sp)\n\tjal func__stringLess\n\tbeqz $v0, _skip_compare_equal_in_Geq\n\tlw $a0, 4($sp)\n\tlw $a1, 8($sp)\n\tjal func__stringIsEqual\n\txor $v0, $v0, 1\n\t_skip_compare_equal_in_Geq:\n\txor $v0, $v0, 1\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 12\n\tjr $ra"
            + "\n" + "func__stringLess:\n\t_begin_compare_less:\n\tlb $v0, 0($a0)\n\tlb $v1, 0($a1)\n\tblt $v0, $v1, _less_correct\n\tbgt $v0, $v1, _less_false\n\tbeqz $v0, _less_false\n\tadd $a0, $a0, 1\n\tadd $a1, $a1, 1\n\tj _begin_compare_less\n\t_less_correct:\n\tli $v0, 1\n\tj _less_compare_final\n\t_less_false:\n\tli $v0, 0\n\t_less_compare_final:\n\tjr $ra"
            + "\n" + "func__stringNeq:\n\tsubu $sp, $sp, 4\n\tsw $ra, 0($sp)\n\tjal func__stringIsEqual\n\txor $v0, $v0, 1\n\tlw $ra, 0($sp)\n\taddu $sp, $sp, 4\n\tjr $ra";
}
