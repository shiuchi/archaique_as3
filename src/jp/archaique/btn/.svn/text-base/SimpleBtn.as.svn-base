package jp.archaique.btn
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import jp.archaique.event.ViewEvent;
	
	public class SimpleBtn extends AbstractBtn implements ISimpleBtn 
	{	
		public function SimpleBtn( target:DisplayObject, id:String )
		{
			super( target, id);
		}
		
		override public function toString():String
		{
			return "[object SimpleBtn]";
		}
		
		//-----------------------------------------------
		// getter-setter
		//-----------------------------------------------
		
		override public function set hitArea(value:Sprite):void
		{
			removeListener();
			super.hitArea=value;
			addListener();
		}
		
		override public function set enabled(value:Boolean):void
		{
			if(value)
				addListener();
			else
				removeListener();
			super.enabled=value;
		}
		
		//-----------------------------------------------
		// public
		//-----------------------------------------------
		
		override public function show():void
		{
			enabled=true;
			dispatchEvent(new ViewEvent(ViewEvent.SHOW));
		}
		
		override public function hide():void
		{
			enabled=false;
			dispatchEvent(new ViewEvent(ViewEvent.HIDE));
		}
		
		override public function kill():void
		{
			enabled=false;
			super.kill();
		}
		
		//-----------------------------------------------
		// protected
		//-----------------------------------------------
		
		protected function addListener():void
		{
			 if(!_hitArea)
				_hitArea=_target as Sprite; 
			
			_hitArea.buttonMode=true;
			_hitArea.useHandCursor=true;
			_hitArea.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
			
		}
		
		protected function removeListener():void
		{
			if(_hitArea)
			{
				_hitArea.removeEventListener(MouseEvent.CLICK, onClick);
				_hitArea.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				_hitArea.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				_hitArea.buttonMode=false;
				_hitArea.useHandCursor=false;
			}
		}
		
		protected function onClick( event:MouseEvent ):void
		{
			dispatchEvent(event);
		}
		
		protected function onMouseOver( event:MouseEvent ):void
		{
			dispatchEvent(event);
		}
		
		protected function onMouseOut( event:MouseEvent ):void
		{
			dispatchEvent(event);
		}
		
	}
}