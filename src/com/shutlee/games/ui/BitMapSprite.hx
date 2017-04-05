package com.shutlee.games.ui;

import flash.display.Sprite;
import flash.display.BitmapData;
import flash.Assets;
import haxe.Timer;

class BitMapSprite extends Sprite
{
	public var image:BitmapData;
	public function new (imgPath:String)
	{
		super();
		this.graphics.clear();
		image = Assets.getBitmapData(imgPath);
		this.graphics.beginBitmapFill(image);
		this.graphics.drawRect(0, 0, image.width, image.height);
	}
}