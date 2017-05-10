package com.shutlee.games.lang;

/**
 * ...
 * @author Florent Claisse
 */
class LangManager 
{
	private static var DEFAULT_LANGAGE:AvailableLangages = AvailableLangages.EN;
	private static var self:LangManager = null;
	
	public static function getInstance(Void):LangManager {
		if (self == null) self = new LangManager();
		return self;
	}
	private function new() 
	{
		this.setLangage(DEFAULT_LANGAGE);
		datas = new Map<AvailableLangages,Map<String, String>>();
	}
	
	private var lang:AvailableLangages;
	private var datas Map<AvailableLangages,Map<String, String>>;
	
	private var curData:Map<String, String>;
	
	public function setLangage(newLang:AvailableLangages):Void {
		this.lang = newLang;
		var tmpData = datas.get(this.lang);
		if (tmpData == null) {
			tmpData = new Map<String, String>();
			datas.set(this.lang, tmpData);
		}
		curData = tmpData;
	}
	
	public function get(key:String, ?args:Array<String>):String {
		var tmpString = curData.get(key);
		if (tmpString != null) {
			if (args != null) {
				var i:Int = 0;
				for (arg in args) {
					tmpString = StringTools.replace(tmpString, "{" + i + "}", arg);
				}
			}
		}
		return tmpString;
	}
}