package jp.archaique.transition
{
	import flash.display.DisplayObject;
	
	public interface ITransition extends ITransitionBase
	{
		
	
		function set target(value:DisplayObject):void;
		function set duration(value:Number):void;
		function set delay(value:Number):void;
		function set id(value:String):void;
		function set easing(value:Function):void;
		function set easeParams(value:Array):void
		function showComplete(value:Function, ...params):void;
		function hideComplete(value:Function, ...params):void;
		
		function get target():DisplayObject;
		function get duration():Number;
		function get delay():Number;
		function get id():String;
		function get easing():Function;
		function get easeParams():Array;
		function get state():String;//読み取り専用
	}
}