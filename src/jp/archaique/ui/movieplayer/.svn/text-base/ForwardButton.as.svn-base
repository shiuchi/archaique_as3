package jp.archaique.ui.movieplayer
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;

	public class ForwardButton extends EventDispatcher
	{
		
		private var _target:Sprite
		private var _enabled:Boolean;
		private var _hitArea:Sprite;
		
		public function ForwardButton( target:Sprite )
		{
			_target=target;
		}
		//初期化
		public function initialize():void
		{
			removeListener()
			enabled=true;
		}
		
		public function set target(value:Sprite):void
		{
			_target=value;
		}
		
		public function get target():Sprite
		{
			return _target;
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled=value;
			if(_enabled)
				addListener();
			else
				removeListener();
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set hitArea(value:Sprite):void
		{
			removeListener();
			_hitArea=value;
			addListener();
		}
		
		public function get hitArea():Sprite
		{
			return _hitArea;
		}
		
		
		private function addListener():void
		{
			if (!_hitArea)
				_hitArea=_target;
			_hitArea.useHandCursor=true;
			_hitArea.buttonMode=true;
			_hitArea.addEventListener(MouseEvent.CLICK, dispatch);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT, dispatch);
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER,dispatch);
			
		}
		
		private function removeListener():void
		{
			if(_hitArea)
			{
				_hitArea.useHandCursor=false;
				_hitArea.buttonMode=false;
				_hitArea.removeEventListener(MouseEvent.CLICK, dispatch);
				_hitArea.removeEventListener(MouseEvent.MOUSE_OUT, dispatch);
				_hitArea.removeEventListener(MouseEvent.MOUSE_OVER,dispatch);
			}
		}
		
		private function dispatch( event:MouseEvent ):void
		{	
			dispatchEvent(event);
		}
		
		public function kill():void
		{
			_enabled=false;
			_target=null;
			_hitArea=null;
			
		}
		
	}
}