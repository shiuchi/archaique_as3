package jp.archaique.transition.easing
{
	public class Expo
	{
		public function Expo()
		{
		}
		
		public static function toString():String
		{
			return "Expo";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b - c * 0.001;
		}
	
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return (t==d) ? b+c : c * 1.001 * (-Math.pow(2, -10 * t/d) + 1) + b;
		}
	

		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t==0) return b;
			if (t==d) return b+c;
			if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b - c * 0.0005;
			return c/2 * 1.0005 * (-Math.pow(2, -10 * --t) + 2) + b;
		}
	
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}
	}
}