package jp.archaique.utils.bitmap
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	
	/*
	//bitmap関連のutilクラス 
	*/
	
	public class BitmapUtils
	{
		public function BitmapUtils()
		{
		}
		
		//渡されたbmpにスムージングをかけます
		public static function smoothing(target:Bitmap):void
		{
			target.smoothing=true;	
		}
		
		//渡された配列内のbmpにスムージングをかけます
		public static function pluralSmoothing(arr:Array):void
		{
			var len:int=arr.length;
			for(var i:int=0; i<len; i++)
			{
				if (arr[i] is Bitmap)
					Bitmap(arr[i]).smoothing=true;
			}
		}
		
		//画像を切り抜きます。元の画像を加工します
		public static function regulation(bmp:Bitmap, rect:Rectangle):void
		{
			var bmd:BitmapData=new BitmapData(rect.width, rect.height);
			var m:Matrix=new Matrix(1, 0, 0, 1, -rect.x, -rect.y);

			bmd.draw(bmp,m, null, null,null);
			bmp.bitmapData.dispose();
			bmp.bitmapData=null;
			bmp.bitmapData=bmd;	
		}
		
		// 渡されたBitMapを複製したものを返します
		public static function copy( target:Bitmap ):Bitmap
		{
			var bmd:BitmapData=new BitmapData( target.width, target.height, true, 0x00FFFFFF );
			bmd.draw( target );
			return new Bitmap( bmd, PixelSnapping.AUTO, true);
		}
		
	}
}