package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/Alone.oep", "assets/data/Alone.oep");
			type.set ("assets/data/Alone.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/testlvl.oel", "assets/data/testlvl.oel");
			type.set ("assets/data/testlvl.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/boulder.png", "assets/images/boulder.png");
			type.set ("assets/images/boulder.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/checkpoint.png", "assets/images/checkpoint.png");
			type.set ("assets/images/checkpoint.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/door.png", "assets/images/door.png");
			type.set ("assets/images/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/nyasheet.png", "assets/images/nyasheet.png");
			type.set ("assets/images/nyasheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/reset.png", "assets/images/reset.png");
			type.set ("assets/images/reset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/splash.png", "assets/images/splash.png");
			type.set ("assets/images/splash.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilespuzzle.png", "assets/images/tilespuzzle.png");
			type.set ("assets/images/tilespuzzle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilespuzzleB.png", "assets/images/tilespuzzleB.png");
			type.set ("assets/images/tilespuzzleB.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/trigger.png", "assets/images/trigger.png");
			type.set ("assets/images/trigger.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
