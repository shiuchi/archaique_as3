package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class Width extends AbstractTransition implements ITransition
	{
		
		protected var _showWidth:Number;
		protected var _hideWidth:Number;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		
		public function get showWidth():Number
		{
			return _showWidth;
		}
		
		public function set showWidth(value:Number):void
		{
			_showWidth = value;
		}
		
		public function get hideWidth():Number
		{
			return _hideWidth;
		}
		
		public function set hideWidth(value:Number):void
		{
			_hideWidth = value;
		}
		
		public function Width(target:DisplayObject, showWidth:Number, hideWidth:Number, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null)
		{
			_showWidth = showWidth;
			_hideWidth = hideWidth;
			super(target, id, duration, delay, easing);
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to(target, _duration, {width:_showWidth, delay:_delay, ease:_easing, onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(target, _duration, {width:_hideWidth, delay:_delay, ease:_easing, onComplete:hid});
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			_showWidth = NaN;
			_hideWidth = NaN;
			showTween = null;
			hideTween = null;
			super.kill();
		}
		
	}
}