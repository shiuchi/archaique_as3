package jp.archaique.motion
{
	import org.goasap.GoEngine;
	import org.goasap.interfaces.IManageable;
	import org.goasap.managers.OverlapMonitor;

	internal class AbstractParameter implements IParameter, IManageable
	{
		
		protected var _target:*;
		protected var _active:Boolean=true;
		protected var _name:String;
		
		public function AbstractParameter( target:* )
		{
			_target=target;
		}

		public function init():void
		{
			GoEngine.getManager("OverlapMonitor").reserve(this);
		}
		
		public function onUpdate(_engine:TweenEngine):void
		{
		}
		
		public function kill():void
		{
			_target=null;
			_active=false;
			_name=null;
		}
		
		public function update(currentTime:Number):void
		{
		}
		
		public function get pulseInterval():int
		{
			return 0;
		}
		
		public function getActiveTargets():Array
		{
			return [_target];
		}
		
		public function getActiveProperties():Array
		{
			return [_name];
		}
		
		public function isHandling(properties:Array):Boolean
		{
			if (properties.indexOf(_name)>-1) 
				return true;
			else
				return false;
		}
		
		public function releaseHandling(...params):void
		{
			_active=false;
			GoEngine.getManager("OverlapMonitor").release(this);
		}
		
	}
}