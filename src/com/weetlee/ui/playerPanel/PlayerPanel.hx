package com.weetlee.ui.playerPanel;
import com.weetlee.Main;
import com.weetlee.ui.common.FighterPanel;
import haxe.Log;
import openfl.display.Sprite;
import com.weetlee.model.Player;
import com.weetlee.utils.Graphics;
import openfl.text.TextField;
import com.weetlee.ui.gamePanel.TileType;
/**
 * ...
 * @author Florent Claisse
 */
class PlayerPanel extends FighterPanel
{
	private var player:Player;
	
	private var lifeBar:LifeXpBar;
	private var attackBar:AttackXpBar;
	private var defenseBar:DefenseXpBar;
	private var armorBar:ArmorXpBar;

	public function new(gameManager:Main, player:Player) 
	{
		super(gameManager, player);
		this.player = player;
		draw();
	}
	
	public function draw():Void {
		writeFighterInfo();
		drawBars();
		update();
	}
	
	
	public function drawBars():Void {
		armorBar = new ArmorXpBar(gameManager, player);
		armorBar.x = 175;
		armorBar.y = 115;
		this.addChild(armorBar);
		attackBar = new AttackXpBar(gameManager, player);
		attackBar.x = 175;
		attackBar.y = 65;
		this.addChild(attackBar);
		lifeBar = new LifeXpBar(gameManager, player);
		lifeBar.x = 175;
		lifeBar.y = 40;
		this.addChild(lifeBar);
		defenseBar = new DefenseXpBar(gameManager, player);
		defenseBar.x = 175;
		defenseBar.y = 90;
		this.addChild(defenseBar);
	}
	
	override public function update():Void {
		super.update();		
		lifeBar.setCurrent(player.lifeXp);
		lifeBar.setMax(player.getLifeXpMax());
		attackBar.setCurrent(player.attackXp);
		attackBar.setMax(player.getAttackXpMax());
		defenseBar.setCurrent(player.defenseXp);
		defenseBar.setMax(player.getDefenseXpMax());
		armorBar.setCurrent(player.armorXp);
		armorBar.setMax(player.getArmorXpMax());
	}
}