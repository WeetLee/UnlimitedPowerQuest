package com.weetlee.model;
import com.weetlee.model.Fighter;
import com.weetlee.Main;
import com.weetlee.ui.gamePanel.TileType;
import haxe.Log;

/**
 * ...
 * @author Florent Claisse
 */
class Player extends Fighter 
{
	public var lifeXp:Int;
	public var attackXp:Int;
	public var defenseXp:Int;
	public var armorXp:Int;
	
	public function new(gameManager:Main) 
	{
		super(gameManager, "WeetLee", 100, 100, 10, 5, 20, 4);
		lifeXp = 0;
		attackXp = 0;
		defenseXp = 0;
		armorXp = 0;
	}
	
	public function getLifeXpMax():Int {
		return maxLife * 3;
	}
	public function getAttackXpMax():Int {
		return attack * 20;
	}
	public function getDefenseXpMax():Int {
		return defense * 50;
	}
	public function getArmorXpMax():Int {
		return armorGrowth * 100;
	}
	public function pop(type:TileType, value:Int):Void {
		switch (type) {
			case ATK: {
				attackXp += value;
				this.attackTarget(gameManager.getMonster());
			}
			case DEF: defenseXp += value;
			case LIFE: lifeXp += value;
			case ARM: armorXp += value;
			default: {};
		}
		gameManager.update();
	}
}