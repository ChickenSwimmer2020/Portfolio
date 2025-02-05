package code;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ExampleState extends FlxState {

  var TestSprite:FlxSprite;
  var Counter:FlxText;
  var CountTimer:Int;

  public function new(?PassThroughData:Dynamic) {
    super();
    if(PassthroughData != null)
      trace(PassThroughData);
  }

  override public function create() {
    super.create();
    TestSprite = new FlxSprite(0, 0).makeGraphic(50, 50, FlxColor.WHITE);
    add(TestSprite);
    TestSprite.screenCenter(XY);

    Counter = new FlxText(0, 0, 0, "", true);
    Counter.setFormat(null, 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT);
  }

  override public function update(elapsed:Float) {
    super.update(elapsed);
    CountTime++;
    Counter.text = "Value: + $CountTime";
  }
}
