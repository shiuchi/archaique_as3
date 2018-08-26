package jp.archaique.btn
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public interface ISimpleBtn
	{	
		function set target(value:DisplayObject):void;
		function get target():DisplayObject;
		
		function set id(value:String):void;
		function get id():String;
		
		function set enabled(value:Boolean):void;
		function get enabled():Boolean;
		
		function set hitArea(value:Sprite):void;
		function get hitArea():Sprite;
		
		function toString():String;
		function show():void;
		function hide():void;
		function kill():void;
		
		function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void;	 
	
	}
}