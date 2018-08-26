package jp.archaique.ui.movieplayer
{
	//----------------------------------
	// BuffringBarなクラス--SeekBarと同じだが…
	//----------------------------------
	
	import flash.display.Sprite;

	public class BuffringBar
	{
		private var _target:Sprite;
		
		public function BuffringBar( target:Sprite )
		{
			_target=target;
			initialize();
		}
		
		public function initialize():void
		{
			_target.scaleX=0;
		}
		
		public function set widthPercentage( value:Number ):void
		{
			_target.scaleX=value;
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