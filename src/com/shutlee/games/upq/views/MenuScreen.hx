package com.shutlee.games.upq.views;

import com.shutlee.games.ui.Button;
import openfl.display.Sprite;
import com.shutlee.games.ui.BitMapSprite;
import openfl.events.MouseEvent;
import openfl.events.Event;
import com.shutlee.games.events.PubSub;
import com.shutlee.games.upq.events.UPQEvents;
import com.shutlee.games.upq.gamestate.GameState;
import flash.Lib;

/**
 * ...
 * @author Florent Claisse
 */
class MenuScreen extends Sprite 
{

	public function new() 
	{
		super();
		var eventManager:PubSub = PubSub.getInstance();
		
		var buttonWidth:Int = 200;
		var offsetX:Int = Math.round((Lib.current.stage.stageWidth - buttonWidth)/2);
		var playButton:Button = new Button(0x33, 0x66, 0x99, "PLAY", buttonWidth, 30, 0xffffff);
		playButton.x = offsetX;
		playButton.y = 100;
		playButton.addEventListener(MouseEvent.CLICK, function(event:Event):Void {
			eventManager.send(UPQEvents.STATE_CHANGE, GameState.MAP);
		});
		this.addChild(playButton);
	}
	
}