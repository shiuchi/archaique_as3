package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class Scale extends AbstractTransition implements ITransition
	{
		
		protected var _showScale:Number;
		protected var _hideScale:Number;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		public function Scale( target:DisplayObject, showScale:Number, hideScale:Number, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super( target, id, duration, delay, easing, easeParams);
			_showScale = showScale;
			_hideScale = hideScale;
		}
		
		public function get showScale():Number
		{
			return _showScale;
		}
		
		public function get hideScale():Number
		{
			return _hideScale;
		}
		
		public function set showScale(value:Number):void
		{
			_showScale = value;
		}
		
		public function set hideScale(value:Number):void
		{
			_hideScale = value;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to( _target, _duration, {scaleX:_showScale, scaleY:_showScale, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed}); 
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(_target, _duration, {scaleX:_hideScale, scaleY:_hideScale, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid}); 
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			_hideScale = NaN;
			_showScale = NaN;
			super.kill();
		}
		
	}
}