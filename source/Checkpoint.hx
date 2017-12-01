package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.effects.particles.FlxEmitter;


/**
 * ...
 * @author ...
 */
class Checkpoint extends FlxSprite 
{

	private var particulas:FlxEmitter;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.checkpoint__png, true, 64, 64);
		particulas = new FlxEmitter(x + width / 2, y + height / 2, 50);
		particulas.makeParticles(2, 2, 0xFF9bdbf5, 50);
		particulas.velocity.set(100, 100, -100, 100, 100);
		particulas.launchAngle.set(-180, 180);
		FlxG.state.add(particulas);
		particulas.start(false, 0.01);
		particulas.emitting = true;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.overlap(Global.player, this))
		{
			Global.lastPosition = getPosition();
		}
	}
}