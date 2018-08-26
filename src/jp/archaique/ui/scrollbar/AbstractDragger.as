package jp.archaique.ui.scrollbar
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;

	public class AbstractDragger extends EventDispatcher implements IDragger
	{
		protected var _img:Sprite;
		protected var _activeRange:Number;
		protected var _wheelSpeed:Number=5;
		
		protected var _position:Number;
		protected var _initialPosition:Number;
		
		public function AbstractDragger( _img:Sprite, _activeRange:Number)
		{	
			this._img=_img;
			this._activeRange=_activeRange;
			
		}
		
		public function init():void
		{
		}
		
		public function kill():void
		{
			_img=null;
			_activeRange=NaN;
			_wheelSpeed=NaN;
			
			_position=NaN;
			_initialPosition=NaN;
		}
		
		public function reSize( ration:Number ):void
		{	
		}
		
		public function get img():Sprite
		{
			return _img;
		}
		
		public function get activeRange():Number
		{
			return _activeRange;
		}
		
		public function get width():Number
		{
			return _img.width;
		}
		
		public function get height():Number
		{
			return _img.height;
		}
		
		public function get wheelSpeed():Number
		{
			return _wheelSpeed;
		}
		
		public function get position():Number
		{
			return _position;
		}
		
		public function get initialPosition():Number
		{
			return _initialPosition;
		}
		
		
		public function set img(value:Sprite):void
		{
			_img=value;
		}
		
		public function set activeRange(value:Number):void
		{
			_activeRange=value;
		}
		
		public function set width(value:Number):void
		{
			_img.width=value;
		}
		
		public function set height(value:Number):void
		{
			_img.height=value;
		}
		
		public function set wheelSpeed(value:Number):void
		{
			_wheelSpeed=value;
		}
		
		
		
	}
}