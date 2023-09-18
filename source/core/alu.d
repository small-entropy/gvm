module core.alu;

import std.conv;
import core.stack : Stack;
import std.outbuffer : OutBuffer;

private enum Instuction : ubyte
{
    Add = 1,
    Sub = 2,
    Mul = 3,
    Div = 4,
    Jmp = 5,
    JEq = 6,
    JNe = 7,
    JLt = 8,
    JGt = 9,
    Push = 10,
    Pop = 11,
    Dup = 12,
    Swap = 13,
    Halt = 14
}

alias ValueData = ubyte[];

public class ArithmeticLogicUnit
{
    private Stack!ubyte* os;
    private Stack!ValueData* ds;
    private Stack!ValueData* rs;

    this(Stack!ubyte* os, Stack!ValueData* ds, Stack!ValueData* rs)
    {
        this.os = os;
        this.ds = ds;
        this.rs = rs;
    }

    public void push()
    {
        front = ds.top();
        rs.push(item);
        ds.pop();
        os.pop();
    }

    public void pop()
    {
        rs.pop();
        os.pop();
    }

    public void add()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = to!int(first) + to!int(second);

        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(res);
    }

    public void sub()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = to!int(first) - to!int(second);

        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(res);
    }

    public void div()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = to!int(first) / to!int(second);
    
        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(res);
    }

    public void mul()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = to!int(first) * to!int(second);
    
        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(res);
    }

    public void swap() 
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();
        rs.push(first);
        rs.push(second);
        os.pop();
    }

    public void dup() 
    {
        auto front = rs.top();
        rs.push(front);
        os.pop();
    }

    public void jump()
    {
        auto bPointer = ds.top();
        ds.pop();
        os.pop();
        auto pointer = to!int(bPointer);
        ds.jump(pointer);
        os.jump(pointer);
    }
}