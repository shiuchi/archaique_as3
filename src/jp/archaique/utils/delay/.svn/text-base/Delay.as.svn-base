package jp.archaique.utils.delay
{
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	//遅延実行クラス 指定されたduractionで_closureを実行します
	
	public class Delay
	{
		private static var _dictionary:Dictionary=new Dictionary();
		
		private var _closure:Function;
		private var _parm:Array;
		private var timer:Timer;
		
		public function Delay( _closure:Function, _duration:Number, _parm:Array=null )
		{
			if(_dictionary[this])
				_dictionary[this].kill();

			_dictionary[this]=this
			this._closure=_closure;
			this._parm=_parm;
			timer=new Timer(_duration*1000, 1);
			timer.addEventListener(TimerEvent.TIMER, timerEventHandler);
			timer.start();
		}
		
		public static function add( closure:Function, duration:Number, ...parm ):Delay
		{
			
			return new Delay(closure, duration, parm);
		}
		
		public static function remove( delay:Delay):void
		{
			if(_dictionary[delay])
				_dictionary[delay].kill();
		}
		
		private function timerEventHandler(event:TimerEvent):void
		{
			_closure.apply(null,_parm);
			kill();
		}
		
		public function kill():void
		{
			timer.removeEventListener(TimerEvent.TIMER, timerEventHandler);
			timer=null;
			_closure=null;
			_parm=null;
			delete _dictionary[this];
			
		} 
		
		
	}
}