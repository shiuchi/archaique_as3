package jp.archaique.loader.loadingmanager
{
	public interface ILoadingView
	{
		function init():void;
		function show():void;
		function onLoadProgress(_par:Number):void;
		function onLoadInit(_par:Number):void;
		function hide():void;
		function kill():void;
		function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void;	
		
	}
}