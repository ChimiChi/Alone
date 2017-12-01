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
class Boulder extends FlxSprite 
{
	private var isMoving:Bool = false;
	private var iniX:Float;
	private var iniY:Float;
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.boulder__png, true, 64, 64);
		iniX = X;
		iniY = Y;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(Global.boulderGroup, this);
		FlxG.collide(Global.tilemapActual, this);
		FlxG.overlap(Global.player, this, playerCollide);
		super.update(elapsed);
	}	
	
	private function playerCollide(p:Nya, b:Boulder):Void
	{
		if(!isMoving)
		{
			isMoving = true;
			FlxTween.tween(this, {x:x + width * Global.player.getDirectionX(), y:y + height * Global.player.getDirectionY()}, 0.5, {type:FlxTween.PERSIST, ease:FlxEase.cubeOut, onComplete:canMove});
		}
		
		p.setPosition(x + width * -Global.player.getDirectionX(), y + height * -Global.player.getDirectionY());
	}
	
	private function canMove(tween:FlxTween):Void
	{
		isMoving = false;
	}
	
	public function resetPosition():Void
	{
		setPosition(iniX, iniY);
	}
	
	
}