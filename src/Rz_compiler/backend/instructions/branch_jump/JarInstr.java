package Rz_compiler.backend.instructions.branch_jump;

import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.backend.operands.Label;

/**
 * Created by YRZ on 4/23/16.
 */
public class JarInstr implements PseudoInstruction {

    private Label label;

    public JarInstr(Label label) {
        this.label = label;
    }
}
