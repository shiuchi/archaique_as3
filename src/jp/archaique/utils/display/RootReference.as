package jp.archaique.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	
	public class RootReference
	{
		private static var _instance:RootReference;
		private var _root:DisplayObject;
		
		public function RootReference( c:PrivateClass )
		{
		}
		
		public static function get instance():RootReference
		{
			if (!_instance)
				_instance=new RootReference( new PrivateClass() );
			
			return _instance;
		}
		
		public function initialize( value:DisplayObject ):Boolean
		{
			if (!_root)
			{
				_root=value;
				return true;
			}
			
			return false;
			
		}
		
		public function get root():DisplayObject
		{
			if (!_root)
				throw new Error( "RootReference is not initialized" );

			return _root;
		}
		
		public function get stage():Stage
		{
			if (!_root)
				throw new Error( "RootReference is not initialized" );
			
			return _root.stage;
		}
		
		public function isRoot( value:DisplayObject ):Boolean
		{
			if (!value.loaderInfo.applicationDomain.parentDomain)
				return true;
			else
				return false;
		}
		
	}
}

class PrivateClass{}