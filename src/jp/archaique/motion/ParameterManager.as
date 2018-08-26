package jp.archaique.motion
{
	import org.goasap.GoEngine;
	import org.goasap.managers.OverlapMonitor;
	
	internal class ParameterManager
	{
		
		private var _parameters:Array=[];
		
		public function ParameterManager()
		{
			//このクラスではOverlapMonitorをGoEngineに登録するだけーー登録、解放は個々のパラメーター内部で行う
		}
		
		public function addParameter( parameter:IParameter ):void
		{
			_parameters.push( parameter );
		}
		
		public function init():void
		{
			if(!GoEngine.getManager("OverlapMonitor"))
				GoEngine.addManager(new OverlapMonitor());
			_parameters.forEach(initProcessing);
		}
		
		private function initProcessing( item:XTO, index:int, arr:Array ):void
		{
			item.init();
		}
		
		public function kill():void
		{
			_parameters.forEach(killProcessing);
			GoEngine.removeManager("OverlapMonitor");
			_parameters=null;
		}
		
		private function killProcessing(item:IParameter, index:int, arr:Array):void
		{
			item.kill();
		}
		
		
		public function onUpdate( _engine:TweenEngine ):void
		{
			var i:int;
			var m:int=_parameters.length;
			for( i; i<m; i++ )
			{
				var item:IParameter=_parameters[i];
				item.onUpdate(_engine);
			}
		}
		
	}
}