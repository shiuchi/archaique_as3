package jp.archaique.utils.site
{
	
	/*
	//Siteに関すするUtilクラス 
	*/
	
	import flash.display.DisplayObject;
	
	public class SiteUtil
	{
		private static var _Instance:SiteUtil;
		private var _stg:DisplayObject;
		
		public function SiteUtil(c:privateClass)
		{
		}
		
		public static function get instance():SiteUtil
		{
			if (!_Instance)
				_Instance=new SiteUtil(new privateClass());
			
			return _Instance;
		}
			
		public function initialize(_stg:DisplayObject):void
		{
			if(!this._stg)
				this._stg=_stg;
		}
		
		
		//Localであるかどうか
		public function isLocal():Boolean
		{
			if(!_stg)
			{
				throw new Error("SiteUtils is not initialized");
				return ;
			}
			
			var url:String=_stg.root.loaderInfo.url;
			
			if(url.indexOf("http")==-1)
				return true;
			
			return false;
		}
		
		//指定したurl同じURLかどうか
		public function equalUrl(myurl:String):Boolean
		{
			if(!_stg)
			{
				throw new Error("SiteUtils is not initialized");
				return ;
				
			}
			
			var url:String=_stg.root.loaderInfo.url;
			
			if(url==myurl)
				return true;
			
			return false;
			
		}
		
		//指定したURlが含まれているか
		public function includeUrl(myurl:String):Boolean
		{
			if(!_stg)
			{
				throw new Error("SiteUtils is not initialized");
				return ;
			}
			
			var url:String=_stg.root.loaderInfo.url;
			
			if(url.indexOf(myurl)!=-1)
				return true;
			
			return false;
		}
		
		//設定したドメインを返します
		private var _domain:String="";
		
		public function get domain():String
		{
			return _domain;
		}
		
		public function set domain(value:String):void
		{
			_domain=value;
		}
		
		
	}
}

class privateClass
{
}