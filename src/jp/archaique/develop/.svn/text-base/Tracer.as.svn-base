package jp.archaique.develop
{
	
	public class Tracer
	{
		
		private static var _enabled:Boolean=true;
		
		public function Tracer()
		{
		}
		
		//----------------------------------------------
		//	setter
		//----------------------------------------------
		
		public static function set enabled(_enabled:Boolean):void
		{
			Tracer._enabled=_enabled;
		}
		
		//----------------------------------------------
		//	public 
		//----------------------------------------------
		

		public static function _trace(...args):void
		{
			if(_enabled)
			{
				var len:int=args.length;
				var s:String="";
				for(var i:int=0; i<len; i++)
				{
					s+=args[i].toString()+" ";
				}
				
				trace(s);
			}
		}
		
	}
}