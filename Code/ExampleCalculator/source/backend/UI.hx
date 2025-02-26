package backend;

import flixel.util.FlxColor;
import lime.system.System;
import lime.app.Application;
import customclass.ui.SquareButton.FlxSquareButton;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.FlxG;

import backend.Math;

class UI extends FlxSubState {
    #if desktop
        var CloseButton:FlxSquareButton;
        var MinimizeButton:FlxSquareButton;
        var WindowDragSprite:FlxSprite;
        public var keepHolding:Bool = false;
    #end
    var BG:FlxUI9SliceSprite;
    var NumButtons:Array<Int> = [0,1,2,3,4,5,6,7,8,9];
                //                     0,   1, 2,   3,   4, 5,   6,   7, 8,   9
        var PositionsX:Array<Float> = [100, 0, 100, 200, 0, 100, 200, 0, 100, 200];
        var PositionsY:Array<Float> = [120, 20, 20, 20, 50, 50, 50, 80, 80, 80, 110, 110];
    var TextOutput:FlxText;
    var RealTextOutput:FlxText;
        var TextOutPutBG:FlxUI9SliceSprite;

    var FunctionButtons:Array<Int> = [0,1,2,3,4,5];
    var FunctionPosX:Array<Float> = [0, 100, 200, 300, 300, 300];
    var FunctionPosY:Array<Float> = [150, 150, 150, 150, 20, 50];

    var MATH:Math = new Math();

    public function new() {
        super();
        add(MATH);
        BG = new FlxUI9SliceSprite(0, 0, null, new Rectangle(0, 0, 400, 500));
        BG.screenCenter(XY);
        add(BG);

        #if windows
            var WindowTitle:FlxText = new FlxText(0, 5, 400, Application.current.window.title.toUpperCase());
        #end
        #if html5
            var WindowTitle:FlxText = new FlxText(BG.x, BG.y + 5, 400, Application.current.window.title.toUpperCase());
        #end
        WindowTitle.setFormat('assets/calculator.ttf', 12, FlxColor.WHITE, LEFT);
        add(WindowTitle);

        TextOutPutBG = new FlxUI9SliceSprite(BG.x + 10, BG.y + 30, FlxUIAssets.IMG_CHROME_INSET, new Rectangle(0, 0, 380, 80));
        add(TextOutPutBG);

        TextOutput = new FlxText(TextOutPutBG.x + 5, TextOutPutBG.y + 5, 0, '');
        TextOutput.setFormat('assets/calculator.ttf', 24, FlxColor.WHITE, LEFT);
        add(TextOutput);

        RealTextOutput = new FlxText(TextOutPutBG.x + 5, TextOutPutBG.y + 40, 0, 'TEST OUTPUT');
        RealTextOutput.setFormat('assets/calculator.ttf', 24, FlxColor.WHITE, LEFT);
        add(RealTextOutput);

        #if desktop
            WindowDragSprite = new FlxSprite(0, 0);
            WindowDragSprite.makeGraphic(360, 20, FlxColor.TRANSPARENT);
            add(WindowDragSprite);

            CloseButton = new FlxSquareButton(380, 0, 'X', ()->{ System.exit(0); });
            MinimizeButton = new FlxSquareButton(CloseButton.x - 20, 0, '-', ()->{ Application.current.window.minimized = true; });
            add(CloseButton);
            add(MinimizeButton);
        #end

        for(i in 0...NumButtons.length) {

            var Button:FlxButton = new FlxButton(BG.x + 10 + PositionsX[i], BG.y + 100 + PositionsY[i], '$i', ()->{ FlxG.log.add('Button Pressed, Number is $i '); MATH.AddNumberToTracker(i); });
            Button.label.font = 'assets/calculator.ttf';
            add(Button);
        }

        for (i in 0...FunctionButtons.length) {

            var FunctionButton:FlxButton = new FlxButton(BG.x + 10 + FunctionPosX[i], BG.y + 100 + FunctionPosY[i], FunctionButtonTextLabel(i), DoFunctionButtonThingy(i) );
            FunctionButton.label.font = 'assets/calculator.ttf';
            add(FunctionButton);
        }
    }
    #if windows
    override public function update(elapsed:Float) {
        super.update(elapsed);

        TextOutput.text = MATH.TrackedNumbers.toString();
        RealTextOutput.text = Std.string(MATH.StoredAwnser);

        if(FlxG.mouse.overlaps(WindowDragSprite)) {
            if(FlxG.mouse.pressed) {
                keepHolding = true;
                Main.drag = true;
            }else{
                Main.drag = false;
            }
        }else{
            if(keepHolding){
                Main.drag = true;
                if(FlxG.mouse.released){
                    keepHolding = false;
                    Main.drag = false;
                }
            }
        }
    }
    #end
    private function FunctionButtonTextLabel(Button:Int):String {
        switch(Button) {
            case 0:
                return 'ADD';
            case 1:
                return 'SUBTRACT';
            case 2:
                return 'MULTIPLY';
            case 3:
                return 'DIVIDE';
            case 4:
                return 'CALCULATE';
            case 5:
                return 'CLEAR';
            default:
                return '';
        }
    }
    public function DoFunctionButtonThingy(I:Int):Void->Void {
        switch(I) {
            case 0:
                return ()->{ FlxG.log.add('Pressed Addition Button'); MATH.TrackedNumbers.push('+'); };
            case 1:
                return ()->{ FlxG.log.add('Pressed Subtraction Button'); MATH.TrackedNumbers.push('-'); };
            case 2:
                return ()->{ FlxG.log.add('Pressed Multiplication Button'); MATH.TrackedNumbers.push('×'); };
            case 3:
                return ()->{ FlxG.log.add('Pressed Division Button'); MATH.TrackedNumbers.push('÷'); };
            case 4:
                return ()->{ FlxG.log.add('Pressed Calculation Button'); 
                for(Dynamic in MATH.TrackedNumbers) {
                    if(Std.isOfType(Dynamic, String)) {
                        switch(Dynamic) {
                            case '+':
                                MATH.Calculate('add');
                            case '-':
                                MATH.Calculate('subtract');
                            case '×':
                                MATH.Calculate('multiply');
                            case '÷':
                                MATH.Calculate('divide');
                            default:
                                MATH.Calculate('NULL');
                        };
                    };
                };
            };
            case 5:
                return ()->{ FlxG.log.add('Pressed clear Button'); MATH.clearTracker(); };
            default:
                return ()->{};
        }
    }
}
