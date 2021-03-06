package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class ScaleY extends AbstractTransition implements ITransition
	{
		
		protected var _showScaleY:Number;
		protected var _hideScaleY:Number;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		public function ScaleY( target:DisplayObject, showScaleY:Number = 1, hideScaleY:Number = 0, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super( target, id, duration, delay, easing, easeParams);
			_showScaleY = showScaleY;
			_hideScaleY = hideScaleY;
		}
		
		public function get showScaleY():Number
		{
			return _showScaleY;
		}
		
		public function get hideScaleY():Number
		{
			return hideScaleY;
		}
		
		public function set showScaleY(value:Number):void
		{
			_showScaleY = value;
		}
		
		public function set hideScaleY(value:Number):void
		{
			_hideScaleY = value;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to(_target, _duration, {scaleY:_showScaleY, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(_target, _duration, {scaleY:_hideScaleY, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
			super.hide();
		}
		
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			_showScaleY = NaN;
			_hideScaleY = NaN;
			super.kill();
		}
		
		
		
	}
}