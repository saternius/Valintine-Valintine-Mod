﻿package {	import flash.display.*;	import flash.events.*;	public class Missile2 extends MovieClip {		public var bulletAngle:Number=0;		public var bulletSpeed:Number=10;		public var randomNum:Number=Math.random()*5-2.5;				public function Missile2() {			rotation=Math.random()*360;			this.addEventListener(Event.ENTER_FRAME, RotateCircle);		}		function RotateCircle(e:Event) {			rotation+=randomNum;			var bulletAnglez:Number = new Number(((bulletAngle+randomNum-90)*Math.PI/180));			var xSpeed:Number=new Number(Math.cos(bulletAnglez)*bulletSpeed);			var ySpeed:Number=new Number(Math.sin(bulletAnglez)*bulletSpeed);			this.x+=xSpeed;			this.y+=ySpeed;			if(this.hitTestObject(MovieClip(root).Jane)){				MovieClip(root).shake(scaleX*5,Math.random()*5,Math.random()*5,.7);				MovieClip(root).Hw-=75*scaleX;				selfDestruct();			}						if (x>750||x<-50||y>450||y<-50) {				selfDestruct();			}					}		function selfDestruct():void {			this.removeEventListener(Event.ENTER_FRAME, RotateCircle);			parent.removeChild(this);		}	}}