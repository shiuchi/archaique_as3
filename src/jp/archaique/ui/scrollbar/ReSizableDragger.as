package jp.archaique.ui.scrollbar
{
	import flash.display.Sprite;

	public class ReSizableDragger extends Dragger implements IDragger
	{
		public function ReSizableDragger(_img:Sprite, _activeRange:Number)
		{
			super(_img, _activeRange);
		}
		
		override public function reSize(raito:Number):void
		{
			if(raito<=1){
				var size:Number=activeRange*raito;
				var inside_size:Number=size-_img["top"].height-_img["bottom"].height;
				_img["inside"].height=inside_size;
				_img["top"].y=0;
				_img["inside"].y=_img["top"].height;
				_img["bottom"].y=_img["inside"].height+_img["inside"].y;
			}else{
				_img.visible=false;
			}
			
			_moveRect=makeActiveRect();
			
		}
		
	}
}