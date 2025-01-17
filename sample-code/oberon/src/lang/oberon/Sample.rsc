module lang::oberon::Sample

import lang::oberon::AST;
import lang::oberon::Interpreter;
import lang::util::Stack;
import lang::oberon::ExecutionContext;

Variable var = variable("x",TInt());
Variable varB = variable("y",TBool());
Statement attrib1 = Assignment("x", IntValue(0));
Statement stmt = Print(VarRef("x"));
Statement stmt2 = Print(VarRef("y"));
Expression exp = Lt(VarRef("x"),IntValue(10));
Statement attrib2 = Assignment("x",Invoke("inc", [VarRef("x")]));
Statement whileBlk = BlockStmt([stmt, stmt2, attrib2]);
Statement whileStmt = WhileStmt(exp,whileBlk);
Statement mainBlock = BlockStmt([attrib1, whileStmt]);

// inc(x : int) { return x + 1; }
Expression returnExp = Add(VarRef("z"), IntValue(1));
Expression returnExp2 = Add(VarRef("z"), VarRef("y"));
Statement retStmt = Return(returnExp);
Statement retStmt2 = Return(returnExp2);
FDecl f = FDecl(TInt(),"inc", [Parameter("z", TInt())], retStmt);
FDecl f2 = FDecl(TInt(),"inc2", [Parameter("z", TInt()),Parameter("y", TInt())], retStmt2);
public OberonProgram prg = program([var,varB], [f,f2], mainBlock);