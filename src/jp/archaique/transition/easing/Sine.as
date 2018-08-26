package jp.archaique.transition.easing
{
	public class Sine
	{
		public function Sine()
		{
		}
		
		public static function toString():String
		{
			return "Sine";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
		}
		
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return c * Math.sin(t/d * (Math.PI/2)) + b;
		}
		
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
		}
		
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}

	}
}