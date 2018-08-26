package jp.archaique.btn
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import jp.archaique.transition.ITransitionBase;

	public class TransitionBtn extends AbstractTransitionBtn implements ITransitionBtn, ITransitionBase
	{
		
		public function TransitionBtn( target:DisplayObject , id:String)
		{
			super( target, id);
			container=new BtnTransitionContainer();
			transitionManager=new BtnTransitionManager(container);
		}
		
		
		override public function toString():String
		{
			return "[object TransitionBtn]";
		}
		
		//--------------------------------------
		//  public
		//--------------------------------------
		
		override public function show():void
		{
			if(showTransitions && _showTransitionVisible)
			{
				transitionManager.show();
			}
			super.show();
		}
		
		override public function hide():void
		{
			if(hideTransitions && _hideTransitionVisible)
			{
				transitionManager.hide();
			}
			super.hide();
		}
		
		override public function kill():void
		{
			super.kill();
		}
		
		override protected function onMouseOver(event:MouseEvent):void
		{
			super.onMouseOver(event);
			if(overTransitions && _overTransitionsVisible)
			{
				transitionManager.over();
			}
		}
		
		override protected function onMouseOut(event:MouseEvent):void
		{
			super.onMouseOut(event);
			if(outTransitions && _outTransitionsVisible)
			{
				transitionManager.out();
			}
		}

	}
}