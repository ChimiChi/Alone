package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class TileA extends FlxSprite 
{
	private var estadoA:Bool = true;
	private var estadoB:Bool = false;
	private var choca:Bool = false;
	private var changedState:Bool = false;
	private var rand:FlxRandom = new FlxRandom();
	private var whichColor:Bool = false;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		var num:Int = rand.int(1, 10);
		if (num > 5)
		{
			estadoA;
		}	
		else 
		{
			estadoB;
		}	
		
		if (estadoA == true)
			loadGraphic(AssetPaths.tilespuzzleB__png, 94, 94);
		if (estadoB == true)
			loadGraphic(AssetPaths.tilespuzzle__png, 94, 94);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.overlap(Global.player, this))
		{
			choca = true;
			
		}	
		else
		{
			choca = false;
			changedState = true;
		}
		switchState();
		super.update(elapsed);	
		
		
		if (Global.contEstadoA == 72 && Global.contEstadoB == 0)
		{
			loadGraphic(AssetPaths.splash__png, 640, 480);
		}
		else if (Global.contEstadoB == 72 && Global.contEstadoA == 0)
		{
			loadGraphic(AssetPaths.splash__png, 640, 480);
		}
	}
	
	private function switchState():Void
	{
		
		if(choca == true) 
		{
			if ( estadoA == true && changedState == true)
			{	
				loadGraphic(AssetPaths.tilespuzzle__png, 94, 94);
				estadoB = true;
				Global.contEstadoB ++;
				estadoA = false;
				changedState = false;
				
				
			}
		
			else if (estadoB == true && changedState == true)
			{
				loadGraphic(AssetPaths.tilespuzzleB__png, 94, 94);
				estadoA = true;
				Global.contEstadoA ++;
				estadoB = false;
				changedState = false;
			}
		}	
	}

	
	
}