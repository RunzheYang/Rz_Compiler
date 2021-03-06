package Rz_compiler.backend.operands;

import Rz_compiler.backend.controlflow.AbstractGraph;

/**
 * Created by YRZ on 4/23/16.
 */
public class MemAddress implements Operand {

    private Register reg;
    private Integer offset = null;

    public MemAddress(Register reg, int offset) {
        this.reg = reg;
        this.offset = offset;
    }

    public Register getReg() {
        return reg;
    }

    public Integer getOffset() {
        return offset;
    }

    @Override
    public String toString() {
        return offset + "(" + reg + ")";

    }

    @Override
    public <T> T accept(OperandVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
