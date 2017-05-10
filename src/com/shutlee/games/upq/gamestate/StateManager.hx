package com.shutlee.games.upq.gamestate;

import com.shutlee.games.upq.gamestate.GameState;
import com.shutlee.games.upq.ui.map.GameMap;
import com.shutlee.games.upq.views.LoadingScreen;
import com.shutlee.games.upq.views.MenuScreen;
import openfl.display.Sprite;

/**
 * ...
 * @author Florent Claisse
 */
class StateManager 
{
	static var self:com.shutlee.games.upq.gamestate.StateManager = null;
	var panels:Map<GameState, Sprite>;
	
	public static function getInstance():com.shutlee.games.upq.gamestate.StateManager {
		if (self == null) {
			self = new com.shutlee.games.upq.gamestate.StateManager();
		}
		return self;
	}
	
	
	private function new() 
	{
		panels = new Map<GameState, Sprite>();
	}
	
	public function get(key:GameState):Sprite {
		var panel:Sprite = panels.get(key);
		if (panel == null) {
			switch (key) {
				case MENU:
					panel = new MenuScreen();
				case LOADING:
					panel = new LoadingScreen();
				case MAP:
					panel = new GameMap(null);
				default:
					trace ("not supported yet");
			}
			panels.set(key, panel);
		}
		return panel;
	}
}