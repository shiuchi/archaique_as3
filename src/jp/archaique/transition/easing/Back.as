package jp.archaique.transition.easing
{
	public class Back{
	
		public function Back()
		{
		}
		
		public static function toString():String
		{
			return "Back";
		}
		
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
			return c*(t/=d)*t*((s+1)*t - s) + b;
		}
		
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		}
		
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
			if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
			return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
		}
		
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}
		
	}
}
