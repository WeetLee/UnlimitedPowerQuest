package com.weetlee.ui.monsterPanel;
import com.weetlee.model.Fighter;
import com.weetlee.Main;
import com.weetlee.ui.common.FighterPanel;

/**
 * ...
 * @author Florent Claisse
 */
class MonsterPanel extends FighterPanel
{

	public function new(gameManager:Main, fighter:Fighter) 
	{
		super(gameManager, fighter);
		draw();
	}
	
	public function draw():Void {
		writeFighterInfo();
		update();
	}
}