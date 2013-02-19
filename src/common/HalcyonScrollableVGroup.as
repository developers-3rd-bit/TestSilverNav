package common
{
   import com.soma.ui.layouts.VBoxUI;
   import com.soma.ui.vo.GapUI;
   import com.soma.ui.vo.PaddingUI;
   
   import fl.containers.ScrollPane;
   import fl.controls.ScrollBar;
   import fl.controls.ScrollPolicy;
   
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class HalcyonScrollableVGroup extends Sprite
   {
      private var _scrollPane:ScrollPane;
      private var _vGroup:VBoxUI;
      private var _gapUI:GapUI;
      private var _paddingUI:PaddingUI;
      private var _initialHeight:Number;
      private var _currentHeight:Number;
      
      public function HalcyonScrollableVGroup(width:Number = 15, height:Number = 15)
      {
         super();
         _vGroup = new VBoxUI(this, width, height);
         _gapUI = new GapUI();
         _paddingUI = new PaddingUI();
         _initialHeight = height;
         _currentHeight = 0;
         _scrollPane = new ScrollPane();
         _scrollPane.width = width;
         _scrollPane.height = height;
         _scrollPane.verticalScrollPolicy = ScrollPolicy.ON;
         _scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         _scrollPane.source = _vGroup;
         super.addChild(_scrollPane);
      }
      
      public function get verticalScrollPolicy():String {
         return _scrollPane.verticalScrollPolicy;
      }
      
      public function set verticalScrollPolicy(value:String):void {
         _scrollPane.verticalScrollPolicy = value;
      }
      
      public function get horizontalScrollPolicy():String {
         return _scrollPane.horizontalScrollPolicy;
      }
      
      public function set horizontalScrollPolicy(value:String):void {
         _scrollPane.horizontalScrollPolicy = value;
      }
      
      public function get verticalScrollBar():ScrollBar {
         return _scrollPane.verticalScrollBar;
      }
      
      public function get horizontalScrollBar():ScrollBar {
         return _scrollPane.horizontalScrollBar;
      }
      
      public function get horizontalLineScrollSize():Number {
         return _scrollPane.horizontalLineScrollSize;
      }
      
      public function set horizontalLineScrollSize(value:Number):void {
         _scrollPane.horizontalLineScrollSize = value;
      }
      
      public function get verticalLineScrollSize():Number {
         return _scrollPane.verticalLineScrollSize;
      }
      
      public function set verticalLineScrollSize(value:Number):void {
         _scrollPane.verticalLineScrollSize = value;
      }
      
      public function get verticalPageScrollSize():Number {
         return _scrollPane.verticalPageScrollSize;
      }
      
      public function set verticalPageScrollSize(value:Number):void {
         _scrollPane.verticalPageScrollSize = value;
      }
      
      public function get horizontalPageScrollSize():Number {
         return _scrollPane.horizontalPageScrollSize;
      }
      
      public function set horizontalPageScrollSize(value:Number):void {
         _scrollPane.horizontalPageScrollSize = value;
      }
      
      override public function get numChildren():int {
         return _vGroup.numChildren;
      }
      
      override public function addChild(child:DisplayObject):DisplayObject {
         var displayObject:DisplayObject = _vGroup.addChild(child);
         _currentHeight += displayObject.height;
         if(_currentHeight >= _initialHeight)
            _vGroup.height = _currentHeight;
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
         return displayObject;
      }
      
      override public function addChildAt(child:DisplayObject, index:int):DisplayObject {
         var displayObject:DisplayObject = _vGroup.addChildAt(child, index);
         _currentHeight += displayObject.height;
         if(_currentHeight >= _initialHeight)
            _vGroup.height = _currentHeight;
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
         return displayObject;
      }
      
      override public function removeChild(child:DisplayObject):DisplayObject {
         var displayObject:DisplayObject = _vGroup.removeChild(child);
         _currentHeight -= displayObject.height;
         if(_currentHeight < _initialHeight) 
            _vGroup.height = _initialHeight;
         else
            _vGroup.height = _currentHeight;
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
         return displayObject;
      }
      
      override public function removeChildAt(index:int):DisplayObject {
         var displayObject:DisplayObject = _vGroup.removeChildAt(index);
         _currentHeight -= displayObject.height;
         if(_currentHeight < _initialHeight) 
            _vGroup.height = _initialHeight;
         else
            _vGroup.height = _currentHeight;
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
         return displayObject;
      }
      
      override public function removeChildren(beginIndex:int=0, endIndex:int=int.MAX_VALUE):void {
         _vGroup.removeChildren(beginIndex, endIndex);
         _currentHeight = 0;
         _vGroup.height = _initialHeight;
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
      }
      
      override public function getChildAt(index:int):DisplayObject {
         return _vGroup.getChildAt(index);
      }
      
      override public function getChildByName(name:String):DisplayObject {
         return _vGroup.getChildByName(name);
      }
      
      override public function getChildIndex(child:DisplayObject):int {
         return _vGroup.getChildIndex(child);
      }
      
      public function refresh():void {
         _vGroup.refresh();
      }
      
      public function set childrenAlign(value:String):void {
         _vGroup.childrenAlign = value;
         _vGroup.refresh();
      }
      
      public function set verticalGap(value:Number):void {
         _gapUI.vertical = value;
         _vGroup.childrenGap = _gapUI;
         _vGroup.refresh();
      }
      
      public function set horizontalgap(value:Number):void {
         _gapUI.horizontal = value;
         _vGroup.childrenGap = _gapUI;
         _vGroup.refresh();
      }
      
      public function set paddingLeft(value:Number):void {
         _paddingUI.left = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      public function set paddingRight(value:Number):void {
         _paddingUI.right = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      public function set paddingTop(value:Number):void {
         _paddingUI.top = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      public function set paddingBottom(value:Number):void {
         _paddingUI.bottom = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      public function set top(value:Number):void {
         _vGroup.top = value;
      }
      
      public function set bottom(value:Number):void {
         _vGroup.bottom = value;   
      }
      
      public function set left(value:Number):void {
         _vGroup.left = value;
      }
      
      public function set right(value:Number):void {
         _vGroup.right = value;  
      }
      
      public function deleteElement(vGroupElement:VGroupElement):void {
         for(var i:int=0;i<_vGroup.numChildren;i++) {
            var userContactEntry:VGroupElement = _vGroup.getChildAt(i) as VGroupElement;
            if(userContactEntry.elementId != vGroupElement.elementId) continue;
            _currentHeight -= _vGroup.getChildAt(i).height;
            if(_currentHeight < _initialHeight) 
               _vGroup.height = _initialHeight;
            else
               _vGroup.height = _currentHeight;
            _vGroup.removeChildAt(i);
            _vGroup..refresh();
            _scrollPane.update();
            _scrollPane.refreshPane();
            break;
         }
      }
   }
}