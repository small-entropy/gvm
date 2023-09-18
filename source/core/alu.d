module core.alu;

import std.conv;
import core.stack : Stack;
import std.outbuffer : OutBuffer;
import std.bitmanip : read;

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
        auto front = ds.top();
        rs.push(front);
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

        auto res = 	first.read!uint() + second.read!uint();

        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(buffer.toBytes());
    }

    public void sub()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = 	first.read!uint() - second.read!uint();

        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(buffer.toBytes());
    }

    public void div()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = 	first.read!uint() / second.read!uint();
    
        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(buffer.toBytes());
    }

    public void mul()
    {
        auto first = rs.top();
        rs.pop();
        auto second = rs.top();
        rs.pop();

        auto res = 	first.read!uint() * second.read!uint();
    
        OutBuffer buffer = new OutBuffer();    
        buffer.write(res);

        rs.push(buffer.toBytes());
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
        auto pointer = 	bPointer.read!ushort();
        ds.jump(pointer);
        os.jump(pointer);
    }
}