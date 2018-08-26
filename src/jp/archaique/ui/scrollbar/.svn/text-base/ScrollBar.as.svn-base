package jp.archaique.ui.scrollbar
{
	import flash.events.MouseEvent;
	
	public class ScrollBar
	{
		protected var _dragger:IDragger;
		protected var _target:ScrollTarget;
		
		protected var _viewRation:Number;
		protected var _moveRation:Number;
		
		public function ScrollBar( _target:ScrollTarget,  _dragger:IDragger)
		{
			this._dragger=_dragger;
			this._target=_target;
			init();
		}
		
		private function init():void
		{
			//Draggerとtargetを初期化
			_dragger.init();
			_target.init();
			
			//表示比率
			_viewRation=_target.maskMc.height/_target.targtMc.height;
			_dragger.reSize(_viewRation);
			
			//移動率
			_moveRation=_target.targtMc.height/_dragger.activeRange;
			_dragger.addEventListener(MouseEvent.MOUSE_MOVE,activeScroll);	
		}
		
		protected function activeScroll(event:MouseEvent):void
		{
			var position:Number=Math.round((-_dragger.position*_moveRation))+_target.initialPosition;
			_target.activeScroll(position);
		}
		
		public function kill():void
		{
			_dragger.removeEventListener(MouseEvent.MOUSE_MOVE,activeScroll);
			_dragger.kill();
			_dragger=null;
			
			_target.kill();
			_target=null;
			
		}
		
	}
}