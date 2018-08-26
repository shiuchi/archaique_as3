package jp.archaique.motion
{
	internal interface IParameter
	{
		function init():void;
		function onUpdate(_engine:TweenEngine):void;
		function kill():void;
	}
}