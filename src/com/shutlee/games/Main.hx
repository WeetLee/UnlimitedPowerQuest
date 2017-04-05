package com.shutlee.games;

import com.shutlee.games.upq.gamestate.GameState;
import com.shutlee.games.upq.gamestate.StateManager;
import openfl.display.Sprite;
import openfl.Lib;
import com.shutlee.games.events.PubSub;
import com.shutlee.games.upq.events.UPQEvents;

/**
 * ...
 * @author Florent Claisse
 */
class Main extends Sprite 
{
	var stateManager:StateManager;

	public function new() 
	{
		super();
		var eventManager:PubSub = PubSub.getInstance();
		stateManager = com.shutlee.games.upq.gamestate.StateManager.getInstance();
		eventManager.listen(UPQEvents.STATE_CHANGE, onStateChange);	
		
		eventManager.send(UPQEvents.STATE_CHANGE, GameState.MENU);
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
