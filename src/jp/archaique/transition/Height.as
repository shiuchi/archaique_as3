package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;

	public class Height extends AbstractTransition implements ITransition
	{
		protected var _showHeight:Number;
		protected var _hideHeight:Number;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		
		public function get showHeight():Number
		{
			return _showHeight;
		}
		
		public function set showHeight(value:Number):void
		{
			_showHeight = value;
		}
		
		public function get hideHeight():Number
		{
			return _hideHeight;
		}
		
		public function set hideHeight(value:Number):void
		{
			_hideHeight = value;
		}
		
		public function Height(target:DisplayObject, showHeight:Number, hideHeight:Number, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null)
		{
			_showHeight = showHeight;
			_hideHeight = hideHeight;
			super(target, id, duration, delay, easing);
		}
		
		override public function show():void
		{
			if (hideTween) TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to(target, _duration, {height:_showHeight, delay:_delay, ease:_easing, onComplete:showed});
			super.show();
		}
		
		override public function hide():void
		{
			if(showTween) TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(target, _duration, {height:_hideHeight, delay:_delay, ease:_easing, onComplete:hid});
			super.hide();
		}
		
		override public function kill():void
		{
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			_showHeight = NaN;
			_hideHeight = NaN;
			showTween = null;
			hideTween = null;
			super.kill();
		}
		
	}
}