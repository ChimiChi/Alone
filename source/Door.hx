package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class Door extends FlxSprite 
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.door__png, true, 64, 64);
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		this.immovable = true;
		super.update(elapsed);
		if (Global.contDoor == Global.triggerGroup.length)
		{
			FlxG.camera.shake(0.05, 2);
			kill();
		}
		FlxG.collide(Global.player, this);
		FlxG.collide(Global.tilemapActual, this);
	}
	
}