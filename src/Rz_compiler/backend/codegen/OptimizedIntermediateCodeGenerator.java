package Rz_compiler.backend.codegen;

import Rz_compiler.backend.instructions.PseudoInstruction;
import Rz_compiler.frontend.syntax.RzParser;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.Deque;
import java.util.concurrent.Callable;

/**
 * Created by YRZ on 4/21/16.
 */
public class OptimizedIntermediateCodeGenerator implements Callable<Deque<PseudoInstruction>> {

    private final ParseTree ctx;
    private final int optLevel;

    public OptimizedIntermediateCodeGenerator(ParseTree ctx, int optLevel) {
        this.ctx = ctx;
        this.optLevel = optLevel;
    }

    @Override
    public Deque<PseudoInstruction> call() throws Exception {
        IntermediateCodeGenerator visitor = new IntermediateCodeGenerator();
        Deque<PseudoInstruction> intermediateCode = ctx.accept(visitor);

        // TODO: doOptimization(intermediateCode, optLevel);

        return intermediateCode;
    }
}