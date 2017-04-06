package com.shutlee.games.ui;

import openfl.display.Sprite;
import openfl.events.Event;
import flash.Lib;

/**
 * ...
 * @author Florent Claisse
 */
class AdvancedSprite extends Sprite 
{
	public var windowX = Lib.current.stage.stageWidth;
	public var windowY = Lib.current.stage.stageHeight;

	public function new() 
	{
		super();
		trace("AdvancedSprite constructor");
		this.addEventListener(Event.RESIZE,_onResize, false, 1);
		trace("AdvancedSprite constructor");
	}
	
	private function _onResize(event:Event):Void {
		windowX = Lib.current.stage.stageWidth;
		windowY = Lib.current.stage.stageHeight;
		trace(windowX);
	}
}