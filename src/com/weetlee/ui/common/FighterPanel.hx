package com.weetlee.ui.common;
import com.weetlee.model.Fighter;
import com.weetlee.Main;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Florent Claisse
 */
class FighterPanel extends Sprite
{
	private var fighter:Fighter;
	private var gameManager:Main;
	
	private var nameText:TextField;
	private var lifeText:TextField;
	private var attackText:TextField;
	private var defenseText:TextField;
	private var armorText:TextField;

	public function new(gameManager:Main, fighter:Fighter) 
	{
		super();
		this.gameManager = gameManager;
		this.fighter = fighter;
	}
	
	public function writeFighterInfo():Void {
		var nameFormat:TextFormat = new TextFormat("Verdana", 24, 0xbbbbbb, true);
		nameFormat.align = TextFormatAlign.CENTER;
		
		nameText = new TextField();
		nameText.y = 5;
		nameText.width = 300;
		nameText.defaultTextFormat = nameFormat;
		nameText.selectable = false;
		this.addChild(nameText);
		
		
		var statFormat:TextFormat = new TextFormat("Verdana", 12, 0xbbbbbb, true);
		lifeText = new TextField();
		lifeText.x = 5;
		lifeText.y = 40;
		lifeText.defaultTextFormat = statFormat;
		lifeText.selectable = false;
		this.addChild(lifeText);
		attackText = new TextField();
		attackText.x = 5;
		attackText.y = 65;
		attackText.defaultTextFormat = statFormat;
		attackText.selectable = false;
		this.addChild(attackText);
		defenseText = new TextField();
		defenseText.x = 5;
		defenseText.y = 90;
		defenseText.defaultTextFormat = statFormat;
		defenseText.selectable = false;
		this.addChild(defenseText);
		armorText = new TextField();
		armorText.x = 5;
		armorText.y = 115;
		armorText.defaultTextFormat = statFormat;
		armorText.selectable = false;
		this.addChild(armorText);
	}
	public function update():Void {
		nameText.text = fighter.name;
		lifeText.text = "LIF : " + fighter.curLife + "/" + fighter.maxLife;
		attackText.text = "ATK : " + fighter.attack;
		defenseText.text = "DEF : " + fighter.defense;
		armorText.text = "ARM : " + fighter.armor + " (+" + fighter.armorGrowth + ")";
	}
}