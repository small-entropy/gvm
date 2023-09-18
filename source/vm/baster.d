module vm.baster;

import std.container : DList;
import vm.gefal : GefalMachine;

public class BasterMachine {

    private DList!GefalMachine gms;

    this()
    {
        gms = DList!GefalMachine();
    }

    public bool alive() {
        return true;
    }
}