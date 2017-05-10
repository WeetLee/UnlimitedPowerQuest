package com.shutlee.games;

import com.shutlee.games.upq.gamestate.GameState;
import com.shutlee.games.upq.gamestate.StateManager;
import com.shutlee.games.upq.model.player.Player;
import openfl.display.Sprite;
import openfl.Lib;
import com.shutlee.games.events.PubSub;
import com.shutlee.games.upq.events.UPQEvents;
import com.shutlee.games.ui.AutoscaleSprite;
import openfl.net.SharedObject;
import flash.Assets;
import haxe.Json;

/**
 * ...
 * @author Florent Claisse
 */
class Main extends AutoscaleSprite 
{
	private var stateManager:StateManager;
	private var localInfo:SharedObject;

	public function new() 
	{
		super();
		localInfo = SharedObject.getLocal("test");
		trace(localInfo.data);
		localInfo.data.profile1 = new Player();
		localInfo.flush();
		
		
		
		var eventManager:PubSub = PubSub.getInstance();
		stateManager = com.shutlee.games.upq.gamestate.StateManager.getInstance();
		eventManager.listen(UPQEvents.STATE_CHANGE, onStateChange);	
		
		eventManager.send(UPQEvents.STATE_CHANGE, GameState.MENU);
		var test:String = Assets.getText("data/levels.json");
		try {
		trace(Json.parse(test));
		}
		catch (e:Dynamic) trace(e);
	}

	
	public function onStateChange(newState:GameState):Void {
		this.removeChildren();
		this.addChild(stateManager.get(GameState.LOADING));
		
		var panel:Sprite = stateManager.get(newState);
		if (panel != null) {
			this.removeChildren();
			this.addChild(panel);
		}
	}
}
