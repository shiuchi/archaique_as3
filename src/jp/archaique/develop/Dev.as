package jp.archaique.develop
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	public class Dev
	{
		private static var _Instance:Dev;
		private static var _root:Sprite;
		private static var initialize_flg:Boolean;
		
		//fps
		private var field:TextField;
		private var draw_count:int=0;
		private var old_timer:Number=getTimer();
		
		
		
		public function Dev(c:PrivateClass)
		{
		}
		
		public static function initialize( root:Sprite ):void
		{
			if(initialize_flg)
				return;
					
					
			_root=root;
			initialize_flg=true;
		}
		
		public static function get instance():Dev
		{
			if(!_Instance)
				_Instance=new Dev(new PrivateClass());
			
			return _Instance;
		}
		
		//-----Fps---------------------------------------------------------------------------
		
		public function Fps():void
		{
			if(!initialize_flg)
				throw new Error("Please call Dev initialize");
				
			field=new TextField();
			field.width=30;
			field.height=20;
			field.border=true;
			field.backgroundColor=0xffffff;
			field.background=true;
			_root.addChild(field);
			_root.addEventListener(Event.ENTER_FRAME,fpsProcessing);
		}
		
		//-------insideProcessing--------------------------------------------------------
		
		private function fpsProcessing(e:Event):void
		{
			draw_count+=1;
			if(getTimer()-old_timer >= 1000){
				field.text=String(draw_count);
				old_timer=getTimer();
				draw_count=0;
			}	
		}
		

	}
}

class PrivateClass
{
}