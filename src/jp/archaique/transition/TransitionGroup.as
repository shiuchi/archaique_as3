package jp.archaique.transition
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import jp.archaique.event.ViewEvent;

	public class TransitionGroup extends EventDispatcher implements ITransitionGroup
	{
		
		private var dic:Dictionary = new Dictionary();
		private var _transitions:Array = [];
		private var _state:String = TransitionState.WAITING;
		
		private var showCount:int;
		private var hideCount:int;
		
		public function get transitions():Array
		{
			return _transitions;
		}
		
		public function numChildren():int
		{
			return transitions.length;
		}
		
		public function TransitionGroup( ...item )
		{
			var _item:Array = item as Array;
			_item.forEach(_addTransition);
		}
		
		public function show():void
		{
			//既にkillされていた場合はreturn
			if (_state == TransitionState.KILLED)
				return;
				
			_state = TransitionState.SHOWING;
			showCount = 0;
			_transitions.forEach(_show);
		}
		
		private function _show(item:ITransitionBase, index:int, arr:Array):void
		{
			item.show();
		}
		
		
		private function showed( event:ViewEvent ):void
		{
			if (showCount<_transitions.length-1)
			{
				showCount++;
			}
			else
			{
				showCount = 0;
				_state = TransitionState.WAITING;
				dispatchEvent(new ViewEvent(ViewEvent.SHOWED));
			}
		}
		
		public function hide():void
		{
			//既にkillされていた場合はreturn
			if (_state == TransitionState.KILLED)
				return;
			
			_state = TransitionState.HIDING;
			hideCount = 0;
			_transitions.forEach(_hide);
		}
		
		private function _hide(item:ITransitionBase, index:int, arr:Array):void
		{
			item.hide();
		}
		
		private function hid( event:ViewEvent ):void
		{
			if (hideCount<transitions.length-1)
			{
				hideCount++;
			}
			else
			{
				hideCount = 0;
				_state = TransitionState.WAITING;
				dispatchEvent(new ViewEvent(ViewEvent.HID));
			}
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function kill():void
		{
			var transition:ITransitionBase;
			for each(transition in dic)
			{
				transition.kill();
				transition.removeEventListener(ViewEvent.SHOWED, showed);
				transition.removeEventListener(ViewEvent.HID, hid);
			}
			_transitions = null;
			dic = null;
			showCount = NaN;
			hideCount = NaN;
			_state = TransitionState.KILLED;
		}
		
		public function addTransition( ...item ):void
		{
			if (_state != TransitionState.WAITING)
				return;
			
			var _item:Array = item as Array;
			_item.forEach(_addTransition);
			
		}
		
		private function _addTransition( item:ITransitionBase, index:int, arr:Array ):void
		{
			if (_state != TransitionState.WAITING)
				return;
			
			//重複していなければ登録する
			if (!dic[item])
			{
				dic[item] = item;
				_transitions.push(item);
				item.addEventListener(ViewEvent.SHOWED, showed);
				item.addEventListener(ViewEvent.HID, hid);
			}
		}
		
		public function removeTransition(transition:ITransitionBase):void
		{
			if (_state != TransitionState.WAITING)
				return;
			
			if (dic[transition])
			{
				transition.removeEventListener(ViewEvent.SHOWED, showed);
				transition.removeEventListener(ViewEvent.HID, hid);
				delete dic[transition];
				_transitions.splice(transitions.indexOf(transition),1);
			}
		}
	}
}