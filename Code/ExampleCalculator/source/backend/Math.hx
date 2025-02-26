package backend;

import flixel.FlxObject;

using StringTools;

class Math extends FlxObject{

    public function new() {
        super();
        this.visible = false;
    }

    public var TrackedNumbers:Array<Dynamic> = [];

    public var StoredAwnser:Float = 0;

    public function AddNumberToTracker(Num:Float) {
        TrackedNumbers.push(Num);
        trace('Added: $Num to tracked numbers. current tracked numbers: $TrackedNumbers');
    }

    public function clearTracker() {
        TrackedNumbers = [];
        StoredAwnser = 0;
        trace('Cleared Tracked Numbers');
    }

    public function Calculate(Type:String) {
        switch(Type){
            case 'add':
                StoredAwnser = (Std.parseFloat(TrackedNumbers.toString().split('+')[0].replace(',', '').substring(1, TrackedNumbers.toString().split('+')[0].length)) + Std.parseFloat(TrackedNumbers.toString().split('+')[1].replace(',', '')) );
            case 'subtract':
                StoredAwnser = (Std.parseFloat(TrackedNumbers.toString().split('+')[0].replace(',', '').substring(1, TrackedNumbers.toString().split('-')[0].length)) - Std.parseFloat(TrackedNumbers.toString().split('-')[1].replace(',', '')) );
            case 'multiply':
                StoredAwnser = (Std.parseFloat(TrackedNumbers.toString().split('+')[0].replace(',', '').substring(1, TrackedNumbers.toString().split('×')[0].length)) * Std.parseFloat(TrackedNumbers.toString().split('×')[1].replace(',', '')) );
            case 'divide':
                StoredAwnser = (Std.parseFloat(TrackedNumbers.toString().split('+')[0].replace(',', '').substring(1, TrackedNumbers.toString().split('÷')[0].length)) / Std.parseFloat(TrackedNumbers.toString().split('÷')[1].replace(',', '')) );
            default:
                StoredAwnser = 0;
                trace('No valid math type was given, setting Stored Awnser Value to 0');
        }
    }
}
