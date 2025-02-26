package;

import openfl.Lib;
import openfl.events.MouseEvent;

class Main extends Sprite{
  public static var drag:Bool;
	public var offsetX:Int;
	public var offsetY:Int;

	public function new() 
	{
		super();
    start();
		
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
	}

	function mouseDown(event:MouseEvent)
	{
   		offsetX = Std.int(event.localX);
   		offsetY = Std.int(event.localY);
	}

	function mouseMove(event:MouseEvent)
	{
	   	if (drag)
	   	{
	   		var winX = Lib.application.window.x;
	   		var winY = Lib.application.window.y;	   		

	   		Lib.application.window.move(winX + Std.int(event.localX) - offsetX, winY + Std.int(event.localY) - offsetY);
	   	}	
	}
  public function start():Void {
	#if desktop
	lime.app.Application.current.window.borderless = true;
  	#end

	#if !debug
	hl.UI.closeConsole();
	#end
    var game:FlxGame = new FlxGame(0, 0, Playstate, 60, 60, true, false);
	@:privateAccess
	    game._skipSplash = false;
    addChild(game);
  }
}
