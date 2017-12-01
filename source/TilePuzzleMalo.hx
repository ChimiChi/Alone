package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class TilePuzzleMalo extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.tilespuzzle__png, true, 94, 94);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.overlap(Global.player, this))
		{
			Global.player.setPosition(Global.lastPosition.x, Global.lastPosition.y);
			
			for (i in Global.tileBuenoGroup)
			{
				i.setEncendido(false);
			}
			
		}
	}
	
}