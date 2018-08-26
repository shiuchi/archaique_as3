package jp.archaique.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	
	import jp.archaique.loader.loaderasset.LoaderAsset;

	public class XmlLoaderCommed extends EventDispatcher
	{
		private var _loaders:Array;
		private var _xmls:Array;
		private var _datas:Array;
		private var _assests:Array;
		
		private var count:int=0;
		private var load_flg:Boolean;
		
		public function XmlLoaderCommed()
		{
			_loaders=[];
			_xmls=[];
			_datas=[];
			_assests=[];
		}
		
		public function addRequest(request:URLRequest):LoaderAsset
		{
			var _loader:XmlLoader=new XmlLoader();
			_loader.request=request;
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
		
		public function close():void
		{
			load_flg=false;
		}
		
		public function get xmls():Array
		{
			return _xmls;
		}
		
		public function get datas():Array
		{
			return _datas;
		}
		
		
		
		public function kill():void
		{
			_loaders=null;
			_xmls=null;
			_datas=null;
			_assests=null;
			
		}
		
		//---処理系-------------------------------------------------------------------------------------
		
		private function _load():void
		{
			if(load_flg)
			{
				var len:int = _loaders.length;
				if(count<len)
				{
					var loader:XmlLoader=_loaders[count];
					loader.addEventListener(Event.INIT,onLoadInit);
					loader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
					loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError)
					loader.load();
				}
				else
				{
					dispatchEvent(new Event(Event.INIT));
					dispatchEvent(new Event(Event.COMPLETE));
				}
			}
		}
		
		private function onLoadInit(event:Event):void
		{
			var loader:XmlLoader=event.target as XmlLoader;
			loader.removeEventListener(Event.INIT,onLoadInit);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);

			_xmls[count]=loader.xml;
			_datas[count]=loader.data;
			LoaderAsset(_assests[count]).setData(loader.data, loader);
			LoaderAsset(_assests[count]).setXml(loader.xml, loader);
			loader.kill();
			count++;
			
			var len:int=_loaders.length;
			if(count<len)
			{
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, count, len));	
			}
			_load();
			
			
		}
		
		private function onLoadError(event:IOErrorEvent):void
		{
			var loader:XmlLoader=event.target as XmlLoader;
			loader.removeEventListener(Event.INIT,onLoadInit);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
			

			_xmls[count]=null;
			_datas[count]=null;
			loader.kill();
			
			count++;
			var len:int=_loaders.length;
			if(count<len)
			{
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, count, len));
			}
			dispatchEvent(event);
			_load();
		}
		
		private function onSecurityError(event:SecurityErrorEvent):void
		{
			var loader:XmlLoader=event.target as XmlLoader;
			loader.removeEventListener(Event.INIT,onLoadInit);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);

			_xmls[count]=null;
			_datas[count]=null;
			loader.kill();
			
			count++;
			var len:int=_loaders.length;
			if(count<len)
			{
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, count, len));
			}
			dispatchEvent(event);
			_load()
			
		}
		
	}
}