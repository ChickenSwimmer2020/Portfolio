package;

import backend.UI;

class Playstate extends FlxState {
    var UI:UI = new UI();
    public function new() {
      super();
      openSubState(UI);
    }
}
