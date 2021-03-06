package Rz_compiler.backend.instructions.branch_jump;

import Rz_compiler.backend.instructions.MipsInstruction;
import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.backend.instructions.visitors.InstructionVisitor;
import Rz_compiler.backend.operands.Label;
import Rz_compiler.backend.operands.Operand;

/**
 * Created by YRZ on 4/23/16.
 */
public class BInstr implements PseudoInstruction {

    private Label label;

    public BInstr(Label label) {
        this.label = label;
    }

    public Label getLabel() {
        return label;
    }

    @Override
    public <T> T accept(InstructionVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
