package
{
	public class log
	{
		
		public static var _visible:Boolean = true;
		public static function set visible(value:Boolean):void{ _visible = value; }
		
		public function log(args:String)
		{
			if (_visible)
			{
				var len:int=args.length;
				var s:String="";
				for(var i:int=0; i<len; i++)
				{
					s += args[i].toString()+" ";
				}
				
				trace(s);
			}
		}

	}
}