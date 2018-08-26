package jp.archaique.transition
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import jp.archaique.event.ViewEvent;

	public class AbstractTransition extends EventDispatcher
	{
		protected var _target:DisplayObject;
		protected var _duration:Number;
		protected var _delay:Number;
		
		protected var _id:String;
		protected var _easing:Function;
		protected var _state:String=TransitionState.WAITING;
		protected var _easeParams:Array;
		protected var _showComplete:Function;
		protected var _showCompleteParams:Array;
		protected var _hideComplete:Function;
		protected var _hideCompleteParams:Array;
		
		public function AbstractTransition( target:DisplayObject, id:String=null, duration:Number=0.5, delay:Number=0, easing:Function=null, easeParams:Array=null)
		{
			_target = target;
			_id = id;
			_duration = duration;
			_delay = delay;	
			_easing = easing;
			_easeParams = easeParams;
		}
		
		public function show():void
		{
			_state = TransitionState.SHOWING;
			dispatchEvent(new ViewEvent(ViewEvent.SHOW));
		}
		
		public function hide():void
		{
			_state = TransitionState.HIDING;
			dispatchEvent(new ViewEvent(ViewEvent.HIDE));
		}
		
		public function kill():void
		{
			_target = null;
			_duration = NaN;
			_delay = NaN;
			_easing = null;
			_id = "";
			_state = TransitionState.KILLED;
			_easeParams = null;
			_showComplete = null;
			_showCompleteParams = null;
			_hideComplete = null;
			_hideCompleteParams = null;
		}
		
		public function get target():DisplayObject
		{
			return _target;
		}
		
		public function get duration():Number
		{
			return _duration;
		}
		
		public function get delay():Number
		{
			return _delay;
		}
		
		
		public function get id():String
		{
			return _id;
		}
		
		public function get easing():Function
		{
			return _easing;
		}
		
		public function get easeParams():Array
		{
			return _easeParams;
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function showComplete(handler:Function, ...params):void
		{
			_showComplete = handler;
			_showCompleteParams = params;
		}
		
		public function hideComplete(handler:Function, ...params):void
		{
			_hideComplete = handler;
			_hideCompleteParams = params;
		}
		
		public function set target(value:DisplayObject):void
		{
			_target = value;
		}
		
		public function set duration(value:Number):void
		{
			_duration = value;
		}
		
		public function set delay(value:Number):void
		{
			_delay = value;
		}
		
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function set easing(value:Function):void
		{
			_easing = value;
		}
		
		public function set easeParams(value:Array):void
		{
			 _easeParams = value;
		}
		
		protected function showed():void
		{
			_state=TransitionState.WAITING;
			if (_showComplete != null) _showComplete.apply(null, _showCompleteParams);
			dispatchEvent(new ViewEvent(ViewEvent.SHOWED));
		}
		
		protected function hid():void
		{
			_state=TransitionState.WAITING;
			if (_hideComplete != null) dispatchEvent.apply(null, _hideCompleteParams);
			dispatchEvent(new ViewEvent(ViewEvent.HID));
		}
		
	}
}