package jp.archaique.btn
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	import jp.archaique.transition.ITransitionBase;

	internal class AbstractBtn extends EventDispatcher implements ISimpleBtn
	{
		
		protected var _target:DisplayObject;
		protected var _id:String;
		protected var _enabled:Boolean;
		protected var _hitArea:Sprite;
		
		public function AbstractBtn( target:DisplayObject, id:String)
		{
			_target=target;
			_id=id;
		}
		
		override public function toString():String
		{
			return "[object AbstractBtn]";
		}
		
		public function show():void
		{
		}
		
		public function hide():void
		{
		}
		
		public function kill():void
		{
			_target=null;
			_id=null;
			_enabled=false;
			_hitArea=null;
		}
		
		public function set target(value:DisplayObject):void
		{
			_target=value;
		}
		
		public function get target():DisplayObject
		{
			return _target;
		}
		
		public function set id(value:String):void
		{
			_id=value;
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled=value;
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set hitArea(value:Sprite):void
		{
			_hitArea=value;
		}
		
		public function get hitArea():Sprite
		{
			return _hitArea;
		}
		
	}
}