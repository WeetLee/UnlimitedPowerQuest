package com.weetlee.ui.common;

import com.weetlee.Main;
import haxe.Log;
import openfl.display.Sprite;

/**
 * ...
 * @author Florent Claisse
 */
class ProgressBar extends Sprite 
{
	
	private var gameManager:Main;
	
	private var fillColor:Int;
	private var backgroundColor:Int;
	private var pbHeight:Int;
	private var pbWidth:Int;
	private var current:Int;
	private var max:Int;

	public function new(gameManager:Main, width:Int, height:Int, maxValue:Int, fillColor:Int, backGround:Int) 
	{
		super();
		this.pbWidth = width;
		this.pbHeight = height;
		this.max = maxValue;
		this.fillColor = fillColor;
		this.backgroundColor = backGround;
		this.current = 0;
		this.draw();
	}
	
	public function setCurrent(current:Int):Void
	{
		if (current < 0) {
			this.current = 0;
		}
		else if (current > this.max)
		{
			this.current = this.max;
		}
		else
		{
			this.current = current;
		}
		this.draw();
	}
	public function getCurrent():Int
	{
		return this.current;
	}
	private function draw()
	{
		this.graphics.clear();
		this.graphics.beginFill(backgroundColor);
		this.graphics.drawRect(0, 0, pbWidth, pbHeight);
		this.graphics.endFill();
		this.graphics.beginFill(fillColor);
		var progress:Float = current / max;
		this.graphics.drawRect(2, 2, progress * (pbWidth-4), pbHeight-4);
		this.graphics.endFill();
	}
}