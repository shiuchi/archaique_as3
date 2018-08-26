package jp.archaique.text
{
	public class DoubleFaceFont
	{
		//二種類フォントを埋め込める--戻り値をhtmlTextとして使用する;
		public function DoubleFaceFont()
		{	
		}
		
		public static function run(txt:String, full_font:String, half_font:String):String
		{
				var f:String='<FONT FACE="'+full_font+'">';
				var f2:String='<FONT FACE="'+half_font+'">';
				var b:String='</FONT>';
				
				var len:int= txt.length;
				
				var full_flg:Boolean;
				var half_flg:Boolean;
				var convert_text:String="";
				var t:String;
				
				//文字すべてを調べる
				for(var i:int=0; i<len; i++){
					var txt_chip:Number=txt.substr(i,1).charCodeAt();
					//全角
					if((txt_chip>=0x0100)&&(full_flg==false)){
						if(convert_text!="")
						{
							convert_text+=b;
						}
						t=f+String.fromCharCode(txt_chip);
						half_flg=false;
						full_flg=true;
					}else if((txt_chip<=0x0100)&&(half_flg==false)){
						//半角
						if(convert_text!="")
						{
							convert_text+=b;
						}
						t=f2+String.fromCharCode(txt_chip);
						full_flg=false;
						half_flg=true;
					}else{
						t=String.fromCharCode(txt_chip);
					}
					
					if(i==len-1)
					{
						t+=b;
					}
					
					convert_text+=t;
				}
				
				return convert_text;
				
			
		}

	}
}