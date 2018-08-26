package jp.archaique.utils.collection
{
	import flash.utils.getQualifiedClassName;
	
	public class ObjectUtils
	{
		
		//Objectの要素の数を返します
		public static function length( target:Object):int
		{
			var i:int=0;
			for(var prop:String in target)
			{
				i++;
			}
			return i;
		}
		
		private static var results:Array;
		private static var space:Array;
		private static var maxlength:int;
		
		//オブジェクトをdumpします
		public static function dump( target:Object ):void
		{
			init();
			_dump(target);
			outPut();
		}
		
		private static function init():void
		{
			//初期化
			results=[];
			space=[];
			maxlength=0;
		}
		
		private static function _dump(target:*):void
		{
			
			for( var prop:String in target)
			{
				var item:*=target[prop];
				var type:String=getQualifiedClassName(item);
				var hasChild:Boolean= (type=="Object") || (type=="Array")
				
				var result:String = getSpace() +  "[" + prop + ":" +  ((hasChild)? type:(type + " = " + item)) + "]";
				results.push(result);
				
				maxlength = (maxlength<result.length)? result.length : maxlength;
					
				
				if(hasChild)
				{
					space.push(result);
					_dump(item);
				}
			}
			space.pop();
		}
	
		
		private static function outPut():void
		{
			trace(getIndents());
			var len:int=results.length;
			for(var i:int=0; i<len; i++)
			{
				trace(results[i]);
			}
			trace(getIndents());
		}
		
		private static function getIndents():String
		{
			
			var str:String="";
			if (maxlength>str.length)
			{
				var m:int=maxlength-str.length;
				for(var i:int=0; i<m; i++)
				{
					str+="-";
				}
			}
			return str;
		}
		
		private static function getSpace():String
		{
			var str:String=space[space.length-1];
			var spaces:String="";
			
			if (str)
			{
				var m:int = str.length;
				for(var i:int=0; i<m; i++)
				{
					spaces+=" ";
				}
			}
			return spaces;
		} 
	}
}