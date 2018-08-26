package jp.archaique.btn
{
	import flash.display.DisplayObject;
	
	import jp.archaique.transition.ITransition;

	internal class AbstractTransitionBtn extends SimpleBtn implements ITransitionBtn
	{
		
		protected var _overTransitionsVisible:Boolean=true;
		protected var _outTransitionsVisible:Boolean=true;
		protected var _showTransitionVisible:Boolean=true;
		protected var _hideTransitionVisible:Boolean=true;
		
		protected var container:BtnTransitionContainer;
		protected var transitionManager:BtnTransitionManager;
		
		public function AbstractTransitionBtn( target:DisplayObject, id:String)
		{
			super( target, id);
		}
		
		
		override public function kill():void
		{
			_overTransitionsVisible=false;
			_outTransitionsVisible=false;
			_showTransitionVisible=false;
			_hideTransitionVisible=false;
			container.kill();
			transitionManager.kill();
			super.kill();
		}
		
		
		override public function toString():String
		{
			return "[object AbstractTransitionBtn]";
		} 
		
		
		//-------------------------------------------------
		//  getter
		//-------------------------------------------------
		
		
		public function get overTransitions():Array
		{
			return container.overTransitions;
		}
		
		public function get outTransitions():Array
		{
			return container.outTransitions;
		}
		
		public function get showTransitions():Array
		{
			return container.showTransitions;
		}
		
		public function get hideTransitions():Array
		{
			return container.hideTransitions;
		}
		
		
		//-------------------------------------------------
		//  getter visible
		//-------------------------------------------------
		
		
		public function get showTransitionVisible():Boolean
		{
			return _showTransitionVisible;
		}
		
		public function get hideTransitionVisible():Boolean
		{
			return _hideTransitionVisible;
		}
		
		public function get overTransitionsVisible():Boolean
		{
			return _overTransitionsVisible;
		}
		
		public function get outTransitionsVisible():Boolean
		{
			return _outTransitionsVisible;
		}
	
		
		//-------------------------------------------------
		//  setter
		//-------------------------------------------------
		
		public function set showTransition(value:ITransition):void
		{
			container.showTransition=value;
		}
		
		public function set hideTransition(value:ITransition):void
		{
			container.hideTransition=value;
		}
		
		public function set overTransition(value:ITransition):void
		{
			container.overTransition=value;;
		}
		
		public function set outTransition(value:ITransition):void
		{
			container.outTransition=value;
		}
		
		
		
		public function set showTransitions(value:Array):void
		{
			container.showTransitions=value;
		}
		
		public function set hideTransitions(value:Array):void
		{
			container.hideTransitions=value;
		}
		
		public function set overTransitions(value:Array):void
		{
			container.overTransitions=value;
		}
		
		public function set outTransitions(value:Array):void
		{
			container.outTransitions=value;
		}
		
		
		
		
		public function set overTransitionsVisible(value:Boolean):void
		{
			_overTransitionsVisible=value;
		}
		
		public function set outTransitionsVisible(value:Boolean):void
		{
			_outTransitionsVisible=value;
		}
		
		public function set showTransitionVisible(value:Boolean):void
		{
			_showTransitionVisible=value;
		}
		
		public function set hideTransitionVisible(value:Boolean):void
		{
			_hideTransitionVisible=value;
		}
		
		public function set overAndOutTransitions(value:Array):void
		{
			container.outTransitions=value;
			container.overTransitions=value;
		}
		
		public function set showAndHideTransitions(value:Array):void
		{
			container.showTransitions=value;
			container.hideTransitions=value;
		}
		
		public function set overAndOutTransition(value:ITransition):void
		{
			container.outTransition=value;
			container.overTransition=value;
		}
		
		public function set showAndHideTransition(value:ITransition):void
		{
			container.showTransition=value;
			container.hideTransition=value;
		}
		
		
	}
}