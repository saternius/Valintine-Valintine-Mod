
package {

	import flash.display.*;
	import flash.events.*;

	public class Missile4 extends MovieClip {
		public var bulletAngle:Number=0;
		public var bulletSpeed:Number=10;
		public var destX:Number=0;
		public var destY:Number=0;
		public var startX:Number=0;
		public var startY:Number=0;
		public var bezierX:Number=Math.random()*200;
		public var bezierY:Number=Math.random()*200;

		public var randomNum:Number=Math.random()*5-2.5;
		var t:Number=0;
		var decay:Number=0;
		public function Missile4() {
			rotation=Math.random()*360;
			this.addEventListener(Event.ENTER_FRAME, RotateCircle);

		}
		function RotateCircle(e:Event) {
			rotation+=randomNum;
			if (this.hitTestObject(MovieClip(root).Jane)) {
				MovieClip(root).shake(scaleX*5,Math.random()*5,Math.random()*5,1.25);
				MovieClip(root).Hw-=90*scaleX;
				selfDestruct();
			}
			if (t<1) {
				t+=.01;
			} else {

				var hearts:Number=8;
				var pos:Number=0;
				while (hearts>0) {
					hearts--;
					var shards:MovieClip = new Missile2();

					shards.scaleX=.3;
					shards.scaleY=.3;
					shards.x=x;
					shards.y=y;
					shards.bulletAngle=(360/8)*pos;
					shards.bulletSpeed=5;
					pos++;
					parent.addChild(shards);
					/*
					if (MovieClip(root).images[3]!=0) {
						while (shards.numChildren) {
							shards.removeChildAt(0);
						}
						var bit:Bitmap=new Bitmap(MovieClip(root).images[3]);
						bit.width=40;
						bit.height=40;
						shards.addChild(bit);
					}*/

				}
				selfDestruct();
			}
			x = (int) (  (1-t)*(1-t)*startX + 2*(1-t)*t*bezierX+t*t*destX);
			y = (int) (  (1-t)*(1-t)*startY + 2*(1-t)*t*bezierY+t*t*destY);



		}
		function selfDestruct():void {
			this.removeEventListener(Event.ENTER_FRAME, RotateCircle);
			parent.removeChild(this);
		}
	}
}