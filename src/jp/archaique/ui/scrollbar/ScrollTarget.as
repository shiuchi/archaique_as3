package jp.archaique.ui.scrollbar
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class ScrollTarget extends AbstractScrollTarget implements IScrollTarget
	{
		protected var _visibleRect:Rectangle;
		protected var _img:Sprite;
		
		public function ScrollTarget( _targtMc:Sprite, _visibleRect:Rectangle)
		{
			this._visibleRect=_visibleRect;
			this._img=_targtMc.getChildByName("img") as Sprite;
			super(_targtMc);
		}
		
		
		override internal function init():void
		{
			_maskMc=makeMaskMc();
			_targtMc.addChild(_maskMc);
			_img.mask=_maskMc;
			_initialPosition=_img.y;
		}
		
		override internal function kill():void
		{
			_visibleRect=null;
			_targtMc.removeChild(_maskMc);
		}
		
		override internal function activeScroll(position:Number, duraction:Number=0, easing:Function=null):void
		{
			TweenLite.killTweensOf(_img);
			TweenLite.to(_img, duraction, {y:position, ease:easing});
		}
		
		private function makeMaskMc():Sprite
		{
			var mask:Sprite=new Sprite();
			mask.graphics.beginFill(0xffffff,0);
			mask.graphics.drawRect(0,0, _visibleRect.width, _visibleRect.height);
			return mask;
		}
		
	}
}