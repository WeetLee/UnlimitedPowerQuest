package com.shutlee.games.events;
import haxe.Constraints.Function;

/**
 * ...
 * @author Florent Claisse
 */
class PubSub 
{
	var listeners:Map<String, Array<Function>>;
	
	static var self:PubSub = null;
	private function new() 
	{
		listeners = new Map<String, Array<Function>>();
	}
	
	public static function getInstance():PubSub {
		if (self == null) {
			self = new PubSub();
		}
		return self;
	}
	
	
	public function listen(_event:Dynamic, callback:Function):Void {
		var event:String = Std.string(_event);
		var list:Array<Function> = listeners.get(event);
		if (list == null) {
			list = new Array<Function>();
			listeners.set(event, list);
		}
		var index = list.indexOf(callback);
		if (index == -1) {
			list.push(callback);
		}
	}
	
	public function send(_event:Dynamic, data:Dynamic):Void {
		var event:String = Std.string(_event);
		var list:Array<Function> = listeners.get(event);
		for (callback in list) {
			try {
				callback(data);
			}
			catch (e:Dynamic) {
				//nothing;
			}
		}
	}
}