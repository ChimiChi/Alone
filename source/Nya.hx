package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.util.FlxFSM;

/**
 * ...
 * @author ...
 */

class Nya extends FlxSprite 
{
	public var fsm:FlxFSM<Nya>;
	private var directionX:Int;
	private var directionY:Int;
	var botonHorizontal:Bool = false;
	var botonVertical:Bool = false;
	
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.nyasheet__png, true, 59, 50);
		scale.set(0.8, 0.8);
		updateHitbox();
		//scale.x = 0.1;
		//updateHitbox();
		//scale.y = 1.5;
		//updateHitbox();
		//scale.x = 1.5;
		
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4, true);
		animation.add("stand", [11, 12], 4, false);
		animation.add("runX", [13, 14, 15, 16, 17], 4, true);
		animation.add("sit", [18, 19], 4, false);
		animation.add("runD", [20, 21], 4, true);
		animation.add("runU", [22, 23], 4, true);
		
		fsm = new FlxFSM<Nya>(this);
		fsm.transitions
			.add(Idle, Run, Condition.run)
			.add(Run, Idle, Condition.idle)
			.start(Idle);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		fsm.update(elapsed);
		checkMovDiagonal();
		super.update(elapsed);
	}
	
	public function mov():Void
	{
		if (FlxG.keys.pressed.LEFT && !botonVertical)
		{			
			velocity.x = -100 * FlxG.elapsed * FlxG.updateFramerate;
			animation.play("runX");
			directionX = -1;
		}
		else if (FlxG.keys.pressed.RIGHT && !botonVertical)
		{			
			velocity.x = 100 * FlxG.elapsed * FlxG.updateFramerate;
			animation.play("runX");
			directionX = 1;
		}
		else
		{
			velocity.x = 0;
			directionX = 0;
		}
		if (velocity.x != 0)
		{				
			facing = (velocity.x > 0) ? FlxObject.RIGHT : FlxObject.LEFT;
			
		}	
		if (FlxG.keys.pressed.DOWN && !botonHorizontal)
		{
			velocity.y = 100 + FlxG.elapsed * FlxG.updateFramerate;
			animation.play("runD");
			directionY = 1;
			
		}
		else if (FlxG.keys.pressed.UP && !botonHorizontal)
		{
			velocity.y = -100 + FlxG.elapsed * FlxG.updateFramerate;
			animation.play("runU");
			directionY = -1;
		}
		else 
		{
			velocity.y = 0;
			directionY = 0;
		}
		
		
		
		
	}
	
	private function checkMovDiagonal():Void
	{
		if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.LEFT)
			botonHorizontal = true;
		else
			botonHorizontal = false;
			
		if (FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN)
			botonVertical = true;
		else
			botonVertical = false;
		
	}
	
	public function getDirectionX():Int
	{
		return directionX;
	}
	
	public function getDirectionY():Int
	{
		return directionY;
	}
	
}

class Condition
{
	public static function run(Owner:Nya):Bool
	{
		return(Owner.velocity.x != 0 || Owner.velocity.y != 0); //&& Owner.animation.name == "stand" && Owner.animation.finished);
	}
	
	public static function idle(Owner:Nya):Bool
	{
		return(Owner.velocity.x == 0 && Owner.velocity.y == 0); //&& Owner.animation.name == "sit" && Owner.animation.finished);
	}
	
}

class Idle extends FlxFSMState<Nya>
	{
		override public function enter(owner:Nya, fsm:FlxFSM<Nya>):Void
		{
			owner.animation.play("idle");
		}
		
		override public function update(elapsed:Float, owner:Nya, fsm:FlxFSM<Nya>):Void 
		{
			owner.mov();
			
			//if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN)
			//{
				//owner.animation.play("stand");
			//}
			//else
			//{
				//owner.animation.play("idle");
			//}
		}
	}
	
	class Run extends FlxFSMState<Nya>
	{	
		override public function update(elapsed:Float, owner:Nya, fsm:FlxFSM<Nya>):Void
		{
			owner.mov();
			
		//if (FlxG.keys.pressed.LEFT)
		//{			
			//owner.velocity.x = -100 * FlxG.elapsed * FlxG.updateFramerate;
			//
		//}
		//else if (FlxG.keys.pressed.RIGHT)
		//{			
			//owner.velocity.x = 100 * FlxG.elapsed * FlxG.updateFramerate;
			//
		//}
		//else
		//{
			//owner.velocity.x = 0;
		//}
		//if (FlxG.keys.pressed.DOWN)
		//{
			//owner.velocity.y = 100 + FlxG.elapsed * FlxG.updateFramerate;
			//
		//}
		//else if (FlxG.keys.pressed.UP)
		//{
			//owner.velocity.y = -100 + FlxG.elapsed * FlxG.updateFramerate;
			//
		//}
		//else 
		//{
			//owner.velocity.y = 0;
		//}
		//if (owner.velocity.x != 0)
		//{				
			//owner.facing = (owner.velocity.x > 0) ? FlxObject.RIGHT : FlxObject.LEFT;
			//owner.animation.play("runX");
		//}		
		//if (owner.velocity.y > 0)
		//{
			//owner.animation.play("runD");
		//}
		//else if (owner.velocity.y < 0)
		//{
			//owner.animation.play("runU");
		//}
			
		//if (owner.velocity.x == 0 && owner.velocity.y == 0)
		//{
			//owner.animation.play("sit");
		//}
		//
		}
		
	}














