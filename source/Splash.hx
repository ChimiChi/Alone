package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class Splash extends FlxState 
{
	private var timer:Float = 0;
	override public function create():Void 
	{
		super.create();
		var fondo:FlxSprite = new FlxSprite(0, 0, AssetPaths.splash__png);
		var textoP1:FlxText = new FlxText(FlxG.camera.width / 2 - 180, 400, 0, "Ana Belén Taborcías", 32);
		textoP1.color = 0xFF9b59b6;
		add(fondo);
		add(textoP1);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += FlxG.elapsed;
		trace(timer);
		if (timer >= 6)
		{
			timer = 0;
			FlxG.switchState(new PlayState());
		}
	}
	
}