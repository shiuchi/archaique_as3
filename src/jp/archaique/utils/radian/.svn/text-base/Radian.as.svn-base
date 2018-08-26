package jp.archaique.utils.radian
{
	import flash.geom.Point;
	
	public class Radian
	{
		/* 
		radianからdegree
		degreeからradian
		色々便利なライブラリになる予定
		 */
		public function Radian()
		{
		}
		
		//角度をラジアンに
		public static function convertToRadian(degree:Number):Number
		{
			var radian:Number=Math.PI/180*degree;
			return radian;
		}
		
		//ラジアンから角度に
		public static function convertToDegree(radian:Number):Number
		{
			var degree:Number=radian/(Math.PI*180);
			return degree;
		}
		
		//二点間のラジアンを求める
		public static function coordinatesToRadian(p1:Point,p2:Point):Number
		{
			var radian:Number=Math.atan2(p2.y-p1.y, p2.x-p1.x);
			return radian;
		}
		
		//二点間の角度を求める
		public static function coordinatesToDegree(p1:Point,p2:Point):Number
		{
			var radian:Number=coordinatesToRadian(p1,p2);
			var degree:Number=radian*180/Math.PI;
			
			return degree;
		}
	}
}