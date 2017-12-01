package;
import flash.geom.Point;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author ...
 */
class Global
{
	static public var tilemapActual:FlxTilemap;
	static public var player:Nya;
	static public var lastPosition:FlxPoint;
	static public var waterGroup:FlxTypedGroup<Tiles>;
	static public var tileBuenoGroup:FlxTypedGroup<TilePuzzleBueno>;
	static public var tileMaloGroup:FlxTypedGroup<TilePuzzleMalo>;
	static public var boulderGroup:FlxTypedGroup<Boulder>;
	static public var triggerGroup:FlxTypedGroup<TriggerB>;
	static public var tilesAGroup:FlxTypedGroup<TileA>;
	static public var tilesBGroup:FlxTypedGroup<TileB>;
	static public var contDoor:Int = 0;
	static public var contEstadoA:Int = 0;
	static public var contEstadoB:Int = 0;
	
}