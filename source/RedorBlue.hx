package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class RedorBlue extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	} 
	
	override public function update(elapsed:Float):Void 
	{
		if (Global.contEstadoA == 72)
			loadGraphic(AssetPaths.splash__png);
		if (Global.contEstadoB == 72)
			loadGraphic(AssetPaths.splash__png);
		
		scanforRedandBlue();
		super.update(elapsed);
	}
	
	private function scanforRedandBlue():Void
	{
		for (i in Global.tilesAGroup)
		{
			if (i.getEstadoA == true)
			{
				Global.contEstadoA ++;
				trace(A);
			}
			else if (i.getEstadoB == true)
			{
				Global.contEstadoB ++;
				trace(B);
			}
		}
		
		
	}
	
	
	
}