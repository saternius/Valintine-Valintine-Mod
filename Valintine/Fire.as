package 
{

	import flash.display.*;
	import flash.events.*;

	public class Fire extends MovieClip
	{
		var riseSpeed:Number = Math.random()*3-1;
		var driftSpeed:Number= Math.random()*2-1;
		var rotSpeed:Number= Math.random()*6-3;


		public function Fire()
		{
			this.addEventListener(Event.ENTER_FRAME, blush);
		}
		function blush(e:Event):void{
			y-=riseSpeed;
			x+=driftSpeed;
			rotation+=rotSpeed;
			alpha-=.01;
			if(alpha<.05){
				this.removeEventListener(Event.ENTER_FRAME, blush);
				parent.removeChild(this);
			}
		}

	}
}