package jp.archaique.layout
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	
	public class ResizeLogic
	{
		
		private static var stage:Stage;
		
		public static function initialize(_stage:Stage):void
		{
			stage=stage;
		}
		
		//右寄
		public static function right( target:DisplayObject, params:Object ):void
		{
			var stageWidth:Number=stage.stageWidth;
			var marjinRight:Number=params["marjinRight"];
			target.x=stageWidth-(target["width"]+marjinRight);
		}
		
		//下
		public static function bottom( target:DisplayObject, params:Object ):void
		{
			var stageHeight:Number=stage.stageHeight;
			var marjinBottom:Number=params["marjinBottom"];
			target.y=stageHeight-target.height-marjinBottom;
		}
		
		//右に固定幅と下に固定幅
		public static function rightAndBottom( target:DisplayObject, params:Object ):void
		{
			right(target, params);
			bottom(target, params);
		}
		
		public static function rightAndCenterY(target:DisplayObject, params:Object):void
		{
			right(target, params);
			centerY(target, params);
		}
		
		//y座標center
		public static function centerY(target:DisplayObject, paramas:Object):void
		{
			target.y=Math.round((stage.stageHeight-target.height)/2);
		}
		
		//x座標center
		public static function centerX(target:DisplayObject, params:Object ):void
		{
			target.x=Math.round((stage.stageWidth-target.width)/2);
		}
		
		//中心揃え
		public static function center( target:DisplayObject, params:Object):void
		{
			centerX(target, params);
			centerY(target, params);
		}
		
		//widhtをstageWidthサイズに
		public static function widthFit( target:DisplayObject, params:Object ):void
		{
			var stageWidth:Number=stage.stageWidth;
			target.width=stageWidth;
		}
		
		//hightをstageHeightサイズに
		public static function heightFit( target:DisplayObject, params:Object ):void
		{
			var stageHeight:Number=stage.stageHeight;
			target.height=stageHeight;
		}
		
		//stageにfit
		public static function stageFit( target:DisplayObject, params:Object ):void
		{
			target.width=stage.stageWidth;
			target.height=stage.stageHeight;
		}
		
	}
}