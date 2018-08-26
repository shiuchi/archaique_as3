package jp.archaique.transition.easing
{
	public class Circ
	{
		public function Circ()
		{
		}
		
		public static function toString():String
		{
			return "Circ";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
		}
	
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
		}
	
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
			return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
		}
	
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}

	}
}