package jp.archaique.layout
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class Resize
	{
		
		private static var _instance:Resize;
		private var dic:Dictionary=new Dictionary();
		private var _stage:Stage;
		
		public function Resize( c:PrivateClass )
		{
		}
		
		public static function get instance():Resize
		{
			if(!_instance)
				_instance=new Resize(new PrivateClass());
			return _instance;
		}
		
		public function initialize(stage:Stage):void
		{
			_stage=stage;
			ResizeLogic.initialize(stage);
			_stage.addEventListener(Event.RESIZE, onResizeHandler, false, 0, true);
		}
		
		//登録
		public function register( target:DisplayObject, logic:Function, params:Object=null ):void
		{
			dic[target]=new ResizeInfo(target, logic, params);
		}
		
		//解除
		public function remove(target:DisplayObject):void
		{
			var item:ResizeInfo=dic[target] as ResizeInfo;
			if(item)
				item.kill();
			delete dic[target];
		}
		
		public function onResizeHandler( event:Event=null ):void
		{
			for each( var item:ResizeInfo in dic)
			{
				var logic:Function=item.logic;
				logic.apply(null , [item.target, item.params]);
				
			}
		}

	}
}
	import flash.display.DisplayObject;
	

class ResizeInfo
{
	
	private var _target:DisplayObject;
	private var _logic:Function;
	private var _params:Object;
	
	public function get target():DisplayObject { return _target; }
	public function get params():Object { return _params; }
	public function get logic():Function { return _logic; }
	
	public function ResizeInfo( target:DisplayObject, logic:Function, params:Object=null)
	{
		_target=target;
		_logic=logic;
		_params=params;
	}
	
	public function kill():void
	{
		_target=null;
		_logic=null;
		_params=null;
	}

}

class PrivateClass
{
}