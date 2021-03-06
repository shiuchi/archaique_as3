package jp.archaique.transition
{	
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	
	public class MaskSlider extends AbstractTransition implements ITransition
	{
		protected var img:DisplayObject;
		protected var mask:Sprite;
		protected var _show_flg:Boolean;
		protected var _showType:String="L";
		
		
		public function get showType():String{ return _showType; }
		public function set showType( value:String ):void { _showType=value; }
		
		
		public function MaskSlider( target:DisplayObjectContainer, id:String = null , duraction:Number = 0.5, showType:String = "L", delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super( target, id, duraction, delay, easing, easeParams );
			_showType = showType;
			_target = target;
			img = target.getChildByName("img");
				
			mask = new Sprite();
			mask.graphics.beginFill(0xFFFFFF);
			mask.graphics.drawRect(0,0,img.width, img.height);
			target.addChild(mask);
			img.mask = mask;
			setMaskPoint();
		}

		override public function show():void
		{
			if(!_show_flg){
				TweenMax.killTweensOf(mask);		
				setMaskPoint();
				TweenMax.to(mask, _duration ,{x:0, y:0, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:showed});
				_show_flg = true;
				super.show();
			}	
		}
		
		override public function hide():void
		{
			
			if(_show_flg)
			{
				TweenMax.killTweensOf(mask);
				var point:Point = getMaskPoint();			
				TweenMax.to(mask, _duration ,{x:point.x, y:point.y, delay:_delay, ease:_easing, easeParams:_easeParams, onComplete:hid});
				_show_flg = false;
				super.hide();
			}
		}
		
		override public function kill():void
		{
			DisplayObjectContainer(_target).removeChild(mask);
			mask = null;
			img = null;
			_show_flg = false;
			super.kill();
		}
		
		
		//-----private-------------------------------------------------------
		
		private function setMaskPoint():void
		{
			switch(_showType)
			{
				case "L":
					mask.x = -(img.width);
					mask.y = 0
				break;
				case "R":
					mask.x = img.width;
					mask.y = 0;
				break;
				case "T":
					mask.x = 0;
					mask.y = -(img.height);
				break;
				case "B":
					mask.x = 0;
					mask.y = img.height;
				break;
			}
		}
		
		private function getMaskPoint():Point
		{
			
			var point:Point = new Point;
			switch(_showType)
			{
				case "L":
					point.x = -(img.width);
					point.y = 0
				break;
				case "R":
					point.x = img.width;
					point.y = 0;
				break;
				case "T":
					point.x = 0;
					point.y = -(img.height);
				break;
				case "B":
					point.x = 0;
					point.y = img.height;
				break;
			}
		
			return point;
			
		}
	}
}