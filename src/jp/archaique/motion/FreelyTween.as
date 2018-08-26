package jp.archaique.motion
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import org.goasap.events.GoEvent;
	import org.goasap.interfaces.IPlayable;
	
	public class FreelyTween extends EventDispatcher implements IPlayable
	{
		
		private static var _Tweens:Dictionary=new Dictionary();
		
		private var _engine:TweenEngine;
		private var _target:*;
		private var _parameterManager:ParameterManager;
		private var _state:String;//読み取り専用
		private var _sequence:FreelySequence;
		
		public function FreelyTween( target:*, sequence:FreelySequence=null )
		{	
			_target=target;
			_sequence=sequence;
			_state=TweenState.STOPPED;
			_engine=new TweenEngine();
			addListener();
			_parameterManager=new ParameterManager();
			_engine.parameterManager=_parameterManager;
			registerTween(this);
		}
		
		public function get state():String
		{
			return _state;
		}
		
		//---------------------------------------------------------  
		//   static
		//--------------------------------------------------------- 
		
		public static function target( target:* ):FreelyTween
		{
			return new FreelyTween( target );
		}
		
		public static function removeTween( tween:FreelyTween ):void
		{
			tween.kill();
		}
		 
		public static function removeAllTween():void
		{
			var tween:FreelyTween;
			for each( tween in _Tweens)
			{
				tween.kill();
			}
		}
		
		//dictionaryにTweenを登録
		internal static function registerTween( tween:FreelyTween ):void
		{
			_Tweens[tween]=tween;
		}
		
		//dictionaryからTweenを削除します
		internal static function deleteTween( tween:FreelyTween ):void
		{
			var deleteTween:FreelyTween;
			if(_Tweens[tween])
			{
				deleteTween=_Tweens[tween] as FreelyTween;
				delete _Tweens[tween];
			}	
		}
		
		//---------------------------------------------------------  
		//   public
		//--------------------------------------------------------- 
		
		public function start():Boolean
		{
			if (_state!=TweenState.STOPPED || _state==TweenState.KILLED)
				return false;
			
			if (!_sequence)
			{
				run();
			}
			else if (_sequence.state!=TweenState.PLAYING)
			{
				_sequence.start();
			}
			else 
			{
				run();
			}
			return true;
		}
		
		private function run():void
		{
			_state=TweenState.PLAYING;
			_parameterManager.init();
			_engine.start();
		}
		
		public function pause():Boolean
		{
			if (_state!=TweenState.PLAYING || _state==TweenState.KILLED)
				return false;
				
			_state=TweenState.PAUSED;
			return	_engine.pause();
		}
		
		public function resume():Boolean
		{
			if (_state!=TweenState.PAUSED || _state==TweenState.KILLED)
				return false;
				
			_state=TweenState.PLAYING;
			return _engine.resume();
		}
		
		public function skipTo( number:Number ):Boolean
		{
			//実装予定なし
			return false;
		}
		
		public function stop():Boolean
		{
			if (_state==TweenState.STOPPED || _state==TweenState.KILLED)
				return false;
			return _engine.stop();
			kill();
		}
		
		private function kill():void
		{
			removeListener();
			_parameterManager.kill();
			_engine.kill();
			_target=null;
			_parameterManager=null;
			_engine=null;
			_state=TweenState.KILLED;
			deleteTween(this);
			if(_sequence)
				_sequence.kill();
		}
		
		public function and( target:* ):FreelyTween
		{
			if (!_sequence)
				_sequence=new FreelySequence();
				
			var childTween:FreelyTween=new FreelyTween(target, _sequence);
			_sequence.addGroup( this, childTween);
			return childTween;
		}
		
		public function next( target:* ):FreelyTween
		{
			if(!_sequence)
			{
				_sequence=new FreelySequence();
				_sequence.addSequence(this);
			}	
			var childTween:FreelyTween=new FreelyTween(target, _sequence);
			_sequence.addSequence(childTween);
			return childTween;
		}
		
		//---------------------------------------------------------  
		//   プロパティ
		//--------------------------------------------------------- 
		
		public function duraction( value:Number ):FreelyTween
		{
			_engine.duration=value;
			return this;
		}
		
		public function delay( value:Number ):FreelyTween
		{
			_engine.delay=value;
			return this;
		}
		
		public function easing( value:Function ):FreelyTween
		{
			_engine.easing=value;
			return this;
		}
		
		public function extraEasingParams( value:Array ):FreelyTween
		{
			_engine.extraEasingParams;
			return this;
		}
		
		public function useRounding( value:Boolean ):FreelyTween
		{
			_engine.useRounding=value;
			return this;
		}
		
		public function useFrames( value:Boolean ):FreelyTween
		{
			_engine.useFrames=value;
			return this;
		}
		
		//---------------------------------------------------------  
		//   パラメーター
		//--------------------------------------------------------- 
		
		public function x( value:Number, idd:String,useRelative:Boolean=false ):FreelyTween
		{
			var x:XTO=new XTO( _target, idd,value, useRelative );
			_parameterManager.addParameter(x);
			return this;
		}
		
		//---------------------------------------------------------  
		//   event
		//--------------------------------------------------------- 
		
		private function addListener():void
		{
			_engine.addEventListener(GoEvent.START, dispatch);
			_engine.addEventListener(GoEvent.STOP, dispatch);
			_engine.addEventListener(GoEvent.COMPLETE, dispatch);
			_engine.addEventListener(GoEvent.PAUSE, dispatch);
			_engine.addEventListener(GoEvent.RESUME, dispatch);
		}
		
		private function removeListener():void
		{
			_engine.removeEventListener(GoEvent.START, dispatch);
			_engine.removeEventListener(GoEvent.STOP, dispatch);
			_engine.removeEventListener(GoEvent.COMPLETE, dispatch);
			_engine.removeEventListener(GoEvent.PAUSE, dispatch);
			_engine.removeEventListener(GoEvent.RESUME, dispatch);
		}
		
		private function dispatch( event:GoEvent ):void
		{
			if(event.type==GoEvent.COMPLETE || event.type==GoEvent.STOP){
				stop();
				trace("stop");
			}
			dispatchEvent(new GoEvent(event.type)); 
		}

	}
}