module test.gefal_machine;

import vm.gefal : GefalMachine;

@("Создание гефал-машины")
unittest
{
    auto gm = new GefalMachine();
    assert(gm.alive());
}