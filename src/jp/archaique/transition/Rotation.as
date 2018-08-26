package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;


	//--------------------------------------
	// targetを回転させるtransition yoyoをtrueにすると回転しつずける
	//--------------------------------------
	
	public class Rotation extends AbstractTransition implements ITransition
	{
		private var _angle:Number;
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		private var _loop:Number;
		
		public function Rotation(target:DisplayObject, angle:Number = 360, loop:int = 1, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super(target, id, duration, delay, easing, easeParams);
			_angle = angle;
			_loop = loop;
		}
		
		public function get angle():Number
		{
			return _angle;
		}
		
		public function set angle(value:Number):void
		{
			_angle = value;
		}
		
		public function get loop():int
		{
			return _loop;
		}
		
		public function set loop(value:int):void
		{
			_loop = value;
		}
		
		override public function show():void
		{
			TweenMax.killTweensOf(hideTween);
			showTween = TweenMax.to(_target, _duration, {rotation:_angle, delay:_delay, ease:_easing, easeParams:_easeParams, loop:_loop, onComplete:showed});
		}
		
		override public function hide():void
		{
			TweenMax.killTweensOf(showTween);
			hideTween = TweenMax.to(_target, _duration, {rotation:0, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
		}
		
		override public function kill():void
		{
			_angle = NaN;
			_loop = NaN;
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			super.kill();
		}
	}
}