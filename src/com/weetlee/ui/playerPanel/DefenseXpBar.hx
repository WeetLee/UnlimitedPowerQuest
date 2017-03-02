package com.weetlee.ui.playerPanel;
import com.weetlee.Main;
import com.weetlee.model.Player;
import com.weetlee.ui.common.ProgressBar;
import com.weetlee.utils.Graphics;


/**
 * ...
 * @author Florent Claisse
 */
class DefenseXpBar extends ProgressBar
{

	public function new(gameManager:Main, player:Player) 
	{
		super(gameManager, Graphics.XP_BAR_WIDTH,Graphics.XP_BAR_HEIGHT,player.getDefenseXpMax(),Graphics.XP_BAR_DEFENSE_FILL_COLOR,Graphics.XP_BAR_DEFENSE_BG_COLOR);
	}
	
}