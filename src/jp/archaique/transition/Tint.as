package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class Tint extends AbstractTransition implements ITransition
	{
		protected var _showColor:uint;
		protected var _hideColor:uint;
		
		protected var showTween:TweenMax;
		protected var hideTween:TweenMax;
		
		public function Tint( target:DisplayObject, showColor:uint, hideColor:uint, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super( target, id, duration, delay, easing, easeParams);
			_showColor = showColor;
			_hideColor = hideColor;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to(_target, _duration, {tint:_showColor, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(_target, _duration, {tint:_hideColor, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			_showColor = NaN;
			_hideColor = NaN;
			super.kill();
		}
		
		
		public function get showColor():uint
		{
			return _showColor;
		}
		
		public function get hideColor():uint
		{
			return _hideColor;
		}
		
		public function set showColor(value:uint):void
		{
			_showColor = value;
		}
		
		public  function set hideColor(value:uint):void
		{
			_hideColor = value;
		}
	}
}