package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	private var tilemap:FlxTilemap;
	private var p1:Nya;
	private var loader:FlxOgmoLoader;
	
	override public function create():Void
	{
		super.create();
		
		Global.tileBuenoGroup = new FlxTypedGroup<TilePuzzleBueno>();
		Global.tileMaloGroup = new FlxTypedGroup<TilePuzzleMalo>();
		Global.boulderGroup = new FlxTypedGroup<Boulder>();
		Global.triggerGroup = new FlxTypedGroup<TriggerB>();
		Global.waterGroup = new FlxTypedGroup<Tiles>();
		Global.tilesAGroup = new FlxTypedGroup<TileA>();
		Global.tilesBGroup = new FlxTypedGroup<TileB>();
		loader = new FlxOgmoLoader(AssetPaths.testlvl__oel);
		tilemap = loader.loadTilemap(AssetPaths.tiles__png, 64, 64, "tiles");
		for (i in 0...44)
		{
			if (i == 0 || i == 4 || i == 5 || i == 13 || i == 14 || i == 27 || i == 28 || i == 29 || i == 30 || i == 31 || i == 36 || i ==37 || i ==30 || i ==40 || i == 55 || i==56 || i == 57 || i == 58 || i == 59)
				tilemap.setTileProperties(i, FlxObject.ANY);
			else
				tilemap.setTileProperties(i, FlxObject.NONE);
		}
		add(tilemap);
		add(Global.waterGroup);
		add(Global.tileBuenoGroup);
		add(Global.tileMaloGroup);
		add(Global.triggerGroup);
		add(Global.boulderGroup);
		add(Global.tilesAGroup);
		add(Global.tilesBGroup);
		loader.loadEntities(placeEntities, "entities");
		FlxG.camera.follow(Global.player);
		Global.tilemapActual = tilemap;
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		Global.lastPosition = Global.player.getPosition();
		
		
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{	
			case "puzzleB":	
				var t = new TilePuzzleBueno(x, y);
				Global.tileBuenoGroup.add(t);
				t.kill();
			case  "puzzleM":	
				var t = new TilePuzzleMalo(x, y);
				Global.tileMaloGroup.add(t);
				t.kill();
			case "water":
				var t = new Tiles(x, y, null, Tiles.Tipo.WATER);
				Global.waterGroup.add(t);
				//t.kill();
			case "wisleupL":
				var t = new Tiles(x, y, null, Tiles.Tipo.WISLEUPL);
				Global.waterGroup.add(t);
				//t.kill();
			case "wisleupR":
				var t = new Tiles(x, y, null, Tiles.Tipo.WISLEUPR);
				Global.waterGroup.add(t);
				//t.kill();
			case "wisledwL":
				var t = new Tiles(x, y, null, Tiles.Tipo.WISLEDWL);
				Global.waterGroup.add(t);
				//t.kill();
			case "wisledwR":
				var t = new Tiles(x, y, null, Tiles.Tipo.WISLEDWR);
				Global.waterGroup.add(t);
				//t.kill();
			case "wpondupL":
				var t = new Tiles(x, y, null, Tiles.Tipo.WPONDUPL);
				Global.waterGroup.add(t);
				//t.kill();
			case "wpondupR":
				var t = new Tiles(x, y, null, Tiles.Tipo.WPONDUPR);
				Global.waterGroup.add(t);
				//t.kill();
			case "wponddwL":
				var t = new Tiles(x, y, null, Tiles.Tipo.WPONDDWL);
				Global.waterGroup.add(t);
				//t.kill();
			case "wponddwR":
				var t = new Tiles(x, y, null, Tiles.Tipo.WPONDDWR);
				Global.waterGroup.add(t);
				//t.kill();
			case "wboat":
				var t = new Tiles(x, y, null, Tiles.Tipo.WBOAT);
				Global.waterGroup.add(t);
				//t.kill();
			case "wdonut":
				var t = new Tiles(x, y, null, Tiles.Tipo.WDONUT);
				Global.waterGroup.add(t);
				//t.kill();
				
			case "player":
				Global.player = new Nya(x, y);
				add(Global.player);	
				
			case "boulder":
				var b = new Boulder(x, y);
				Global.boulderGroup.add(b);
				b.kill();
				
			case "boulderTrigger":
				var tb = new TriggerB(x, y);
				Global.triggerGroup.add(tb);
			case "door":
				var d = new Door(x, y);
				add(d);
				
			case "checkpoint":
				var c = new Checkpoint(x, y);
				add(c);
				
			case "reset":
				var r = new Reset(x, y);
				add(r);
			case "tileA":
				var a = new TileA(x, y);
				Global.tilesAGroup.add(a);
				a.kill();
			case "tileB":
				var b = new TileB(x, y);
				Global.tilesBGroup.add(b);
				b.kill();
		}
	}

	override public function update(elapsed:Float):Void
	{
		entitiesRespawn();
		FlxG.collide(tilemap, Global.player);
		super.update(elapsed);           
		
		
	}
	
	function entitiesRespawn() 
	{
		//for (entities in Global.waterGroup)
		//{
			//if (entities.isOnScreen() && !entities.alive)
				//entities.revive();
			//else if (!entities.isOnScreen() && entities.alive)
				//entities.kill();
		//}
		for (entities in Global.tileBuenoGroup)
		{
			if (entities.isOnScreen() && !entities.alive)
				entities.revive();
			else if (!entities.isOnScreen() && entities.alive)
				entities.kill();
		}
		for (entities in Global.tilesAGroup)
		{
			if (entities.isOnScreen() && !entities.alive)
				entities.revive();
			else if (!entities.isOnScreen() && entities.alive)
				entities.kill();
		}
		for (entities in Global.tileMaloGroup)
		{
			if (entities.isOnScreen() && !entities.alive)
				entities.revive();
			else if (!entities.isOnScreen() && entities.alive)
				entities.kill();
		}
		for (entities in Global.boulderGroup)
		{
			if (entities.isOnScreen() && !entities.alive)
				entities.revive();
			else if (!entities.isOnScreen() && entities.alive)
				entities.kill();
		}
		for (entities in Global.tilesBGroup)
		{
			if (entities.isOnScreen() && !entities.alive)
				entities.revive();
			else if (!entities.isOnScreen() && entities.alive)
				entities.kill();
		}
	}
}