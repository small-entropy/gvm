module test.baster_machine;

import vm.baster : BasterMachine;

@("Создание бастер-машины")
unittest
{
    auto bm = new BasterMachine();
    assert(bm.alive());
}
