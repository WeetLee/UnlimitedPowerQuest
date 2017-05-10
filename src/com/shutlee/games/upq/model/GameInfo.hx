package com.shutlee.games.upq.model;
import com.shutlee.games.upq.model.player.Player;

/**
 * ...
 * @author Florent Claisse
 */
class GameInfo 
{
	private var levels:Array<Level>;
	private var player:Player;

	public function new() 
	{
		levels = new Array<Level>();
	}
	
	public function getLevels():Array<Level> {
		return levels;
	}
}