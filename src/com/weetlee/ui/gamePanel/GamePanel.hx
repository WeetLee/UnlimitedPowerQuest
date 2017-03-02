package com.weetlee.ui.gamePanel;
import com.weetlee.ui.gamePanel.Tile;
import openfl.display.Sprite;
import openfl.events.Event;
import com.weetlee.Main;
import com.weetlee.utils.Graphics;
import haxe.Log;
import openfl.events.MouseEvent;
import com.weetlee.utils.TileUtils;

/**
 * ...
 * @author Florent Claisse
 */
class GamePanel extends Sprite
{
	public var tiles:List<Sprite>;
	public var columns:Array<Array<Tile>>;
	private var gameManager:Main;
	
	private var test:Bool = true;
	
	public function new(gameManager:Main) 
	{
		super();
		this.gameManager = gameManager;
		init();
		draw();
		this.addEventListener(Event.ENTER_FRAME, everyFrame);
	}
	
	public function init():Void {
		initBoard();
	}
	public function draw():Void {
		this.removeChildren();
		
		for (i in 0...Graphics.TILEMAP_SIZE) 
		{
			for (j in 0...Graphics.TILEMAP_SIZE) 
			{
				if (columns[i][j] != null)
				this.addChild(columns[i][j]);
			}
		}
	}
	private function initBoard():Void {
		columns = new Array<Array<Tile>>();
		
		for (i in 0...Graphics.TILEMAP_SIZE) 
		{
			var column = new Array<Tile>();
			for (j in 0...Graphics.TILEMAP_SIZE) 
			{
				var tile:Tile = genTile(i, j);
				tile.addEventListener(MouseEvent.CLICK, tagTile);
				column[j] = tile;
			}
			columns[i] = column;
		}
		updateBoard();
	}
	
	public function everyFrame(event:Event):Void {
		//if (!test) return;
		test = false;
		var dropped:Bool = dropAll();
		if (dropped) updateBoard();
	}
	
	private function tagTile(event:MouseEvent):Void {
		try {
			var target = cast(event.target, Tile);
			var i:Int = Std.int(target.x / Graphics.TILE_SIZE);
			var j:Int = Std.int(target.y / Graphics.TILE_SIZE);
			if (!columns[i][j].dropping) {
				columns[i][j].tagged = true;
				updateBoard();
			}
		}
		catch( msg : String ) {
			trace("Une erreur est survenue : " + msg);
		}
	}
	
	private function updateBoard() {
		tag();
		delete();
	}
	
	private function tag():Void {
		//vertical
		for (i in 0...Graphics.TILEMAP_SIZE) 
		{
			for (j in 0...(Graphics.TILEMAP_SIZE-2)) 
			{
				try {
					var typeRef:TileType = columns[i][j].getType();
					var cmpA:TileType = columns[i][j+1].getType();
					var cmpB:TileType = columns[i][j + 2].getType();
					if (typeRef == cmpA && typeRef == cmpB) {
						columns[i][j].tagged = true;
						columns[i][j+1].tagged = true;
						columns[i][j+2].tagged = true;
					}
				}
				catch(e:String) {}
			}
		}
		//orizontal
		for (j in 0...Graphics.TILEMAP_SIZE) 
		{
			for (i in 0...(Graphics.TILEMAP_SIZE-2)) 
			{
				try {
					var typeRef:TileType = columns[i][j].getType();
					var cmpA:TileType = columns[i+1][j].getType();
					var cmpB:TileType = columns[i+2][j].getType();
					if (typeRef == cmpA && typeRef == cmpB) {
						columns[i][j].tagged = true;
						columns[i+1][j].tagged = true;
						columns[i+2][j].tagged = true;
					}
				}
				catch(e:String) {}
			}
		}
		////diag \ 
		//for (i in 0...(Graphics.TILEMAP_SIZE-2)) 
		//{
			//for (j in 0...(Graphics.TILEMAP_SIZE-2)) 
			//{
				//try {
					//var typeRef:TileType = columns[i][j].getType();
					//var cmpA:TileType = columns[i+1][j+1].getType();
					//var cmpB:TileType = columns[i+2][j + 2].getType();
					//if (typeRef == cmpA && typeRef == cmpB) {
						//columns[i][j].tagged = true;
						//columns[i+1][j+1].tagged = true;
						//columns[i+2][j+2].tagged = true;
					//}
				//}
				//catch(e:String) {}
			//}
		//}
		////diag /
		//for (i in 2...(Graphics.TILEMAP_SIZE)) 
		//{
			//for (j in 0...(Graphics.TILEMAP_SIZE-2)) 
			//{
				//try {
					//var typeRef:TileType = columns[i][j].getType();
					//var cmpA:TileType = columns[i-1][j+1].getType();
					//var cmpB:TileType = columns[i-2][j + 2].getType();
					//if (typeRef == cmpA && typeRef == cmpB) {
						//columns[i][j].tagged = true;
						//columns[i-1][j+1].tagged = true;
						//columns[i-2][j+2].tagged = true;
					//}
				//}
				//catch(e:String) {}
			//}
		//}
	}
	
