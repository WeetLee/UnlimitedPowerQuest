package com.shutlee.games.ui;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Florent Claisse
 */
class Button extends Sprite
{
	private var backgroundColor:Int;
	private var darker:Int;
	private var lighter:Int;
	private var bWidth:Int;
	private var bHeight:Int;
	private var buttonText:TextField;
	
	public function new(r:Int, g:Int, b:Int, label:String, width:Int, height:Int, textColor:Int) 
	{
		super();
		initText(textColor);
		this.bWidth = width;
		this.bHeight = height;
		setLabel(label);
		setColor(r, g, b);
		
		this.addEventListener(MouseEvent.MOUSE_OVER, enterButton);
		this.addEventListener(MouseEvent.MOUSE_OUT, leaveButton);
		
	}
	
	public function setColor(r:Int, g:Int, b:Int):Void {
		serialize(r, g, b);
		this.drawButton();
	}
	
	public function setLabel(label:String):Void {
		buttonText.text = label;
		var offsetX:Int = Math.round((this.bWidth - buttonText.textWidth) / 2);
		var offsetY:Int = Math.round((this.bHeight - buttonText.textHeight) / 2);
		buttonText.x = offsetX;
		buttonText.y = offsetY;
		buttonText.height = bHeight - offsetY;
		buttonText.width = bWidth - offsetX;
	}
	
	private function drawButton():Void {
		this.graphics.clear();
		this.graphics.beginFill(backgroundColor);
		this.graphics.drawRect(0, 0, bWidth, bHeight);
		this.graphics.endFill();
		drawReleasedBorder();
		//drawRect (x:Float, y:Float, width:Float, height:Float)
	}
	
	private function drawPressedBorder():Void {	
		var borderWidth:Int = 3;
		this.graphics.beginFill(darker);
		this.graphics.drawRect(0, 0, bWidth, borderWidth);
		this.graphics.drawRect(0, 0, borderWidth, bHeight);
		this.graphics.endFill();
		this.graphics.beginFill(lighter);
		this.graphics.drawRect(0, bHeight - borderWidth, bWidth, borderWidth);
		this.graphics.drawRect(bWidth - borderWidth, 0, borderWidth, bHeight);
		this.graphics.endFill();
	}
	private function drawReleasedBorder():Void {	
		var borderWidth:Int = 3;	
		this.graphics.beginFill(lighter);
		this.graphics.drawRect(0, 0, bWidth, borderWidth);
		this.graphics.drawRect(0, 0, borderWidth, bHeight);
		this.graphics.endFill();
		this.graphics.beginFill(darker);
		this.graphics.drawRect(0, bHeight - borderWidth, bWidth, borderWidth);
		this.graphics.drawRect(bWidth - borderWidth, 0, borderWidth, bHeight);
		this.graphics.endFill();
	}
	
	private function serialize(r:Int, g:Int, b:Int):Void {
		this.backgroundColor = toRGB(r, g, b);
		var tmpR:Int,
			tmpG:Int,
			tmpB:Int;
		tmpR = Math.round(r * 1.1);
		tmpG = Math.round(g * 1.1);
		tmpB = Math.round(b * 1.1);
		tmpR = (tmpR > 255) ? 255 : tmpR;
		tmpG = (tmpG > 255) ? 255 : tmpG;
		tmpB = (tmpB > 255) ? 255 : tmpB;
		this.lighter = toRGB(tmpR, tmpG, tmpB);
		tmpR = Math.round(r * 0.9);
		tmpG = Math.round(g * 0.9);
		tmpB = Math.round(b * 0.9);
		this.darker = toRGB(tmpR, tmpG, tmpB);
	}
	
	private function toRGB(r:Int, g:Int, b:Int):Int {
		return Math.round(b + 256 * (g + 256 * r));
	}
	
	private function enterButton(event:Event):Void {
		drawPressedBorder();
	}
	private function leaveButton(event:Event):Void {
		drawReleasedBorder();
	}
	
	private function initText(textColor:Int):Void {
		buttonText = new TextField();
		buttonText.defaultTextFormat = new TextFormat("Arial", 16, textColor, false);
		buttonText.selectable = false;
		this.addChild(buttonText);
	}
}