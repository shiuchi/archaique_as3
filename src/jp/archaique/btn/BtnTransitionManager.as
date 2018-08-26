package jp.archaique.btn
{
	import flash.events.EventDispatcher;
	
	import jp.archaique.transition.ITransition;

	//transitionに対して指示を出すクラス

	internal class BtnTransitionManager extends EventDispatcher
	{
		private var container:BtnTransitionContainer;
		
		public function BtnTransitionManager(container:BtnTransitionContainer)
		{
			this.container=container;	
		}
		
		public function show():void
		{
			container.showTransitions.forEach(transitionShow);
		}
		
		public function hide():void
		{
			container.hideTransitions.forEach(transitionHide);
		}
		
		public function over():void
		{
			container.overTransitions.forEach(transitionShow);
		}
		
		public function out():void
		{
			container.outTransitions.forEach(transitionHide);
		}
		
		private function transitionShow(item:ITransition, index:int, arr:Array):void
		{
			item.show();
		}
		
		private function transitionHide(item:ITransition, index:int, arr:Array):void
		{
			item.hide();
		}
		
		public function kill():void
		{
			container=null;
		}
	}
}