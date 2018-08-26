package jp.archaique.ui.movieplayer
{
	//----------------------------------
	// SeekBarなクラス
	//----------------------------------
	
	
	import flash.display.Sprite;
	
	public class SeekBar
	{
		private var _target:Sprite;
		
		public function SeekBar( target:Sprite )
		{
			_target=target;
			initialize();
		}
		
		public function initialize():void
		{
			widthPercentage=0;
		}
		
		public function  set widthPercentage( value:Number ):void
		{
			_target.scaleX=value/100;
		}
		
		public function get widthPercentage():Number
		{
			return _target.scaleX;
		}
		
		public function kill():void
		{
			_target=null;
		}
		
	}
}