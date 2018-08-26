package jp.archaique.motion
{
	import org.goasap.interfaces.IManageable;

	internal class XTO extends AbstractParameter implements IParameter, IManageable
	{
		private var _startX:Number;
		private var _changeX:Number;
		private var _useRelative:Boolean;
		private var _x:Number;
		
		private var _idd:String;
		
		public function XTO( target:*, idd:String, x:Number, useRelative:Boolean )
		{
			super(target);
			_x=x;
			_useRelative=useRelative;
			_name="x";
			_idd=idd;
		}
		
		override public function init():void
		{
			super.init();
			trace(_idd);
			_startX=_target.x;
			_changeX=(_useRelative ? _x : _x - _startX); 
			if(_changeX==0)
				_active=false;
		}
		
		override public function onUpdate(_engine:TweenEngine):void
		{
			if(_active)
				_target.x= _engine.correctValue( _startX + _changeX * _engine.position );
			
			super.onUpdate(_engine);	
		}
		
		override public function kill():void
		{
			_startX=NaN;
			_changeX=NaN;
			_useRelative=false;
			_x=NaN;
			super.kill();
		}
	}
}