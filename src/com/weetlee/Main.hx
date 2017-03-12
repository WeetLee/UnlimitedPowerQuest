package com.weetlee;

import com.weetlee.model.Fighter;
import com.weetlee.ui.gamePanel.GamePanel;
import com.weetlee.ui.monsterPanel.MonsterPanel;
import openfl.display.Sprite;
import openfl.Lib;
import com.weetlee.model.Player;
import com.weetlee.ui.playerPanel.PlayerPanel;
import flash.events.Event;
import com.weetlee.utils.Graphics;

/**
 * ...
 * @author Florent Claisse
 */
class Main extends Sprite 
{
	private var playerPanel:PlayerPanel;
	private var monsterPanel:MonsterPanel;
	private var gamePanel:GamePanel;
	private var player:Player;
	private var monster:Fighter;
	
	var inited:Bool;
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		player = new Player(this);
		playerPanel = new PlayerPanel(this, player);
		monster = new Fighter(this, "Méchant pas beau", 50, 70, 14, 5, 8, 3);
		monsterPanel = new MonsterPanel(this, monster);
		monsterPanel.x = 300;
		gamePanel = new GamePanel(this);
		gamePanel.x = 300 - 3 * Graphics.TILE_SIZE;
		gamePanel.y = 150;
		this.addChild(playerPanel);
		this.addChild(monsterPanel);
		this.addChild(gamePanel);
		
	}
	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	public function getPlayer():Player {
		return this.player;
	}
	public function getPlayerPanel():PlayerPanel {
		return this.playerPanel;
	}
	public function getMonster():Fighter {
		return this.monster;
	}
	public function update():Void {
		playerPanel.update();
		monsterPanel.update();
	}
	public function fighterDies(fighter:Fighter):Void {
		if (fighter == player) {
			playerDies();
		}
		else if (fighter == monster) {
			monsterDies();
		}
	}
	private function playerDies():Void {
		trace('bouh');
	}
	private function monsterDies():Void {
		trace('yeah');
	}
}
