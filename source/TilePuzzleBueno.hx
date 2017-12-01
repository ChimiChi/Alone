package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.particles.FlxEmitter;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;


/**
 * ...
 * @author ...
 */
class TilePuzzleBueno extends FlxSprite 
{
	private var encendido:Bool = false;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.tiles__png, true, 94, 94);
		
		
	}
	
	public function setEncendido(en:Bool):Void
	{
		encendido = en;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (encendido == true)
		{
			loadGraphic(AssetPaths.tilespuzzleB__png, true, 94, 94);
			
		}
		else
		{
			loadGraphic(AssetPaths.tilespuzzle__png, true, 94, 94);
			
		}
		
		
		if (FlxG.overlap(Global.player, this))
		{
			encendido = true;
		}
		
	}
	
}