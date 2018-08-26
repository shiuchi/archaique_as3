package jp.archaique.btn
{
	import flash.utils.Dictionary;
	
	import jp.archaique.transition.ITransition;

	//------------------------------------------------------
	// TransitionBtnのtransitionの保管庫
	//------------------------------------------------------
	
	internal class BtnTransitionContainer
	{
		private var transitionDic:Dictionary=new Dictionary();
		
		private var _showTransitions:Array=[];
		private var _hideTransitions:Array=[];
		private var _overTransitions:Array=[];
		private var _outTransitions:Array=[];
		
		public function BtnTransitionContainer()
		{
		}
		
		//---------------------------------------------
		//  getter
		//---------------------------------------------
		
		public function get showTransitions():Array
		{
			return _showTransitions;
		}
		
		public function get hideTransitions():Array
		{
			return _hideTransitions;
		}
		
		public function get overTransitions():Array
		{
			return _overTransitions;
		}
		
		public function get outTransitions():Array
		{
			return _outTransitions;
		}
		
		//---------------------------------------------
		//  setter
		//---------------------------------------------
		
		public function set showTransition(transition:ITransition):void
		{
			addTransition(transition);
			_showTransitions.push(transition);
		}
		
		public function set hideTransition(transition:ITransition):void
		{
			addTransition(transition);
			_hideTransitions.push(transition);
		}
		
		public function set overTransition(transition:ITransition):void
		{
			addTransition(transition);
			_overTransitions.push(transition);
		} 
		
		public function set outTransition(transition:ITransition):void
		{
			addTransition(transition);
			_outTransitions.push(transition);
		}
		
		public function set showTransitions(transitions:Array):void
		{
			transitions.forEach(addTransition);
			_showTransitions=transitions;
		}
		
		public function  set hideTransitions(transitions:Array):void
		{
			transitions.forEach(addTransition);
			_hideTransitions=transitions;
		}
		
		public function set overTransitions(transitions:Array):void
		{
			transitions.forEach(addTransition);
			_overTransitions=transitions;
		} 
		
		public function set outTransitions(transitions:Array):void
		{
			transitions.forEach(addTransition);
			_outTransitions=transitions;
		}
		
		
		private function addTransition( item:ITransition, ...args):void
		{
			if(!transitionDic[item])
				transitionDic[item]=item;
		}
		
		public function kill():void
		{
			var transition:ITransition;
			for each ( transition in transitionDic)
			{
				transition.kill();
				delete transitionDic[transition];
			}
			
			transitionDic=null;
			_showTransitions=null;
			_hideTransitions=null;
			_overTransitions=null;
			_outTransitions=null;
		}
	}
}