	private function delete():Bool {
		var deletedTiles = new Map<TileType, Int>();
		var deleted:Bool = false;
		var dropping:Bool = false;
		for (i in 0...Graphics.TILEMAP_SIZE) 
		{
			dropping = false;
			for (jBis in 1...(Graphics.TILEMAP_SIZE + 1)) 
			{
				var j:Int = Graphics.TILEMAP_SIZE - jBis;
				var tile:Tile = columns[i][j];
				if (tile == null) {
					continue;
				}
				if (!tile.dropping)	tile.dropping = dropping;
				if (tile.tagged) {
					var count:Int = deletedTiles.get(tile.getType());
					count = (count == null) ? 1 : count + 1;
					deletedTiles.set(tile.getType(), count);
					this.removeChild(tile);
					columns[i][j] = null;
					deleted = true;
					dropping = true;
				}
			}
		}
		var keys:Iterator<TileType> = deletedTiles.keys();
		for (tileType in keys) {
			var count:Int = deletedTiles.get(tileType);
			if (count != null) {
				gameManager.getPlayer().pop(tileType, count);
			}
		}
		return deleted;
	}
	private function dropAll():Bool {
		var dropped:Bool = false;
		for (i in 0...Graphics.TILEMAP_SIZE) 
		{
			var tmpDropped = dropColumn(i);
			if (tmpDropped) dropped = true;
		}
		return dropped;
	}
	private function dropColumn(i:Int):Bool {
		var column:Array<Tile> = columns[i];
		var dropped:Bool = false;
		var emptyCase:Bool = false;
		var targetJ:Int = Graphics.TILEMAP_SIZE - 1;
		var count:Int = 0;
		
		for (jBis in 1...(Graphics.TILEMAP_SIZE + 1)) 
		{
			var j:Int = Graphics.TILEMAP_SIZE - jBis;
			var tile:Tile = column[j];
			if (tile == null) {
				continue;
			}
			count++;
			if (tile.dropping) {
				dropped = true;
				tile.y = tile.y + TileUtils.DROP_SPEED;
				if (tile.y >= targetJ * Graphics.TILE_SIZE) {
					tile.dropping = false;
					tile.y = targetJ * Graphics.TILE_SIZE;
					column[targetJ] = tile;
					column[j] = null;
				}
			}
			if (!tile.dropping) {
				targetJ = targetJ - 1;
			}
			
			
			
			//var nextTile:Tile;
			//if (j == 0) {
				//nextTile = genTile(i,0);
				//this.addChild(nextTile);
			//} else {
				//nextTile = column[j - 1];
				//if (nextTile != null) {
					//nextTile.y = j * Graphics.TILE_SIZE;
					//column[j - 1] = null;
				//}
			//}
			//if (nextTile != null) {
				//column[j] = nextTile;
			//}
		}
		var index:Int = Graphics.TILEMAP_SIZE;
		
		while (count < Graphics.TILEMAP_SIZE) {
			var tile:Tile = column[index];
			if (tile != null) {
				if (tile.dropping) {
					dropped = true;
					tile.y = tile.y + TileUtils.DROP_SPEED;
					if (tile.y >= targetJ * Graphics.TILE_SIZE) {
						tile.dropping = false;
						tile.y = targetJ * Graphics.TILE_SIZE;
						column[targetJ] = tile;
						column[index] = null;
						var tmpIndex = index;
						while (column[tmpIndex + 1] != null) {
							column[tmpIndex] = column[tmpIndex + 1];
							column[tmpIndex + 1] = null;
							tmpIndex++;
						}
						index--;
					}
				}
				if (!tile.dropping) {
					targetJ = targetJ - 1;
				}
			} else {
				tile = genTile(i, Graphics.TILEMAP_SIZE - index -1);
				tile.addEventListener(MouseEvent.CLICK, tagTile);
				tile.dropping = true;
				column[index] = tile;
			}
			
			
			count++;
			index++;
		}
		return dropped;
	}
	
	
	private function genTile(i:Int, j:Int):Tile {
		var tile:Tile = new Tile(i * Graphics.TILE_SIZE, j * Graphics.TILE_SIZE, TileUtils.genType());
		this.addChild(tile);
		tile.addEventListener(MouseEvent.CLICK, tagTile);
		return tile;
	}
}