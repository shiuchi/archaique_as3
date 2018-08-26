package jp.archaique.loader.loadingmanager
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	
	import jp.archaique.event.ViewEvent;
	
	/*
	//loadingの処理を行うクラス 
	//一つめの引数にloader,eventdispatchを,二つめにそのそのloaderが読み込む対象が全て読み込まれたときに全体の何％にあたるを設定できる
	*/
	
	public class LoadingManager extends EventDispatcher
	{
		private static var Instance:LoadingManager;
		
		private var _loaders:Array;
		private var _view:ILoadingView;
		private var _count:int=0;
		private var _par:Number=0;
		
		public function LoadingManager(c:PrivateClass)
		{
		}
		
		public static function get instance():LoadingManager
		{
			if(!Instance)
			{
				Instance=new LoadingManager(new PrivateClass())
			}
			return Instance;
		}
		
		public function init():void
		{
			if(_view)
			{
				_view.addEventListener(Event.INIT,_init);
				_view.init();
			}
		}
		
		public function show():void
		{
			if(_view)
			{
				_view.addEventListener(ViewEvent.SHOWED,showed);
				_view.show();
			}
		}
		
		public function hide():void
		{
			if(_view)
			{
				_view.addEventListener(ViewEvent.HID,hid);
				_view.hide();
			}
		}
		
		public function kill():void
		{
			_view.kill();
			_view=null;
			_loaders=null;
		}
		
		public function add(loader:EventDispatcher, ratio:Number=1, finalaize:Boolean=false):void
		{	
			if(_loaders==null)
			{
				_loaders=new Array();
			}
			_loaders.push({loader:loader,ratio:ratio, finalaize:finalaize});
			loader.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
			loader.addEventListener(Event.INIT,onLoadInit);
		}
		
		public function addView(_view:ILoadingView):void
		{	
			this._view=_view;
		}
		
		//--------------------------------------------------------------------------------------------------
		
		private function _init(e:Event):void
		{
			_view.removeEventListener(Event.INIT,_init);
			dispatchEvent(new Event(Event.INIT));
		}
		
		private function showed(e:ViewEvent):void
		{
			_view.removeEventListener(ViewEvent.SHOWED,showed);
			dispatchEvent(new ViewEvent(ViewEvent.SHOWED));
		}
		
		private function hid(e:ViewEvent):void
		{
			_view.removeEventListener(ViewEvent.HID,hid);
			dispatchEvent(new ViewEvent(ViewEvent.HID));
		}
		
		private function onLoadProgress(e:ProgressEvent):void
		{
			if(_view){
				var rate:Number=_loaders[_count].ratio;
				var _loaded:Number=(e.bytesLoaded/e.bytesTotal);			
				
				var p:Number;
				if(_loaded as Number)
				{
					p=_par+_loaded*rate;
				}
				else
				{
					p=_par;
				}
				_view.onLoadProgress(p);
			}
		}
		
		private function onLoadInit(e:Event):void
		{
			//trace("yonda")
			if(_view){
				//listener解除
				e.target.removeEventListener(ProgressEvent.PROGRESS,onLoadProgress);
				e.target.removeEventListener(Event.INIT,onLoadInit);
				
				var rate:Number=_loaders[_count].ratio;
				_par+=rate;
				//trace("par="+_par);
				//もし最後のloaderなら
				if(_loaders[_count].finalaize)
				{
					_view.onLoadInit(_par);
				}
				else
				{
					_view.onLoadProgress(_par);
				}
				_count++;
			}
		}
		
		private function onLoadComplete(e:Event):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}

class PrivateClass
{
}