package;

class Main extends Sprite{
  public function new() {
    super();
    start();
  }
  public function start():Void {
    var game:FlxGame = new FlxGame(0, 0, Playstate, 60, 60, true, false);
    addChild(game);
  }
}
