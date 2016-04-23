package Rz_compiler.backend.instructions.branch_jump;

import Rz_compiler.backend.instructions.MipsInstruction;
import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.backend.operands.Operand;

/**
 * Created by YRZ on 4/23/16.
 */
public class BltInstr extends MipsInstruction implements PseudoInstruction {

    public BltInstr(Operand src1, Operand src2, Operand label) {
        super(label, src1, src2);
    }
}
