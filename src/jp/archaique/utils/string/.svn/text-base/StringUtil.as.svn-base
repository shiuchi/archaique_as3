package jp.archaique.utils.string
{
	public class StringUtil
	{
		
		//target内にあるtargetStringをnewStringで置き換えます
		public static function replaceString( target:String, newWord:String, targetWord:String):String
		{
		 	return target.split(targetWord).join(newWord);		
		}
		
		
		//target内のスペースと改行を削除します
		public static function condenseWhite(str:String):String
		{
			var _str:String=str.split("\r\n").join("\n");
			_str=_str.split("\r").join("\n");
			_str=_str.split("\n").join("");
			_str=_str.split(" ").join("");
			_str=_str.split("　").join("");
			return _str;
		} 
		
		public static function cacheKiller():String
		{
			return "?rand="+Math.random()*100000000;
		}
		
	}
}