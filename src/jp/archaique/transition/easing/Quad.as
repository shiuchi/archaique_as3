package jp.archaique.transition.easing
{
	public class Quad
	{
		public function Quad()
		{
		}
		
		public static function toString():String
		{
			return "Quad";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return c*(t/=d)*t + b;
		}
	
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return -c *(t/=d)*(t-2) + b;
		}
	
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if ((t/=d/2) < 1) return c/2*t*t + b;
			return -c/2 * ((--t)*(t-2) - 1) + b;
		}
	
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}

	}
}