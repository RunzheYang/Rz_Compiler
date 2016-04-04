package Rz_compiler.semantics;

import Rz_compiler.semantics.identifier.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by YRZ on 3/30/16.
 */
public class Dictionary {

    Map<String, Identifier> dictionary;

    public Dictionary() {
        dictionary = new HashMap<String, Identifier>();
    }

    public void add(String name, Identifier idf) {
        dictionary.put(name, idf);
    }

    public void rewrite(String name, Identifier idf) {
        dictionary.put(name, idf);
    }

    public Identifier lookup(String name) {
        Identifier idf =  dictionary.get(name);
        return idf;
    }
}
