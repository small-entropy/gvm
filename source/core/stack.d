module core.stack;

import std.stdio : writeln;
import std.array : appender;
import std.algorithm : remove;

public class Stack(T)
{
  private T[] items;
  private int pointer;
 
  @safe public bool isEmpty() pure
  {
    return items.length == 0;
  }

  @safe public void push(T data) 
  {
    auto app = appender(items);
    app.put(data);
    items = app.data;

    if (size() == 1) 
    {
      pointer = 0;
    }

    if (size() > 1) 
    {
      pointer++;
    }
  }

  @safe public void pop()
  {
    auto isEmpty = isEmpty();
  
    if (!isEmpty) {
      items = remove(items, pointer);
      pointer--;
    } else {
      throw new Exception("Stack is empty");
    }
  }

  @safe public T top() 
  {
    auto isEmpty = isEmpty();

    if (isEmpty) 
    {
      throw new Exception("Stack is empty");
    } else {
      return this.items[this.pointer];
    }
  }

  @safe public void jump(int count) 
  {
    auto isEmpty = isEmpty();

    if (isEmpty) 
    {
      throw new Exception("Stack is empty");
    } else {
      pointer += count;
    }
  }

  @safe public void print()
  {
    auto i = 0;
    foreach (T item; items)
    {
      writeln("Element: ", i, item);
      i++;
    }
  }

  @safe public ulong size()
  {
    return items.length;
  }

  @safe public int getPointer() 
  {
    return pointer;
  }
}