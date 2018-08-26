package jp.archaique.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import jp.archaique.loader.loaderasset.LoaderAsset;
	
	
	public class ImgLoaderCommend extends EventDispatcher
	{
		
		
		private var _loaders:Array;
		private var _imgs:Array;
		private var _assests:Array;
		
		private var count:int=0;
		private var load_flg:Boolean;
		
		public function ImgLoaderCommend()
		{
			_loaders=[];
			_imgs=[];
			_assests=[];
		}
		
		public function addRequest(_request:URLRequest, _context:LoaderContext=null):LoaderAsset
		{
			var _loader:ImgLoader=new ImgLoader();
			_loader.request=_request;
			_loader.context=_context;
			_loaders.push(_loader);
			
			var _assest:LoaderAsset=new LoaderAsset(_loader);
			_assests.push(_assest);
			
			return _assest;
				
		}
		
		public function load():void
		{
			
			load_flg=true;
			_load();
			
		}
		
		//load処理を中止します
		public function close():void
		{
			load_flg=false;
		}
		
		public function get imgs():Array
		{
			return _imgs;
		}
		
		public function kill():void
		{
			_loaders=null;
			_imgs=null;
			_assests=null;
		}
		
		private function _load():void
		{
			if(load_flg){
				if(count<_loaders.length)
				{
					var loader:ImgLoader=_loaders[count];
					loader.addEventListener(Event.INIT,onLoadInit);
					loader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
					loader.load();
				}
				else
				{
					dispatchEvent(new Event(Event.INIT));
					dispatchEvent(new Event(Event.COMPLETE));
					count=0;
				}
			}
		}
		
		private function onLoadInit(event:Event):void
		{
			var loader:ImgLoader=event.target as ImgLoader;
			loader.removeEventListener(Event.INIT,onLoadInit);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			_imgs[count]=loader.img;
			LoaderAsset(_assests[count]).setImg(loader.img, loader);
			loader.kill();
			count++;
			
			if(count<_loaders.length)
			{
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false, false, count, _loaders.length));
			}
			_load();
		}

		private function onLoadError(event:IOErrorEvent):void
		{
			var loader:ImgLoader=event.target as ImgLoader;
			loader.removeEventListener(Event.INIT,onLoadInit);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			_imgs[count]=null;
			loader.unLoad();
			loader.kill();
			count++;
			
			if(count<_loaders.length)
			{
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, count, _loaders.length));
			}
			
			dispatchEvent(event);
			_load();
		}
	}
}