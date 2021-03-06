package Rz_compiler.frontend.semantics;

import Rz_compiler.frontend.semantics.identifier.Identifier;

/**
 * Created by YRZ on 3/30/16.
 */
public class SymbolTable implements Cloneable {
    private SymbolTable parent;
    private Dictionary dict;

    public SymbolTable() {
        parent = null;
        dict = new Dictionary();
    }

    public SymbolTable(SymbolTable symt) {
        parent = symt;
        dict = new Dictionary();
    }

    public void add(String name, Identifier idf) {
        dict.add(name, idf);
    }

    public void rewrite(String name, Identifier idf) {
        dict.rewrite(name, idf);
    }

    public Identifier scope_lookup(String name) {
        return dict.lookup(name);
    }

    public SymbolTable getParent() {
        return parent;
    }

    public void repalceParent(SymbolTable parent) {
        this.parent = parent;
    }

    public Identifier lookup(String name) {
        SymbolTable symt = this;
        while (symt != null) {
            Identifier idf = symt.scope_lookup(name);
            if (idf != null) {
                return idf;
            } else {
                symt = symt.parent;
            }
        }
        return null;
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        SymbolTable o = (SymbolTable) super.clone();
        o.parent = null;
        if (parent != null) {
            o.parent = (SymbolTable) parent.clone();
        }
        o.dict = (Dictionary) dict.clone();
        return o;
    }
}
