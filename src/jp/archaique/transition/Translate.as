package jp.archaique.transition
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class Translate extends AbstractTransition implements ITransition
	{
		
		private var _showPoint:Point;
		private var _hidePoint:Point;
		
		private var showTween:TweenMax;
		private var hideTween:TweenMax;
		
		public function Translate(target:DisplayObject, showPoint:Point, hidePoint:Point, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super(target, id, duration, delay, easing, easeParams);
			_showPoint = showPoint;
			_hidePoint = hidePoint;
		}
		
		public function get showPoint():Point
		{
			return _showPoint;
		}
		
		public function get hidePoint():Point
		{
			return _hidePoint;
		}
		
		public function set showPoint( value:Point ):void
		{
			_showPoint = value;
		}
		
		public function set hidePoint( value:Point ):void
		{
			_hidePoint = value;
		}
		
		override public function show():void
		{
		
			TweenMax.killTweensOf(hideTween);	
			showTween = TweenMax.to( _target, _duration, { x:_showPoint.x, y:_showPoint.y, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed} );
			super.show();
		}
		
		
		
		override public function hide():void
		{
		
			TweenMax.killTweensOf(showTween);	
			showTween = TweenMax.to( _target, _duration, { x:_hidePoint.x, y:_hidePoint.y, delay:_delay, ease:_easing, easeParams:_easeParams,onComplete:hid} );
			super.hide();
		}
		
		override public function kill():void
		{
			
			TweenMax.killTweensOf(showTween);
			TweenMax.killTweensOf(hideTween);
			showTween = null;
			hideTween = null;
			_showPoint = null;
			_hidePoint = null;
			super.kill();
		}
		
	}
}