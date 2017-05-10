package com.shutlee.games.ui;
import openfl.display.Sprite;

/**
 * ...
 * @author Florent Claisse
 */
class MultipartBitMapSprite extends Sprite
{

	public function new(imgPaths:Array<String>, axe:String = "horizontal") 
	{
		var image:BitMapSprite;
		var offset:Float = 0;
		super();
		this.graphics.clear();
		for (path in imgPaths) {
			image = new BitMapSprite(path);
			switch(axe) {
				case "horizontal":
					image.x = offset;
					offset += image.width;
				case "vertical":
					image.y = offset;
					offset += image.height;
			}
			addChild(image);
		}
		
	}
	
}