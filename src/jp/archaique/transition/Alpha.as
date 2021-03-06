package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	
	public class Alpha extends AbstractTransition implements ITransition
	{
		
		
		private var _showAlpha:Number;
		private var _hideAlpha:Number;
		
		private var _showTween:TweenMax;
		private var _hideTween:TweenMax;
		
		public function Alpha( target:DisplayObject, showAlpha:Number=1, hideAlpha:Number=0, id:String=null, duration:Number=0.5, delay:Number=0, easing:Function=null, easeParams:Array=null)
		{
			super( target, id, duration, delay, easing, easeParams);
			_showAlpha = showAlpha;
			_hideAlpha = hideAlpha;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(_hideTween);
			_showTween = TweenMax.to(_target, _duration, {alpha:_showAlpha, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(_showTween);
			_hideTween = TweenMax.to(_target, _duration, {alpha:_hideAlpha, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(_showTween);
			TweenMax.killTweensOf(_hideTween);
			_showTween = null;
			_hideTween = null;
			_showAlpha = NaN;
			_hideAlpha = NaN;
			super.kill();
		}
		
		public function get showAlpha():Number
		{
			return _showAlpha;
		}
		
		public function get hideAlpha():Number
		{
			return _hideAlpha;
		}
		
		public function set showAlpha(value:Number):void
		{
			_showAlpha = value;
		}
		
		public function set hideAlpha(value:Number):void
		{
			_hideAlpha = value;
		}
		
	}
}