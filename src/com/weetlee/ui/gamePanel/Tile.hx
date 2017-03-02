package com.weetlee.ui.gamePanel;
import haxe.Log;
import openfl.display.Sprite;
import com.weetlee.utils.Graphics;
import com.weetlee.utils.TileUtils;

/**
 * ...
 * @author Florent Claisse
 */
class Tile extends Sprite
{
	private var color:Int;
	private var type:TileType;
	public var tagged:Bool = false;
	public var dropping:Bool = false;

	public function new(x:Int, y:Int, type:TileType) 
	{
		super();
		this.x = x;
		this.y = y;
		this.type = type;
		this.color = TileUtils.getImg(type);
		draw();
	}
	
	public function draw():Void {
		this.graphics.clear();
		this.graphics.beginFill(0x000);
		this.graphics.drawRect(0, 0, Graphics.TILE_SIZE, Graphics.TILE_SIZE);
		this.graphics.beginFill(color);
		this.graphics.drawRect(1, 1, Graphics.TILE_SIZE-2, Graphics.TILE_SIZE-2);
		this.graphics.endFill();
	}
	
	public function getType():TileType {
		return this.type;
	}
}