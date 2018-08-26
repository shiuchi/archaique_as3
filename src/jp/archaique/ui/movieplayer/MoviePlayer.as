package jp.archaique.ui.movieplayer
{
	//------------------------------------------------
	// flvPlayBackと個々のボタンの結びつけを行うクラス--最低限しかない
	//------------------------------------------------
	
	
	import fl.video.FLVPlayback;
	import fl.video.VideoEvent;
	import fl.video.VideoProgressEvent;
	
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class MoviePlayer extends AbstractMoviePlayer
	{
		private var _state:String;
		
		public function MoviePlayer(video:FLVPlayback)
		{
			//videoのreadyEventを受け取ったらinitを起こす
			video.addEventListener(VideoEvent.READY, onReadyHandler, false, 0, true);
			video.addEventListener(VideoProgressEvent.PROGRESS, onProgressEventHajdler, false,0 ,true);
			video.addEventListener(VideoEvent.PLAYHEAD_UPDATE, onPlayHeadUpdateHandler ,false, 0, false);
			video.addEventListener(VideoEvent.COMPLETE, onCompleteHandler, false, 0, true);
			super(video);
		}
		
		//再生準備完了時init的な
		private function onReadyHandler(event:VideoEvent):void
		{
			if (_seekBarPoint)
				_seekBarPoint.enabled=true;
			if (_soundMuteButton)
				_soundMuteButton.enabled=true;
			
			if (_playAndPauseButton)
			{
				if (_video.autoPlay)
					_playAndPauseButton.state=PlayButtonState.PLAYING;
				else
					_playAndPauseButton.state=PlayButtonState.PAUSED;
				_playAndPauseButton.enabled=true;
			}
			
			if (_forwardButton)
				_forwardButton.enabled=true;
			
		}
		
		//再生完了
		private function onCompleteHandler( event:VideoEvent ):void
		{
			//終わったら最初に戻す
			_video.seekPercent(0);
			//playボタンも大気状態にする
			if (_playAndPauseButton)
				_playAndPauseButton.state=PlayButtonState.PAUSED;
			//音も戻す
			setVolume(1);
			if (_soundMuteButton)
				_soundMuteButton.state=SoundState.PlAYING;
		}
		
	
		//----------------------------------
		// setter
		//----------------------------------
		
		//flvの切り替え
		override public function set source(value:String):void
		{
			if(_source==value)
				return;
			super.source=value;
			if (_buffringBar)
				_buffringBar.initialize();
			if (_seekBar)
				_seekBar.initialize();
			if (_seekBarPoint)
				_seekBarPoint.initialize();
			if (_soundMuteButton)
				_soundMuteButton.initialize();
			if (_playAndPauseButton)
				_playAndPauseButton.initialize();
			
			setVolume(1);
			_video.source=value;
			
		}
		
		override public function set seekBarPoint(value:SeekBarPoint):void
		{
			//seekBarPointにaddEventListener
			super.seekBarPoint=value;
			_seekBarPoint.addEventListener(MouseEvent.MOUSE_DOWN, onSeekBarPointDown, false, 0, true);
		}
		
		override public function set soundMuteButton(value:SoundMuteButton):void
		{
			super.soundMuteButton=value;
			_soundMuteButton.addEventListener(MouseEvent.CLICK, onSoundMuteClick, false, 0, true);
		}
		
		override public function set playAndPauseButton(value:PlayAndPauseButton):void
		{
			super.playAndPauseButton=value;
			_playAndPauseButton.addEventListener(MouseEvent.CLICK, onPlayAndStopButtonClick, false, 0, true);
			
			if (_video.autoPlay)
				_playAndPauseButton.state=PlayButtonState.PLAYING;
		}
		
		override public function set forwardButton(value:ForwardButton):void
		{
			super.forwardButton=value;
			_forwardButton.addEventListener(MouseEvent.CLICK, onForwardClick,false, 0, true);
		}
		
		//forwardbutton関連
		public function onForwardClick(event:MouseEvent):void
		{
			_video.seekPercent(0);
		}
		
		//playButton関連
		private function onPlayAndStopButtonClick(event:MouseEvent):void
		{
			if (_playAndPauseButton.state==PlayButtonState.PLAYING)
				_video.play();
			else
				_video.pause();
				
		}
		
		//seekBar関連
		private function onPlayHeadUpdateHandler(event:VideoEvent):void
		{
			//seekBarのupdateを行う
			if (_seekBar)
				_seekBar.widthPercentage=_video.playheadPercentage;
			if (_seekBarPoint)
				_seekBarPoint.position=_video.playheadPercentage;
		}
		
		
		
		private function onSeekBarPointDown( event:MouseEvent ):void
		{
			
			//seekBarPointにaddEventListener
			_seekBarPoint.removeEventListener(MouseEvent.MOUSE_DOWN, onSeekBarPointDown);
			//videoを止める
			_video.removeEventListener(VideoEvent.PLAYHEAD_UPDATE, onPlayHeadUpdateHandler);
			_video.pause();
			
			_seekBarPoint.addEventListener(MouseEvent.MOUSE_UP, onSeekBarPointUp, false, 0, true);
		}
		
		private function onSeekBarPointUp(event:MouseEvent):void
		{
			//seekBarPointからremoveListener
			_seekBarPoint.removeEventListener(MouseEvent.MOUSE_UP, onSeekBarPointUp);
			
			_seekBarPoint.addEventListener(MouseEvent.MOUSE_DOWN,onSeekBarPointDown, false, 0, true);
			_video.addEventListener(VideoEvent.PLAYHEAD_UPDATE, onPlayHeadUpdateHandler ,false, 0, false);
			_video.seekPercent(_seekBarPoint.position);
			
			if (_playAndPauseButton.state==PlayButtonState.PLAYING)
				_video.play();
			
			_state=_video.state;
		}
		
		//buffer関連
		private function onProgressEventHajdler(event:VideoProgressEvent):void
		{
			var par:Number=event.bytesLoaded/event.bytesTotal;
			
			if (_buffringBar)
				_buffringBar.widthPercentage=par;
			if (_seekBarPoint)
			{
				var rect:Rectangle=_seekBarPoint.moveRectangle;
				_seekBarPoint.possibleRect=new Rectangle( rect.x, rect.y, rect.width*par, rect.height );
			}
		}
		
		//sound関連
		private function onSoundMuteClick(event:MouseEvent):void
		{
			if (_soundMuteButton.state==SoundState.PlAYING)
				setVolume(1);
			else
				setVolume(0);
		}
		
		//volume調節
		private function setVolume( volume:Number ):void
		{
			_video.volume=volume;
		}
		
		//kill関連
		
		private function removeListener():void
		{
			_video.removeEventListener(VideoEvent.READY, onReadyHandler);
			_video.removeEventListener(VideoProgressEvent.PROGRESS, onProgressEventHajdler);
			_video.removeEventListener(VideoEvent.PLAYHEAD_UPDATE, onPlayHeadUpdateHandler);
			_seekBarPoint.removeEventListener(MouseEvent.MOUSE_DOWN, onSeekBarPointDown);
			_seekBarPoint.removeEventListener(MouseEvent.MOUSE_UP, onSeekBarPointUp);
			_soundMuteButton.removeEventListener(MouseEvent.CLICK, onSoundMuteClick);
			_playAndPauseButton.removeEventListener(MouseEvent.CLICK, onPlayAndStopButtonClick);
			_forwardButton.removeEventListener(MouseEvent.CLICK, onForwardClick);
			_video.removeEventListener(VideoEvent.COMPLETE, onCompleteHandler);
		}
		
		override public function kill():void
		{
			removeListener();
			super.kill();
		}
		
	}
}