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
enum Tipo
{
	WATER;
	WISLEUPL;
	WISLEUPR;
	WISLEDWL;
	WISLEDWR;
	WPONDUPL;
	WPONDUPR;
	WPONDDWL;
	WPONDDWR;
	WBOAT;
	WDONUT;
	
}
 
class Tiles extends FlxSprite 
{
	private var _tipo:Tipo = WATER;
	private var direction:Int;
	
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, type:Tipo) 
	{
		super(X, Y, SimpleGraphic);
		_tipo = type;
		loadGraphic(AssetPaths.tiles__png, true, 64, 64);
		animation.add("water", [0, 30], 1, true);
		animation.add("wisleupL", [45, 1], 1, true);
		animation.add("wisleupR", [46, 3], 1, true);
		animation.add("wisledwL", [47, 19], 1, true);
		animation.add("wisledwR", [48, 21], 1, true);
		animation.add("wpondupL", [49, 4], 1, true);
		animation.add("wpondupR", [50, 5], 1, true);
		animation.add("wponddwL", [51, 13], 1, true);
		animation.add("wponddwR", [52, 14], 1, true);
		animation.add("wboat", [53, 39], 1, true);
		animation.add("wdonut", [54, 40], 1, true);
		
		
		
		switch (_tipo) 
		{
			case Tipo.WATER:
				animation.play("water");
				
			case Tipo.WISLEUPL:
				animation.play("wisleupL");
				
			case Tipo.WISLEUPR:
				animation.play("wisleupR");
				
			case Tipo.WISLEDWL:
				animation.play("wisledwL");
				
			case Tipo.WISLEDWR:
				animation.play("wisledwR");
				
			case Tipo.WPONDUPL:
				animation.play("wpondupL");
				
			case Tipo.WPONDUPR:
				animation.play("wpondupR");
				
			case Tipo.WPONDDWL:
				animation.play("wponddwL");
				
			case Tipo.WPONDDWR:
				animation.play("wponddwR");
				
			case Tipo.WBOAT:
				animation.play("wboat");
				
			case Tipo.WDONUT:	
				animation.play("wdonut");
				
		}
	}
			
	
	public function getTipo():Tipo
	{
		return _tipo;
	}
	public function setDirection(dir:Int):Void
	{
		direction = dir;
		if (dir == 1)
			facing = FlxObject.RIGHT;
		else
			facing = FlxObject.LEFT;
	}
	public function getDirection():Int
	{
		return direction;
	}
}