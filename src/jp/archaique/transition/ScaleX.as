package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class ScaleX extends AbstractTransition implements ITransition
	{
		
		protected var _showScaleX:Number;
		protected var _hideScaleX:Number;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		public function ScaleX( target:DisplayObject, showScaleX:Number = 1, hideScaleX:Number = 0, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super(target, id, duration, delay, easing, easeParams);
			_showScaleX = showScaleX;
			_hideScaleX = hideScaleX;
		}
		
		public function get showScaleX():Number
		{
			return _showScaleX;
		}
		
		public function get hideScaleX():Number
		{
			return hideScaleX;
		}
		
		public function set showScaleX(value:Number):void
		{
			_showScaleX = value;
		}
		
		public function set hideScaleX(value:Number):void
		{
			_hideScaleX = value;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to( _target, _duration, {scaleX:_showScaleX, delay:_delay, ease:_easing, easeParams:_easeParams,  onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to( _target, _duration, {scaleX:_hideScaleX, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			_showScaleX = NaN;
			_hideScaleX = NaN;
			super.kill();
		}
		
	}
}