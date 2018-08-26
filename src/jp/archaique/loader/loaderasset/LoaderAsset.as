package jp.archaique.loader.loaderasset
{
	import flash.display.DisplayObject;
	
	import jp.archaique.loader.ILoader;
	
	public class LoaderAsset
	{
		private var _img:DisplayObject;
		private var _xml:XML;
		private var _data:*;
		private var _loader:ILoader;
		
		public function LoaderAsset(_loader:ILoader)
		{
			this._loader=_loader;
		}
		
		public function get img():DisplayObject
		{
			return _img;
		}
		
		public function get data():*
		{
			return _data;
		}
		
		public function get xml():XML
		{
			return _xml;
		}
		
		public function setImg(value:DisplayObject, _loader:ILoader):void
		{
			if(this._loader===_loader)
				_img=value;
		}
		
		public function setData(value:*, _loader:ILoader):void
		{
			if(this._loader===_loader)
				_data=value;
		}
		
		public function setXml(value:XML, _loader:ILoader):void
		{
			if(this._loader===_loader)
				_xml=value;
		}
		
		public function kill():void
		{
			_img=null;
			_xml=null;
			_loader=null;
			_data=null;
		}

	}
}