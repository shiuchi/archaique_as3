package jp.archaique.transition.easing
{
	public class Bounce
	{
		public function Bounce()
		{
		}
		
		public static function toString():String
		{
			return "Bounce";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			return c - easeOut (d-t, 0, c, d) + b;
		}
	
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
	
		
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeIn (t*2, 0, c, d) * .5 + b;
			else return easeOut (t*2-d, 0, c, d) * .5 + c*.5 + b;
		}
	
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}

	}
}