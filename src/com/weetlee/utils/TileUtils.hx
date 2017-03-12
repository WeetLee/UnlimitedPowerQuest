package com.weetlee.utils;
import com.weetlee.ui.gamePanel.TileType;

/**
 * ...
 * @author Florent Claisse
 */
class TileUtils 
{
	public static var DROP_SPEED:Int = 4;
	public function new() 
	{
		
	}
	
	public static function getImg(type:TileType):Int {
		switch (type) {
			case ATK: return 0x0000ff;
			case DEF: return 0x00ff00;
			case LIFE: return 0xff0000;
			case ARM: return 0xbbbbbb;
			case GOLD: return 0xffff00;
			case ROCK: return 0x666666;
		}
		return 0;
	}
	public static function genType():TileType {
		var max:Int = 5;
		var rdm = Std.random(max);
		switch (rdm) {
			case 0: return ATK;
			case 1: return DEF;
			case 2: return LIFE;
			case 3: return ARM;
			case 4: return GOLD;
			case 5: return ROCK;
		}
		return null;
	}
}