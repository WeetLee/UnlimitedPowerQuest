package com.weetlee.ui.playerPanel;
import com.weetlee.Main;
import com.weetlee.model.Player;
import com.weetlee.ui.common.ProgressBar;
import com.weetlee.utils.Graphics;

/**
 * ...
 * @author Florent Claisse
 */
class ArmorXpBar extends ProgressBar
{

	public function new(gameManager:Main, player:Player) 
	{
		super(gameManager, Graphics.XP_BAR_WIDTH,Graphics.XP_BAR_HEIGHT,player.getArmorXpMax(),Graphics.XP_BAR_ARMOR_FILL_COLOR,Graphics.XP_BAR_ARMOR_BG_COLOR);
	}
	
}