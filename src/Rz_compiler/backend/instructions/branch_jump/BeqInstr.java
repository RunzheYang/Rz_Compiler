package Rz_compiler.backend.instructions.branch_jump;

import Rz_compiler.backend.instructions.MipsInstruction;
import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.backend.operands.Operand;

/**
 * Created by YRZ on 4/23/16.
 */
public class BeqInstr extends MipsInstruction implements PseudoInstruction {

    public BeqInstr(Operand dest, Operand src1, Operand src2) {
        super(dest, src1, src2);
    }
}
