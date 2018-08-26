package jp.archaique.motion
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import org.goasap.events.GoEvent;
	import org.goasap.interfaces.IPlayable;
	import org.goasap.utils.PlayableGroup;
	
	internal class FreelySequence extends EventDispatcher implements IPlayable
	{
		
		private var _state:String=TweenState.STOPPED;
		
		private var _tweens:Dictionary=new Dictionary();//sequenecに関係ある全てのTween
		private var _group:Dictionary=new Dictionary();//PlayableGroup関するTween
		private var _sequence:Array=[];
		private var _playCount:int;
		
		public function FreelySequence()
		{
			trace("make sequence");
		}
		
		public function get state():String
		{
			return _state;
		}
		
		
		
		public function addGroup( tween:FreelyTween , childTween:FreelyTween ):Boolean
		{
			//既に実行中ならば受け付けない
			if (_state!=TweenState.STOPPED)
				return false;
			
			//まず登録する
			if (!_tweens[tween])
				_tweens[tween]=tween;
	
			var group:PlayableGroup;
			if (!_group[tween])
			{
				trace("ないよ");
				//既に自分がgroupとして登録されていなければグループnewし、自分と子を登録
				group=new PlayableGroup([tween,childTween]);
				//group.addChild();
				_group[tween]=group;
				_group[childTween]=group;
				_sequence.push(group);
			}
			else
			{
				
				trace("あるよ");
				group=_group[tween] as PlayableGroup;
				group.addChild(childTween);
				_group[childTween]=group;
			}	
			_tweens[childTween]=childTween;
			return true;
		}
		
		public function addSequence( tween:FreelyTween ):Boolean
		{
			if (_state!=TweenState.STOPPED)
				return false;
			
			if (!_tweens[tween])
				_tweens[tween]=tween;
				
			_sequence.push(tween);
			return true;
		}
		
		public function start():Boolean
		{
			//停止中の状態のみ、受け付ける
			if(_state!=TweenState.STOPPED)
				return false;
			
			_state=TweenState.PLAYING;
			execute();
			return true;
			
		}
		
		private function execute():Boolean
		{
			//実行中のみ始動する
			if(_state!=TweenState.PLAYING)
				return false;
				
			if (_playCount<_sequence.length)
			{
				_state=TweenState.PLAYING;
				if (_sequence[_playCount] is FreelyTween)
				{
					_sequence[_playCount].addEventListener(GoEvent.COMPLETE, completeEventHandler);
					_sequence[_playCount].start();
				}
				else
				{
					_sequence[_playCount].addEventListener(GoEvent.COMPLETE, completeEventHandler);
					PlayableGroup(_sequence[_playCount]).start();
				}				
			}
			else
			{
				dispatchEvent(new GoEvent(GoEvent.COMPLETE));		
				stop();
			}
			return true;
		}
		
		public function pause():Boolean
		{
			//実行中のみ機能させる
			if (_state!=TweenState.PLAYING)
				return false;
			
			_state=TweenState.PAUSED;
			return true;
		}
		
		public function resume():Boolean
		{
			//PAUSED時のみ機能させる
			if (_state!=TweenState.PAUSED)
				return false;
			
			_state=TweenState.PLAYING;
			execute();
			return true;
		}
		
		public function skipTo( position:Number ):Boolean
		{
			//実装予定なし
			return false;
		}
		
		public function stop():Boolean
		{
			//stopすることで、killします
			_state==TweenState.STOPPED;
			kill();
			return true;
		}
		
		private function completeEventHandler( event:GoEvent ):void
		{
			var group:IPlayable=event.target as IPlayable;
			group.removeEventListener(GoEvent.COMPLETE, completeEventHandler);
			
			_playCount++;
			execute();
		}
		
		public function kill():void
		{
			_sequence=null;
			_state=TweenState.KILLED;
			_tweens=null;
			_group=null;
			_playCount=NaN;
			trace("sequence_kill");
		}
		
		
		
	}
}