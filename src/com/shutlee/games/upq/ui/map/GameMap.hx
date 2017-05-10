package com.shutlee.games.upq.ui.map;

import com.shutlee.games.ui.MultipartBitMapSprite;
import com.shutlee.games.upq.model.GameInfo;
import com.shutlee.games.upq.model.Level;
import flash.display.Sprite;
import openfl.events.MouseEvent;
import flash.Lib;
import com.shutlee.games.ui.BitMapSprite;
/**
 * ...
 * @author Florent Claisse
 */

class GameMap extends Sprite
{
	private var previousX:Float;
	private var previousY:Float;

	private var maxX:Float = Lib.current.stage.stageWidth;
	private var maxY:Float = Lib.current.stage.stageHeight;
	private var bgWidth:Float;
	private var bgHeight:Float;
	private var dragged:Bool = false;
	
	public function new (gameInfo:GameInfo)
	{
		super();
try {
	trace("ici");
		var background = new MultipartBitMapSprite(["assets/background3.png","assets/background3.png"],"vertical");
		bgWidth = background.width;
		bgHeight = background.height;
		trace(bgHeight);
		addChild(background);
		if (gameInfo == null) gameInfo = new GameInfo();
		for (level in gameInfo.getLevels()) {
			var sprite = createLevelSprite(level, 0);
		}
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
} catch ( e:Dynamic ) {
    trace(e);
}
	}

	private function onMouseDown(event:MouseEvent):Void {
		previousX = event.localX;
		previousY = event.localY;
		dragged = false;
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	private function onMouseUp(event:MouseEvent):Void {
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	private function onMouseMove(event:MouseEvent):Void {
		var newX = event.localX;
		var newY = event.localY;
		this.x += (newX - previousX);
		this.y += (newY - previousY);
		dragged = true;
		if (this.x >= 0) {
			this.x = 0;
		}
		if (this.y >= 0) {
			this.y = 0;
		}
		if (maxX - this.x >= bgWidth) {
			this.x = maxX - bgWidth;
		}
		if (maxY - this.y >= bgHeight) {
			this.y = maxY - bgHeight;
		}
	}

	private function onMouseClick(event:MouseEvent):Void {
		if (dragged) return;
		trace("coucou le level");
	}

	private function createLevelSprite(level:Level, playerLevelCompletion:Int):Sprite {
		var sprite = new LevelSprite(level,playerLevelCompletion);
		sprite.addEventListener(MouseEvent.CLICK, onMouseClick);
		return sprite;
	}
}