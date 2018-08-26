package jp.archaique.utils.date
{
	public class DateUtil
	{
		public function DateUtil()
		{
		}
		
		//指定されたDateの世界時からのミリ秒を返します
		public static function getUTC(_date:Date):Number
		{
			return (Date.UTC(_date.getFullYear(), _date.getMonth(), _date.getDate(), _date.getHours(), _date.getMinutes(), _date.getSeconds(), _date.getMilliseconds()))
		}
		
	}
}