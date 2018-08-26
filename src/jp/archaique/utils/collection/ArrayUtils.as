package jp.archaique.utils.collection
{
	import flash.utils.ByteArray;
	
	public class ArrayUtils
	{
		public function ArrayUtils()
		{
			throw new Error("ArrayUtilsのインスタンスを作成することはできません");
		}
		
		//配列をshuffleします
		public static function shuffle(arr:Array):void
		{
			var n:int = arr.length;
            for (var i:int; i < n; i++)
            {
                var r:int = int(Math.random() * (n - i));
                arr.push(arr.splice(r, 1)[0]);
            }
		}
		
		//元の配列をディープコピーした配列を返します
		//SpriteやMovieClipはcopyできません
		public static function copy(arr:Array):Array
		{
			var clone:ByteArray=new ByteArray();
			clone.writeObject(arr);
			clone.position=0;
			return clone.readObject();
		}
		
		//元の配列から指定された数だけ、ランダムに要素を抜き出し、その要素を含む配列を返します。元の配列は変更されません。
		//元の配列の要素よりも多くの要素を抜き出す事はできません。その場合は元の配列が返されます
		public static function randomSplice(arr:Array, n:int):Array
		{
			if(arr.length<n)			
				return arr;

			var copy:Array=ArrayUtils.copy(arr);
			var new_arr:Array=[];
			while (new_arr.length!=n)
			{
				var random_num:Number=Math.floor(Math.random()*copy.length);
				new_arr.push(copy.splice(random_num,1));
			}
			
			return new_arr;
		}
		
	}
}