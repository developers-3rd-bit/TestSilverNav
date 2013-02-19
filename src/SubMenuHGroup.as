package
{
   import com.greensock.TweenMax;
   
   import common.HalcyonHGroup;
   
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SubMenuHGroup extends HalcyonHGroup
   {
      private var _tween:TweenMax;
      
      public function SubMenuHGroup(reference:DisplayObjectContainer, width:Number=15, height:Number=15)
      {
         super(reference, width, height);
         this.addEventListener(MouseEvent.ROLL_OVER, onMouseOver, false, 0, true);
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseOut, false, 0, true);
      }
      
      private function onMouseOver(event:Event):void {
         _tween = TweenMax.to(this, .2, {colorMatrixFilter:{colorize:0x0000ff, amount:.5}});
      }
      
      private function onMouseOut(event:Event):void {
         if(_tween)
            _tween.reverse(false);
      }
   }
}