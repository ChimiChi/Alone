package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class TriggerB extends FlxSprite 
{
	private var enabled:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.trigger__png, true, 64, 64);
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.overlap(Global.boulderGroup, this, boulderCollide);
		super.update(elapsed);
	}
	
	private function boulderCollide(b:Boulder, t:TriggerB):Void 
	{
		if (!enabled)
		{
			enabled = true;
			Global.contDoor ++;
		}
	}
	
	public function getEnable():Bool
	{
		return enabled;
	}
	
}