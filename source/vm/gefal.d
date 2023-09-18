module vm.gefal;

import core.stack : Stack;
import core.alu : ArithmeticLogicUnit;

alias ValueData = ubyte[];

public class GefalMachine 
{
    private Stack!ubyte os;
    private Stack!ValueData ds;
    private Stack!ValueData rs;
    private ArithmeticLogicUnit alu;

    this()
    {
        os = new Stack!ubyte();
        ds = new Stack!ValueData();
        rs = new Stack!ValueData();
        alu = new ArithmeticLogicUnit(getOperationStack(), getDataStack(), getReturnStack());
    }

    @safe public Stack!ubyte* getOperationStack() 
    {
        return &os;
    }

    @safe public Stack!ValueData* getDataStack() 
    {
        return &ds;
    }

    @safe public Stack!ValueData* getReturnStack() 
    {
        return &rs;
    }

    @safe public bool alive() 
    {
        return true;
    }
}