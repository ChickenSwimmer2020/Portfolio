package code;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * a simple object that when created will tween its alpha value in a pingpong style, tweening from 100% alpha, to 0% alpha, then repeating.
 * @since Version_0.1
 * @param X x position.
 * @param Y y position.
 * @param Graphic the graphic to load, easier to use since this one is a string unlike FlxGraphic
 * @param FlxGraphic the graphic to load, expects a FlxGraphic, since it needs the image.
**/
class ExampleObject extends FlxSprite {

  public function new(X:Float, Y:Float, Graphic:String, ?FlxGraphic:FlxGraphic) {
    if(FlxGraphic != null)
      super(X, Y, FlxGraphic);
    else  {
      super(X, Y);
      this.loadGraphic('assets/$Graphic');
    }
    this.alpha = 1;
  }

  override public function create()  {
    super.create();
    FlxTween.tween(this, {alpha: 0}, 0.5, { type: PINGPONG, ease: FlxEase.cubeInOut });
  }
}
