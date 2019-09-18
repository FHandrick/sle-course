module lang::fsm::Visualization

import lang::fsm::AbstractSyntax;
import IO;

@doc { To test, use: https://dreampuf.github.io/GraphvizOnline}
public str toDot(StateMachine fsm) {
	str g = "digraph g{ \n";
	
	top-down visit(fsm){
		case startState(str name): g = g + "<name> [label=\"<name>\"]\n";
		case state(str name): g = g + "<name> [label=\"<name>\"]\n";
		case transition(State source, Event event, State target): g = g + "<source.name> -\> <target.name> [label = \"<event.evt>\"]\n";
	}
	
	g = g + "}\n";
	println(g);
	return "";
	
}