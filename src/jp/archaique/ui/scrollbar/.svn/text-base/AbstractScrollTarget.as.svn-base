package jp.archaique.ui.scrollbar
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	internal class AbstractScrollTarget implements IScrollTarget
	{
		
		protected var _targtMc:Sprite;
		protected var _maskMc:Sprite;
		protected var _initialPosition:Number;
		
		public function AbstractScrollTarget( _targtMc:Sprite)
		{
			this._targtMc=_targtMc;
		}
		
		public function get targtMc():Sprite
		{
			return _targtMc;
		}
		
		public function get initialPosition():Number
		{
			return _initialPosition;
		}
		
		public function get maskMc():Sprite
		{
			return _maskMc;
		}
		
		public function set targtMc(value:Sprite):void
		{
			_targtMc=value;
		}
		
		internal function init():void
		{
		}
		
		internal function kill():void
		{
			_targtMc=null;
			_initialPosition=NaN;
			_maskMc=null;
		}
		
		internal function activeScroll(position:Number, duraction:Number=0, easing:Function=null):void
		{
		}
		
	}
}