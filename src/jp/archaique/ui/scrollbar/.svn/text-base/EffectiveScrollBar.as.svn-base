package jp.archaique.ui.scrollbar
{
	import flash.events.MouseEvent;
	
	public class EffectiveScrollBar extends ScrollBar
	{
		protected var _duraction:Number;
		protected var _easing:Function;
		
		public function EffectiveScrollBar(_target:ScrollTarget, _dragger:IDragger, _duraction:Number=0.5, _easing:Function=null)
		{
			this._duraction=_duraction;
			this._easing=_easing;
			super(_target, _dragger);
		}
		
		public function get duraction():Number
		{
			return _duraction;
		}
		
		public function get easing():Function
		{
			return _easing;
		}
		
		override protected function activeScroll(event:MouseEvent):void
		{
			var position:Number=Math.round((-_dragger.position*_moveRation))+_target.initialPosition;	
			_target.activeScroll(position, _duraction, _easing);
		}
		
		override public function kill():void
		{
			_duraction=NaN;
			_easing=null;
			super.kill();
		}
		
	}
}