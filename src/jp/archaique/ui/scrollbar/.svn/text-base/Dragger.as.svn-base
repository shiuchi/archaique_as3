package jp.archaique.ui.scrollbar
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;

	public class Dragger extends AbstractDragger implements IDragger
	{
		protected var _macScroll:Boolean;
		protected var _moveRect:Rectangle;
		//とりあえず、scrollのみ設定しておこう
		
		public function Dragger(_img:Sprite, _activeRange:Number)
		{
			super(_img, _activeRange);
		}
		
		override public function init():void
		{
			_img.buttonMode=true;
			_img.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_initialPosition=_img.y;
			
			//macに対応させる設定の時のみ
			if(_macScroll)
				ExternalInterface.addCallback("externalMouseEvent", onMouseWheelFunc);
		}
		
		override public function kill():void
		{
			_img.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_img.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.removeEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			_img.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.stage.removeEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			
			macScroll=false;
			super.kill();
		}
		
		override public function reSize( ratio:Number ):void
		{
			//サイズ変更
			if(ratio<1){
				_img.height=_activeRange*ratio;
			}else{
				_img.visible=false;
			}	
			_moveRect=makeActiveRect();
		}
		
		
		private function onMouseDown(event:MouseEvent):void
		{
			//スクロールスタート
			_img.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			
			_img.startDrag(false, _moveRect);
			_img.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.addEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			
			//dragger以外の場所でマウスを放しても反応する様にstageに設定
			_img.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.stage.addEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
		}
		
		private function onMouseUp( event:MouseEvent ):void
		{
			//スクロール終了
			_img.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.removeEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			_img.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_img.stage.removeEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			_img.stopDrag();
			
			//再度クリックeventを受け取る様に設定
			_img.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			dispatchEvent( event );
			
		}
		
		private function activeScroll( event:MouseEvent ):void
		{
			_position=_img.y-_initialPosition;
			dispatchEvent( event );
		}
		
		private function onMouseWheelFunc( delta:Number ):void
		{
			
			if(_img.visible==true)
			{
				_img.y-=delta*wheelSpeed;
				if(_img.y<_initialPosition)
				{
					_img.y=_initialPosition;
				}
				else if(_img.y>=_activeRange-_img.height+_initialPosition)
				{
					_img.y=_activeRange-_img.height+_initialPosition;
				}
			}
				
			
			_position=_img.y-_initialPosition;
			dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
		}
		
		//mac用にwheelの設定をします
		public function get macScroll():Boolean
		{
			return _macScroll;
		}
		
		public function set macScroll(value:Boolean):void
		{
			_macScroll=value;
		}
		
		//化可動範囲を設定します。
		protected function makeActiveRect():Rectangle
		{
			var rect:Rectangle=new Rectangle();
			
			rect.height=_activeRange-_img.height;
			rect.x=_img.x;
			rect.y=_img.y;
			return rect;
		}
	}
}