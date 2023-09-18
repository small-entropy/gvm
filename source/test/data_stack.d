module test.data_stack;

import core.stack : Stack;
import std.stdio : writeln;


 @("NEW: Создание стека")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  assert(stack);
}

@("PUSH: Добавление в стек")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte[] element = [1];
  stack.push(element);
  assert(0 == stack.getPointer());
  stack.push(element);
  assert(1 == stack.getPointer());
  stack.push(element);
  assert(2 == stack.getPointer());
  assert(3 == stack.size());
}

@("POP: Удаление из стека")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem = 1;
  byte[] element = [elem];
  stack.push(element);
  assert(1 == stack.size());
  assert(0 == stack.getPointer());
  stack.pop();
  assert(0 == stack.size());
}

@("TOP: Получение верхушки стека")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem00 = 1;
  byte elem01 = 2;
  byte[] element00 = [elem00];
  byte[] elemtnt01 = [elem01];
  stack.push(element00);
  stack.push(elemtnt01);
  auto fromStack = stack.top();
  assert(fromStack == elemtnt01);
}

@("SIZE: Получение длины стека")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem00 = 1;
  byte elem01 = 2;
  byte[] element00 = [elem00];
  byte[] elemtnt01 = [elem01];
  stack.push(element00);
  stack.push(elemtnt01);
  auto size = stack.size();
  assert(2 == size);
}

@("POINTER: Получение индекса текущей вершины")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem00 = 1;
  byte elem01 = 2;
  byte[] element00 = [elem00];
  byte[] elemtnt01 = [elem01];
  stack.push(element00);
  stack.push(elemtnt01);
  auto pointer = stack.getPointer();
  assert(1 == pointer);
}

@("JUMP: Прыжок по стеку")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem00 = 1;
  byte elem01 = 2;
  byte[] element00 = [elem00];
  byte[] elemtnt01 = [elem01];
  stack.push(element00);
  stack.push(elemtnt01);
  stack.jump(-1);
  auto pointer = stack.getPointer();
  assert(0 == pointer);
}

@("IS_EMPTY: Проверка стека на пустоту (истина)")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  auto isEmpty = stack.isEmpty();
  assert(isEmpty);
}

@("IS_EMPTY: Проверка стека на пустоту (ложь)")
unittest
{
  alias StackData = byte[];
  auto stack = new Stack!StackData();
  byte elem = 1;
  byte[] element = [elem];
  stack.push(element);
  auto isEmpty = stack.isEmpty();
  assert(isEmpty == false);
}