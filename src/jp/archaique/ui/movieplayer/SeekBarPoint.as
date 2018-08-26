package jp.archaique.ui.movieplayer
{
	
	//----------------------------------
	// SeekBarPointなクラス--hitAreaを使う場合は対象となるスプライトないにhitAreaとなるSpriteと入れておく事が必要
	//----------------------------------
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class SeekBarPoint extends EventDispatcher
	{
		private var _target:Sprite;
		private var _moveRectangle:Rectangle;//稼働範囲
		private var _possibleRect:Rectangle;//バッファ時に移動する事が出来る範囲
		private var _hitArea:Sprite;
		private var zeroPoint:Number;//稼働範囲の0にあたる座標
		private var _enabled:Boolean=false;//ボタン設定
		private var _position:Number;//再生位置
		//private var _direction:String;//縦方向か横方向か
	
		//rectがこのインスタンスの稼働範囲となります
		public function SeekBarPoint(target:Sprite, moveRectangle:Rectangle)
		{
			_target=target;
			_moveRectangle=moveRectangle;
			//_direction=direction;
			//初期化
			initialize();
		}
		
		public function initialize():void
		{
			//ポジションを初期位置に
			_target.x=_moveRectangle.x;
			_target.y=_moveRectangle.y;
			zeroPoint=_moveRectangle.x;
		}
		
		public function kill():void
		{
			_hitArea.removeEventListener(MouseEvent.MOUSE_OVER, dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_OUT,dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_hitArea.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			
			_hitArea.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_hitArea.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_hitArea.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			
			//_direction=null;
			_enabled=false;
			_hitArea=null;
			_moveRectangle=null;
			_position=NaN;
			_possibleRect=null;
			_target=null;
			zeroPoint=NaN;
		}
	
		//-----------------------------------
		// getter
		//-----------------------------------
		
		public function get target():Sprite
		{
			return _target;
		}
		
		public function get hitArea():Sprite
		{
			return _hitArea;
		}
		
		public function get position():Number
		{
			return _position;
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function get moveRectangle():Rectangle
		{
			return _moveRectangle;
		}
		
		//-----------------------------------
		// setter
		//-----------------------------------
		
		public function set target( value:Sprite):void
		{
			_target=value;
		}
		
		public function set hitArea( value:Sprite ):void
		{
			removeListener();
			_hitArea=value;
			addListener();
		}
		
		public function set possibleRect( value:Rectangle ):void
		{
			_possibleRect=value;
		}
		
		public function set position( value:Number ):void
		{
			_position=value;
			var seekPoint:Number;
			//位置変更
			seekPoint=_moveRectangle.width*(value/100)+zeroPoint;
			_target.x=seekPoint;
		}
		
		public function set enabled( value:Boolean ):void
		{
			_enabled=value;
			if (value)
				addListener();
			else
				removeListener();
		}
		
		//-----------------------------------
		// private
		//-----------------------------------
		
		
		private function onMouseDown(event:MouseEvent):void
		{
			_hitArea.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_target.startDrag(false, _moveRectangle);
			_hitArea.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, false, 0, true);
			_hitArea.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove ,false, 0, true );
			//dragger以外の場所でマウスを放しても反応する様にstageに設定
			_target.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp, false, 0, true);
			_target.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove, false, 0, true);
			dispatch(event);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			//移動できる範囲を制限
			if (_possibleRect.width+zeroPoint < _target.x)
			{
				_target.x=_possibleRect.width+zeroPoint;
			}
			dispatch(event);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			_hitArea.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_hitArea.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			_hitArea.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_hitArea.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			_hitArea.stopDrag();
			
			
			
			//再度クリックeventを受け取る様に設定
			_hitArea.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			
			//自分のポジション割り出す
			calculatePosition();
			dispatchEvent( event );
		}
		
		//自分のpositionを割り出す
		private function calculatePosition():void
		{
			_position=(_target.x/_moveRectangle.width-zeroPoint)*100;
		}
		
		private function addListener():void
		{
			if (!_hitArea)
				_hitArea=_target;
			_hitArea.buttonMode=true;
			_hitArea.useHandCursor=true;
			_hitArea.addEventListener(MouseEvent.MOUSE_OVER, dispatch, false, 0, true);
			_hitArea.addEventListener(MouseEvent.MOUSE_OUT,dispatch, false, 0, true);
			_hitArea.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown, false, 0, true);
		}
		
		private function removeListener():void
		{
			_hitArea.mouseEnabled=false;
			_hitArea.useHandCursor=false;
			_hitArea.removeEventListener(MouseEvent.MOUSE_OVER, dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_OUT,dispatch);
			_hitArea.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_hitArea.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function dispatch( event:MouseEvent ):void
		{
			dispatchEvent(event);
		}
	}
}