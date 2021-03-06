package jp.archaique.transition
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Point;

	public class FireTransition extends AbstractTransition implements ITransition
	{
		
		public static const SHOWED:String = "SHOWED";
		public static const HID:String = "HID";
		public static const KILLED:String = "KILLED";
		
		private var gradientMap:BitmapData;//DisplacementMapFilter様のBitmap
		private var offsets:Array =  [new Point(),new Point()];
		
		private const phaseRateX:int = 0;//横方向ゆらぎ速度
		private const phaseRateY:int = 2;//縦方向ゆらぎ速度
		
		private var _waveX:int = 1;//揺らぎのXの量ーーだんだんと増える
		private var _waveY:int = 1;//揺らぎのYの量
		private var _waveMaxX:int = 0;//揺らぎの最大値
		private var _waveMaxY:int = 5;//揺らぎの最大値
		
		private var colorArray:Array = [3,0,0,0,1, 3,0,0,0,-0x100, 3,0,0,0,-0x200, 0,0,0,1,0];
		private var cmf:ColorMatrixFilter = new ColorMatrixFilter(colorArray);
		private var dmf:DisplacementMapFilter = new DisplacementMapFilter(gradientMap, new Point(), 1, 1, _waveX, _waveY, DisplacementMapFilterMode.CLAMP, 0x00000000);
		private var blur:BlurFilter = new BlurFilter();
		
		private var noiseHiehgt:Number;
		private var showTween:TimelineMax;
		private var hideTween:TimelineMax;
		
		private var __state:String = HID;//このtransitionは内部的に別のstateを管理する必要がある
		
		public function FireTransition( target:Sprite, waveMaxX:int = 10, waveMaxY:int = 5, blurX:int = 6, blurY:int = 6, id:String = null, duration:Number = 0.5, delay:Number = 0, easing:Function = null, easeParams:Array = null)
		{
			super( target, id, duration, delay, easing, easeParams);
			
			//炎の揺らぎ設定
			_waveMaxX = waveMaxX;
			_waveMaxY = waveMaxY;
			
			//blur設定
			blur.blurX = blurX;
			blur.blurY = blurY;
			
			//ノイズの大きさ設定--4より小さければ、4にする 10以上なら9くらいに
			noiseHiehgt = Math.round(_target.height/20);
			if (noiseHiehgt<4)
				noiseHiehgt = 4;
			else if(noiseHiehgt>9)
				noiseHiehgt = 9;	
			
			//DisplacementMapFilter用のBitmaDateを作成
			gradientMap = new BitmapData( _target.width, _target.height, true, 0x00FFFFFF);	
		}
		
		
		
		public function get waveX():Number
		{
			return _waveX;
		}
		
		public function get waveY():Number
		{
			return _waveY;
		}
		
		public function set waveX(value:Number):void
		{
			_waveX = value;
		}
		
		public function set waveY(value:Number):void
		{
			_waveY = value;
		}
		
		
		override public function show():void
		{
			if (__state == FireTransition.SHOWED || __state == FireTransition.KILLED) return;
			if (hideTween != null) hideTween.clear();
			
			showTween = new TimelineMax();
			showTween.append(new TweenMax(_target, _duration/2, {colorMatrixFilter:{matrix:colorArray},blurFilter:{blurX:blur.blurX-2, blurY:blur.blurY-2}, delay:_delay, ease:_easing}));
			showTween.append(new TweenMax(this, _duration/2, {waveX:_waveMaxX, waveY:_waveMaxY, ease:_easing, onUpdate:enterFrameHandler, onComplete:ignition}));
			showTween.play();
			__state = FireTransition.SHOWED;
			super.show();
		}
		
		//----------------------------------------
		//   点火
		//----------------------------------------
		
		private function ignition():void
		{
			removeListener();
			_target.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			super.showed();
		}
		
		private function enterFrameHandler(event:Event = null):void
		{
			//DisplacementMapFilterの画像を上スクロール移動させる
			for (var i:int  =  0; i < 2; ++i)
			{
				offsets[i].x +=  phaseRateX;
				offsets[i].y +=  phaseRateY;
			}	
			//ノイズ作成
			gradientMap.perlinNoise(noiseHiehgt, noiseHiehgt, 2, 2, true, true, 7, true, offsets);
			applyFilter();		
		}
		
		//filter適応しなおす
		private function applyFilter():void
		{
			dmf.mapBitmap = gradientMap;
			dmf.scaleX = _waveX;
			dmf.scaleY = _waveY;
			_target.filters = [blur, cmf, dmf];
		}
		
		//----------------------------------------
		//   消火
		//----------------------------------------
		override public function hide():void
		{
			if (__state == FireTransition.HID || __state == FireTransition.KILLED) return;
						
			if (showTween != null) showTween.clear();
			removeListener();
			hideTween = new TimelineMax();
			hideTween.append(new TweenMax(this, _duration/2, {waveX:1, waveY:1, delay:_delay, ease:_easing, onUpdate:enterFrameHandler}));
			hideTween.append(new TweenMax(_target, _duration/2, {colorMatrixFilter:{matrix:null}, blurFilter:{blurX:0,blurY:0}, ease:_easing, onComplete:hid}));
			__state = FireTransition.HID;
			super.hide();
		}
		
		private function removeListener():void
		{
			if (_target == null) return;
			_target.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		override public function kill():void
		{
			if(showTween) showTween.clear();
			if(hideTween) hideTween.clear();
			 
			removeListener();	
			_waveX = NaN;
			_waveY = NaN;
			_waveMaxX = NaN;
			_waveMaxY = NaN;
			noiseHiehgt = NaN;
			
			gradientMap.dispose();
			gradientMap = null;
			
			dmf = null;
			blur = null;
			cmf = null;
			offsets = null;
			__state = FireTransition.KILLED;
			super.kill();
		}
	}
}