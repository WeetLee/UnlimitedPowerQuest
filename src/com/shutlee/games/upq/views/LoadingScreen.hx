package com.shutlee.games.upq.views;

import com.shutlee.games.ui.BitMapSprite;
import flash.Lib;
import openfl.display.Sprite;

/**
 * ...
 * @author Florent Claisse
 */
class LoadingScreen extends Sprite 
{

	public function new() 
	{
		super();
		var logo:BitMapSprite = new BitMapSprite("assets/attenteHeros.png");
		var centerX:Float = (Lib.current.stage.stageWidth - logo.image.width) / 2;
		logo.x = centerX;
		var centerY:Float = (Lib.current.stage.stageHeight - logo.image.height) / 2;
		logo.y = centerY;
		
		this.addChild(logo);
	}
	
}