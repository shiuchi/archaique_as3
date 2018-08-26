package jp.archaique.transition.easing
{
	public class Elastic
	{
		public function Elastic()
		{
		}
		
		public static function toString():String
		{
			return "Elastic";
		}
		
			
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t==0) return b;
			if ((t/=d)==1) return b+c;
			var p:Number = !Boolean(p_params) || isNaN(p_params.p_period) ? d*.3 : p_params.period;
			var s:Number;
			var a:Number = !Boolean(p_params) || isNaN(p_params.amplitude) ? 0 : p_params.amplitude;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p/4;
			} else {
				s = p/(2*Math.PI) * Math.asin (c/a);
			}
			return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		}
	
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t==0) return b;
			if ((t/=d)==1) return b+c;
			var p:Number = !Boolean(p_params) || isNaN(p_params.p_period) ? d*.3 : p_params.period;
			var s:Number;
			var a:Number = !Boolean(p_params) || isNaN(p_params.amplitude) ? 0 : p_params.amplitude;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p/4;
			} else {
				s = p/(2*Math.PI) * Math.asin (c/a);
			}
			return (a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b);
		}
	
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t==0) return b;
			if ((t/=d/2)==2) return b+c;
			var p:Number = !Boolean(p_params) || isNaN(p_params.p_period) ? d*(.3*1.5) : p_params.period;
			var s:Number;
			var a:Number = !Boolean(p_params) || isNaN(p_params.amplitude) ? 0 : p_params.amplitude;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p/4;
			} else {
				s = p/(2*Math.PI) * Math.asin (c/a);
			}
			if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
			return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
		}
	
		public static function easeOutIn (t:Number, b:Number, c:Number, d:Number, p_params:Object = null):Number {
			if (t < d/2) return easeOut (t*2, b, c/2, d, p_params);
			return easeIn((t*2)-d, b+c/2, c/2, d, p_params);
		}

	}
}