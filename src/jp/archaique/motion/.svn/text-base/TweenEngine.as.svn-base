package jp.archaique.motion
{
	import org.goasap.items.LinearGo;
	import org.goasap.managers.LinearGoRepeater;

	internal class TweenEngine extends LinearGo
	{
		private var _parameterManager:ParameterManager;
		
		public function TweenEngine(delay:Number=0, duration:Number=0.5, easing:Function=null, extraEasingParams:Array=null, repeater:LinearGoRepeater=null, useRelative:Boolean=false, useRounding:Boolean=false, useFrames:Boolean=false, pulseInterval:Number=NaN)
		{
			super(delay, duration, easing, extraEasingParams, repeater, useRelative, useRounding, useFrames, pulseInterval);
		}
		
		public function set parameterManager( value:ParameterManager ):void
		{
			_parameterManager=value;
		}
		
		override protected function onUpdate(type:String):void
		{
			_parameterManager.onUpdate(this);
			return super.onUpdate(type);
		}
		
		public function kill():void
		{
			_parameterManager=null;
			reset();
		}
	}
}