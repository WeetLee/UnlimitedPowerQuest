package com.shutlee.games.ui;

import openfl.display.Sprite;
import openfl.events.Event;
import flash.Lib;

/**
 * ...
 * @author Florent Claisse
 */
class AutoscaleSprite extends Sprite 
{
	public var initX:Float = Lib.current.stage.stageWidth;
	public var initY:Float = Lib.current.stage.stageHeight;

	public function new() 
	{
		super();
		this.addEventListener(Event.ENTER_FRAME, _everyFrame);
	}
	
	private function _everyFrame(event:Event):Void {
		var curX:Float = Lib.current.stage.stageWidth;
		var curY:Float = Lib.current.stage.stageHeight;
		this.scaleX = curX / initX;
		this.scaleY = curY / initY;
	}
}