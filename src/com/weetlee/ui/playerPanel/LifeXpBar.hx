package com.weetlee.ui.playerPanel;
import com.weetlee.Main;
import com.weetlee.model.Player;
import com.weetlee.ui.common.ProgressBar;
import com.weetlee.utils.Graphics;


/**
 * ...
 * @author Florent Claisse
 */
class LifeXpBar extends ProgressBar
{

	public function new(gameManager:Main, player:Player) 
	{
		super(gameManager, Graphics.XP_BAR_WIDTH,Graphics.XP_BAR_HEIGHT,player.getLifeXpMax(),Graphics.XP_BAR_LIFE_FILL_COLOR,Graphics.XP_BAR_LIFE_BG_COLOR);
	}
	
}