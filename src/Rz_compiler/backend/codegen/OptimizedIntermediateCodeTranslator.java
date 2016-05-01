package Rz_compiler.backend.codegen;

import Rz_compiler.backend.allocation.TemporaryRegisterGenerator;
import Rz_compiler.backend.instructions.AssemblerDirective;
import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.backend.instructions.Syscall;
import Rz_compiler.backend.instructions.arithmetic_logic.*;
import Rz_compiler.backend.instructions.branch_jump.BInstr;
import Rz_compiler.backend.instructions.branch_jump.BeqInstr;
import Rz_compiler.backend.instructions.branch_jump.BneInstr;
import Rz_compiler.backend.instructions.branch_jump.JarInstr;
import Rz_compiler.backend.instructions.comparison.*;
import Rz_compiler.backend.instructions.load_store_move.*;
import Rz_compiler.backend.operands.Label;
import Rz_compiler.frontend.semantics.SymbolTable;
import com.sun.javafx.binding.StringFormatter;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.Deque;
import java.util.Map;
import java.util.concurrent.Callable;

/**
 * Created by YRZ on 4/21/16.
 */
public class OptimizedIntermediateCodeTranslator implements Callable<Deque<PseudoInstruction>> {

    private final ParseTree ctx;
    private final int optLevel;

    private SymbolTable symbolTable;

    private Map<String, String> stringDic;

    public OptimizedIntermediateCodeTranslator(ParseTree ctx, SymbolTable symbolTable,
                                               Map<String, String> stringDic, int optLevel) {
        this.ctx = ctx;
        this.symbolTable = symbolTable;
        this.stringDic = stringDic;
        this.optLevel = optLevel;
    }

    @Override
    public Deque<PseudoInstruction> call() throws Exception {
        IntermediateCodeTranslator visitor = new IntermediateCodeTranslator(symbolTable, stringDic);
        Deque<PseudoInstruction> intermediateCode = null;
        try {
            intermediateCode = ctx.accept(visitor);
        } catch (Exception err) {
            err.printStackTrace();
//            System.err.println(err.getMessage());
        }

        // TODO: doOptimization(intermediateCode, optLevel);

        return intermediateCode;
    }

    public Pair<Deque<PseudoInstruction>, Deque<PseudoInstruction>> predata() {
        Pair<Deque<PseudoInstruction>, Deque<PseudoInstruction>> preList = null;
        PreIntermediateCodeTranslator visitor = new PreIntermediateCodeTranslator(symbolTable, stringDic);
        try {
            preList = ctx.accept(visitor);
        } catch (Exception err) {
            err.printStackTrace();
//            System.err.println(err.getMessage());
        }
        return preList;
    }
}
