package jp.archaique.utils.display
{
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
		
	public class DisplayShortCut
	{
		public function DisplayShortCut()
		{
		}
		
		//displayObjectに着色を適用します。alphaは_targetに設定されている値をそのまま引き継ぎます
		public static function tint( target:DisplayObject, color:uint):void
		{
			var c:ColorTransform=new ColorTransform();
			c.color=color;
			c.alphaMultiplier=target.transform.colorTransform.alphaMultiplier;
			c.alphaOffset=target.transform.colorTransform.alphaOffset;
			target.transform.colorTransform=c;
		}
		
		//targetのdisplayObjectにblurを適応します
		public static function blurFilter( target:DisplayObject, blurX:Number=4, blurY:Number=4, quality:int=1 ):void
		{
			var filters:Array=target.filters;
			var blurFilter:BlurFilter;
			//まず、既にfilterがないか調べる fliterが存在するのならその値を変更する
			if(searchFilter(filters, BlurFilter ))
			{
				blurFilter=getFilter(filters, BlurFilter) as BlurFilter;
			}
			else
			{
				blurFilter=new BlurFilter();
				filters.push(blurFilter);
			}
			
			blurFilter.blurX=blurX;
			blurFilter.blurY=blurY;
			blurFilter.quality=quality;
			target.filters=filters;	
		}
		
		//targetのdisplayObjectにColorMatrixFilterを適応します
		public static function colorMatrixFilter( target:DisplayObject, arr:Array):void
		{
			var filters:Array=target.filters;
			var colorMatrixFilter:ColorMatrixFilter;
			
			if(searchFilter( filters, ColorMatrixFilter ))
			{
				colorMatrixFilter=getFilter(filters, ColorMatrixFilter) as ColorMatrixFilter;
			}
			else
			{
				colorMatrixFilter=new ColorMatrixFilter();
				filters.push(colorMatrixFilter);
			}
			
			colorMatrixFilter.matrix=arr;
			target.filters=filters;
			
		}
		
		//配列内に対象となるfilterが存在しているかを調べます
		private static function searchFilter( filters:Array, filterName:Class ):Boolean
		{
			var m:int=filters.length;
			for ( var i:int=0; i<m; i++ )
			{
				if (filters[i] is filterName )
				{
					return true;
				}
			}
			return false;
		}
		
		//配列内から対象となるfilterを返します--不細工なのでいつか修正しないと
		private static function getFilter( filters:Array, filterName:Class ):BitmapFilter
		{
			 var m:int=filters.length;
			for (var i:int=0; i<m; i++ )
			{
				if (filters[i] is filterName )
				{
					var f:BitmapFilter=filterName(filters[i]);
					return f;
				}
			}
			
			//対象となるfilterが存在しなければ、BitmapFilterを返す
			return new filterName(); 
		}
		
	}
}