package Rz_compiler.frontend.semantics.identifier;

/**
 * Created by YRZ on 3/30/16.
 */
public class VoidType extends Type {
    @Override
    public String toString() {
        return "void";
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
