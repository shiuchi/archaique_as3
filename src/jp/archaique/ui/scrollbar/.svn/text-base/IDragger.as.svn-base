package jp.archaique.ui.scrollbar
{
	import flash.display.Sprite;
	
	public interface IDragger
	{
		function init():void;
		function kill():void;
		function reSize(ratio:Number):void;
		
		function get img():Sprite;
		function get activeRange():Number;//可動範囲
		function get width():Number;
		function get height():Number;
		function get wheelSpeed():Number;
		function get position():Number;//移動量
		function get initialPosition():Number;//初期位置
		
		function set img(value:Sprite):void;
		function set activeRange(value:Number):void;
		function set width(value:Number):void;
		function set height(value:Number):void
		function set wheelSpeed(value:Number):void;
		
		
		
		function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void;
	}
}