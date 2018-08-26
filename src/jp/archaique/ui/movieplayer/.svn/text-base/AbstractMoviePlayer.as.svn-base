package jp.archaique.ui.movieplayer
{
	import fl.video.FLVPlayback;
	
	import flash.events.EventDispatcher;

	internal class AbstractMoviePlayer extends EventDispatcher
	{
		
		protected var _video:FLVPlayback;
		protected var _seekBar:SeekBar;
		protected var _seekBarPoint:SeekBarPoint;
		protected var _buffringBar:BuffringBar;
		protected var _soundMuteButton:SoundMuteButton;
		protected var _playAndPauseButton:PlayAndPauseButton;
		protected var _forwardButton:ForwardButton;
		protected var _source:String;
		
		public function AbstractMoviePlayer( video:FLVPlayback )
		{
			_video=video;	
		}
		
		//----------------------------------
		// getter
		//----------------------------------
		
		public function get seekBar():SeekBar
		{
			return _seekBar;
		}
		
		public function get seekBarPoint():SeekBarPoint
		{
			return _seekBarPoint;
		}
		
		public function get buffringBar():BuffringBar
		{
			return _buffringBar;
		}
		
		public function get soundMuteButton():SoundMuteButton
		{
			return _soundMuteButton;
		}
		
		public function get playAndPauseButton():PlayAndPauseButton
		{
			return _playAndPauseButton;
		}
		
		public function get forwardButton():ForwardButton
		{
			return _forwardButton;
		}
		
		public function get source():String
		{
			return _source;
		}
		
		//----------------------------------
		// setter
		//----------------------------------
		
		public function set video( value:FLVPlayback ):void
		{
			_video=value;
		}
		
		public function set seekBar( value:SeekBar ):void
		{
			_seekBar=value;
		}
		
		public function set seekBarPoint( value:SeekBarPoint ):void
		{
			_seekBarPoint=value;
		}
		
		public function set buffringBar( value:BuffringBar ):void
		{
			_buffringBar=value;
		}
		
		public function set soundMuteButton( value:SoundMuteButton ):void
		{
			_soundMuteButton=value;
		}
		
		public function set playAndPauseButton( value:PlayAndPauseButton ):void
		{
			_playAndPauseButton=value;
		}
		
		public function set forwardButton( value:ForwardButton ):void
		{
			_forwardButton=value;
		}
		
		public function set source( value:String):void
		{
			_source=value;
		}
		
		
		public function kill():void
		{
			_video=null;
			_seekBar=null;
			_seekBarPoint=null;
			_buffringBar=null;
			_soundMuteButton=null;
			_playAndPauseButton=null;
		}
		
		
	}
}