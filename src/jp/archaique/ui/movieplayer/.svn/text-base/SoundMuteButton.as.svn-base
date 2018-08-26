package jp.archaique.ui.movieplayer
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	public class SoundMuteButton extends EventDispatcher
	{
		
		private var _target:Sprite
		private var _enabled:Boolean;
		private var _hitArea:Sprite;
		private var _state:String=SoundState.PlAYING;
		
		
		public function SoundMuteButton( target:Sprite )
		{
			_target=target;
			initialize();
		}
		
		public function initialize():void
		{
			_state=SoundState.PlAYING;
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled=value;
			if (value)
				addListener();
			else
				removeListener();
		}
		
		public function set state(value:String):void
		{
			_state=value;
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function get hitArea():Sprite
		{
			return _hitArea;
		}
		
		public function set hitArea(value:Sprite):void
		{
			removeListener();
			_hitArea=value;
		}
		
		private function addListener():void
		{
			if (!_hitArea)
				_hitArea=_target;
			_hitArea.buttonMode=true;
			_hitArea.useHandCursor=true;
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER, dispatch);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT,dispatch);
			_hitArea.addEventListener(MouseEvent.CLICK,dispatch);
		}
		
		private function removeListener():void
		{
			_hitArea.mouseEnabled=false;
			_hitArea.useHandCursor=false;
			_hitArea.removeEventListener(MouseEvent.MOUSE_OVER, dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_OUT,dispatch);
			_hitArea.removeEventListener(MouseEvent.CLICK,dispatch);
		}
		
		private function dispatch( event:MouseEvent ):void
		{
			if (event.type==MouseEvent.CLICK)
				switchState();
			dispatchEvent(event);
		}
		
		private function switchState():void
		{
			if (_state==SoundState.PlAYING)
				_state=SoundState.MUTE;
			else
				_state=SoundState.PlAYING;
		}
		
		public function kill():void
		{
			_hitArea.mouseEnabled=false;
			_hitArea.useHandCursor=false;
			_hitArea.removeEventListener(MouseEvent.MOUSE_OVER, dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_OUT,dispatch);
			_hitArea.removeEventListener(MouseEvent.CLICK,dispatch);
			_enabled=false;
			_hitArea=null;
			_target=null;
		}
		
	}
}