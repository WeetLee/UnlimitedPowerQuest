package com.weetlee.model;
import com.weetlee.Main;

/**
 * ...
 * @author Florent Claisse
 */
class Fighter 
{
	public var name:String;
	public var curLife:Int;
	public var maxLife:Int;
	
	public var attack:Int;
	public var defense:Int;
	public var armor:Int;
	public var armorGrowth:Int;
	
	private var gameManager:Main;
	
	public function new(gameManager:Main, name:String, curLife:Int, maxLife:Int, attack:Int, defense:Int, armor:Int, armorGrowth:Int) 
	{
		this.gameManager = gameManager;
		this.name = name;
		this.curLife = curLife;
		this.maxLife = maxLife;
		this.attack = attack;
		this.defense = defense;
		this.armor = armor;
		this.armorGrowth = armorGrowth;
	}
	
	
	public function attackTarget(target:Fighter) {
		//calculate damage
		var damage = this.attack - target.defense;
		damage = damage > 0 ? damage : 1;
		trace(damage);
		//apply damage
		if (damage > target.armor) {
			damage -= target.armor;
			target.armor = 0;
			target.curLife -= damage;
		}
		else {
			target.armor -= damage;
		}
		//is dead?
		if (target.curLife <= 0) {
			target.die();
		}
	}
	
	public function die() {};
	
}